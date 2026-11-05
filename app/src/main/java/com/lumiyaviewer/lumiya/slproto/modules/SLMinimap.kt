package com.lumiyaviewer.lumiya.slproto.modules

import android.graphics.Bitmap
import android.graphics.Color
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue
import com.lumiyaviewer.lumiya.slproto.handler.SLEventQueueMessageHandler
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.messages.CoarseLocationUpdate
import com.lumiyaviewer.lumiya.slproto.messages.ParcelOverlay
import com.lumiyaviewer.lumiya.slproto.modules.voice.SLVoice
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.ArrayList
import java.util.Arrays
import java.util.HashSet
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

open class SLMinimap(agentCircuit: SLAgentCircuit) : SLModule(agentCircuit) {

    companion object {
        /** Parcel overlay cells per region: 64 x 64 cells of 4 m (256 m region). */
        const val PARCEL_OVERLAY_CELLS: Int = 4096
        const val CHAT_RANGE: Float = 20.0f
        const val parcelBitmapSize: Int = 256
        const val parcelDataSize: Int = 64
        private const val parcelOverlayFlagBorderSouth: Byte = (-128).toByte()
        private const val parcelOverlayFlagBorderWest: Byte = 64
        private const val parcelOverlayFlagPrivate: Byte = 32
        private const val parcelOverlayTypeAuction: Byte = 5
        private const val parcelOverlayTypeForSale: Byte = 4
        private const val parcelOverlayTypeMask: Byte = 15
        private const val parcelOverlayTypeOwnedByGroup: Byte = 2
        private const val parcelOverlayTypeOwnedByOther: Byte = 1
        private const val parcelOverlayTypeOwnedBySelf: Byte = 3
        private const val parcelOverlayTypePublic: Byte = 0
        private const val parcelUpsampleFactor: Int = 4
    }

    private var afterTeleport: Boolean = false
    private var chatRangeUsersCount: Int = 0

    @Volatile
    private var minimapBitmap: MinimapBitmap = MinimapBitmap(256, 256)
    private var myAvatarParcelDataIndex: Int = -1

    @Volatile
    private var myAvatarPosition: ImmutableVector? = null
    private var nearbyUsersCount: Int = 0
    private val parcelIDs: IntArray = IntArray(PARCEL_OVERLAY_CELLS)
    private val parcels: MutableMap<Int, ParcelData> = ConcurrentHashMap()
    private val userLocationRequestHandler: RequestHandler<SubscriptionSingleKey>
    private val userLocationsResultHandler: ResultHandler<SubscriptionSingleKey, UserLocations>?
    private val userManager: UserManager?
    private val userPositions: MutableMap<UUID, UserLocation> = ConcurrentHashMap(1, 0.75f, 2)
    private val receivedSequences: MutableSet<Int> = ConcurrentHashMap.newKeySet()

    data class MapLoadingProgress(
        val sequenceCount: Int = 0,
        val lastSequenceId: Int = -1,
        val receivedSequences: Set<Int> = emptySet(),
        val isComplete: Boolean = false,
        val isError: Boolean = false
    )

    open class MinimapBitmap {
        val bitmapWidth: Int
        val bitmapHeight: Int
        val colors: IntArray

        constructor(bitmapWidth: Int, bitmapHeight: Int) {
            this.bitmapWidth = bitmapWidth
            this.bitmapHeight = bitmapHeight
            this.colors = IntArray(bitmapWidth * bitmapHeight)
        }

        constructor(minimapBitmap: MinimapBitmap, xOffset: Int, yOffset: Int, patchColors: IntArray) {
            this.bitmapWidth = minimapBitmap.bitmapWidth
            this.bitmapHeight = minimapBitmap.bitmapHeight
            this.colors = Arrays.copyOf(minimapBitmap.colors, minimapBitmap.colors.size)
            System.arraycopy(patchColors, 0, this.colors, (this.bitmapHeight * yOffset) + xOffset, patchColors.size)
        }

        fun makeBitmap(): Bitmap {
            return Bitmap.createBitmap(this.colors, this.bitmapWidth, this.bitmapHeight, Bitmap.Config.ARGB_8888)
        }

        fun updateBitmap(bitmap: Bitmap) {
            bitmap.setPixels(this.colors, 0, this.bitmapWidth, 0, 0, this.bitmapWidth, this.bitmapHeight)
        }
    }

    open class UserLocation(
        val chatterID: ChatterID,
        @Volatile var location: ImmutableVector
    ) {
        @Volatile var distance: Float = Float.NaN
    }

    open class UserLocations(
        val myAvatarPosition: ImmutableVector?,
        val myAvatarHeading: Float,
        val userPositions: Map<UUID, UserLocation>
    )

    init {
        this.nearbyUsersCount = 0
        this.chatRangeUsersCount = 0
        this.myAvatarPosition = null
        this.afterTeleport = false
        this.myAvatarParcelDataIndex = -1

        this.userLocationRequestHandler = SimpleRequestHandler<SubscriptionSingleKey> { key ->
            userLocationsResultHandler?.onResultData(
                key,
                UserLocations(myAvatarPosition, getMyAvatarHeading(), userPositions)
            )
        }

        this.userManager = UserManager.getUserManager(agentCircuit.circuitInfo.agentID)
        this.userLocationsResultHandler = this.userManager?.getUserLocationsPool()?.attachRequestHandler(userLocationRequestHandler)

        val authReply = agentCircuit.getAuthReply()
        this.afterTeleport = if (authReply != null && authReply.fromTeleport) !authReply.isTemporary else false
        this.userManager?.getMapLoadingProgressPool()?.setData(SubscriptionSingleKey.Value, MapLoadingProgress(0, -1, emptySet(), false, false))
    }

    fun getMyAvatarHeading(): Float {
        return (agentCircuit.getModules().avatarControl.getAgentHeading() * Math.PI.toFloat()) / 180.0f
    }

    private fun getParcelDataIndex(immutableVector: ImmutableVector): Int {
        var floorX = Math.floor((immutableVector.getX() * 64.0) / 256.0).toInt()
        var floorY = Math.floor((immutableVector.getY() * 64.0) / 256.0).toInt()
        if (floorX < 0) {
            floorX = 0
        } else if (floorX >= 64) {
            floorX = 63
        }
        if (floorY < 0) {
            floorY = 0
        } else if (floorY >= 64) {
            floorY = 63
        }
        return (floorY * 64) + floorX
    }

    fun updateAvatarParcelData() {
        val parcelData: ParcelData? = if (myAvatarParcelDataIndex >= 0 && myAvatarParcelDataIndex < parcelIDs.size) {
            parcels[parcelIDs[myAvatarParcelDataIndex]]
        } else null

        if (parcelData != null && afterTeleport) {
            afterTeleport = false
            userManager?.getChatterList()?.getActiveChattersManager()?.notifyTeleportComplete(parcelData.getName())
        }

        val voice: SLVoice = agentCircuit.getModules().voice
        if (parcelData != null) {
            voice.setCurrentParcel(parcelData.getParcelID())
        }

        userManager?.setCurrentLocationInfo(
            CurrentLocationInfo.create(
                parcelData,
                nearbyUsersCount,
                chatRangeUsersCount,
                voice.getCurrentParcelVoiceChannel()
            )
        )
    }

    override fun HandleCloseCircuit() {
        if (userManager != null) {
            userManager.getUserLocationsPool().detachRequestHandler(userLocationRequestHandler)
        }
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun HandleCoarseLocationUpdate(coarseLocationUpdate: CoarseLocationUpdate) {
        var myPositionChanged = false
        var userListChanged = false

        val initialParcelData: ParcelData? = if (myAvatarParcelDataIndex >= 0 && myAvatarParcelDataIndex < parcelIDs.size) {
            parcels[parcelIDs[myAvatarParcelDataIndex]]
        } else null

        val seenAgentUUIDs = HashSet<UUID>(coarseLocationUpdate.Location_Fields.size)
        var currentParcelData: ParcelData? = initialParcelData
        var modifiedAgentUUIDs: MutableSet<UUID>? = null

        val locSize = coarseLocationUpdate.Location_Fields.size
        val agentSize = coarseLocationUpdate.AgentData_Fields.size
        val limit = Math.min(locSize, agentSize)

        for (i in 0 until limit) {
            val location = coarseLocationUpdate.Location_Fields[i]
            val newPos = ImmutableVector(location.X.toFloat(), location.Y.toFloat(), (location.Z * 4).toFloat())

            if (i == coarseLocationUpdate.Index_Field.You) {
                if (!Objects.equal(newPos, myAvatarPosition)) {
                    myAvatarPosition = newPos
                    val newParcelIndex = getParcelDataIndex(myAvatarPosition!!)
                    if (newParcelIndex != myAvatarParcelDataIndex) {
                        myAvatarParcelDataIndex = newParcelIndex
                        if (myAvatarParcelDataIndex >= 0 && myAvatarParcelDataIndex < parcelIDs.size) {
                            currentParcelData = parcels[parcelIDs[myAvatarParcelDataIndex]]
                        }
                        myPositionChanged = true
                    } else {
                        myPositionChanged = true
                    }
                }
            } else {
                val agentData = coarseLocationUpdate.AgentData_Fields[i]
                val agentID = agentData.AgentID
                if (agentID != null && !UUIDPool.ZeroUUID.equals(agentID)) {
                    val existingLoc = userPositions[agentID]
                    var posChanged = false
                    if (existingLoc != null) {
                        if (!newPos.equals(existingLoc.location)) {
                            existingLoc.location = newPos
                            posChanged = true
                        }
                    } else {
                        val userID = userManager?.getUserID() ?: UUIDPool.ZeroUUID
                        val chatterID = ChatterID.getUserChatterID(userID, agentID)
                        userPositions[agentID] = UserLocation(chatterID, newPos)
                        posChanged = true
                        userListChanged = true
                    }

                    if (posChanged) {
                        if (modifiedAgentUUIDs == null) {
                            modifiedAgentUUIDs = HashSet()
                        }
                        modifiedAgentUUIDs.add(agentID)
                    }
                    seenAgentUUIDs.add(agentID)
                }
            }
        }

        val it = userPositions.keys.iterator()
        while (it.hasNext()) {
            val uuid = it.next()
            if (!seenAgentUUIDs.contains(uuid)) {
                it.remove()
                if (modifiedAgentUUIDs == null) {
                    modifiedAgentUUIDs = HashSet()
                }
                modifiedAgentUUIDs.add(uuid)
                userListChanged = true
            }
        }

        var distancesUpdated = false
        val myPos = myAvatarPosition
        if (myPos != null) {
            if (myPositionChanged) {
                for (userLoc in userPositions.values) {
                    userLoc.distance = myPos.distanceTo(userLoc.location)
                }
                distancesUpdated = true
            } else if (modifiedAgentUUIDs != null) {
                for (uuid in modifiedAgentUUIDs) {
                    val userLoc = userPositions[uuid]
                    if (userLoc != null) {
                        userLoc.distance = myPos.distanceTo(userLoc.location)
                    }
                }
                distancesUpdated = true
            }
        }

        var countChanged = false
        if (distancesUpdated || userListChanged) {
            var chatRangeCount = 0
            for (userLoc in userPositions.values) {
                if (userLoc.distance <= CHAT_RANGE) {
                    chatRangeCount++
                }
            }
            if (chatRangeCount != chatRangeUsersCount) {
                chatRangeUsersCount = chatRangeCount
                countChanged = true
            }
            if (nearbyUsersCount != userPositions.size) {
                nearbyUsersCount = userPositions.size
                countChanged = true
            }
        }

        if (currentParcelData != initialParcelData || countChanged) {
            requestUpdateAvatarParcelData()
        }

        val chatterList = userManager?.getChatterList()
        if (userListChanged) {
            chatterList?.updateList(ChatterListType.Nearby)
        }

        if (myPositionChanged) {
            chatterList?.updateDistanceToAllUsers()
        } else if (modifiedAgentUUIDs != null) {
            for (uuid in modifiedAgentUUIDs) {
                chatterList?.updateDistanceToUser(uuid)
            }
        }

        if (myPositionChanged || modifiedAgentUUIDs != null) {
            userManager?.getUserLocationsPool()?.requestUpdate(SubscriptionSingleKey.Value)
        }
    }

    @SLMessageHandler
    fun HandleParcelOverlay(parcelOverlay: ParcelOverlay) {
        Debug.Log("ParcelOverlay: SequenceID = " + parcelOverlay.ParcelData_Field.SequenceID)
        val bArr = parcelOverlay.ParcelData_Field.Data
        val length = bArr.size / 64
        val ints = IntArray(length * 4 * 64 * 4)
        var i2 = 0
        for (j in 0 until length) {
            val i4 = j + (parcelOverlay.ParcelData_Field.SequenceID * 16)
            for (k in 0 until 64) {
                val i = i2
                var i7 = 0
                when (bArr[i].toInt() and 15) {
                    0 -> i7 = Color.rgb(0, 192, 0)
                    1 -> i7 = Color.rgb(32, 128, 32)
                    2 -> i7 = Color.rgb(0, 128, 128)
                    3 -> i7 = Color.rgb(0, 255, 255)
                    4 -> i7 = Color.rgb(128, 128, 0)
                    5 -> i7 = Color.rgb(255, 255, 0)
                }
                if ((bArr[i].toInt() and 32) != 0) {
                    var red = Color.red(i7)
                    var green = Color.green(i7)
                    var blue = Color.blue(i7)
                    var i8 = red + 64
                    if (i8 >= 255) {
                        val i9 = i8 - 255
                        i8 -= i9
                        green -= i9
                        blue -= i9
                        if (green < 0) green = 0
                        if (blue < 0) blue = 0
                    }
                    i7 = Color.rgb(i8, green, blue)
                }
                for (pixelY in 0 until 4) {
                    val rowOffset = ((((length * 4) - 1) - ((j * 4) + pixelY)) * 256) + (k * 4)
                    for (pixelX in 0 until 4) {
                        val hideBorder = (pixelY != 0 || i4 == 0 || (bArr[i].toInt() and 0x80) == 0) &&
                                         (pixelX != 0 || k == 0 || (bArr[i].toInt() and 64) == 0)
                        ints[rowOffset + pixelX] = if (hideBorder) i7 else -1
                    }
                }
                i2 = i + 1
            }
        }
        val sequenceID = parcelOverlay.ParcelData_Field.SequenceID
        minimapBitmap = MinimapBitmap(minimapBitmap, 0, (3 - sequenceID) * 64, ints)
        userManager?.getMinimapBitmapPool()?.setData(SubscriptionSingleKey.Value, minimapBitmap)

        receivedSequences.add(sequenceID)
        val progress = MapLoadingProgress(
            sequenceCount = receivedSequences.size,
            lastSequenceId = sequenceID,
            receivedSequences = HashSet(receivedSequences),
            isComplete = receivedSequences.size >= 4,
            isError = false
        )
        userManager?.getMapLoadingProgressPool()?.setData(SubscriptionSingleKey.Value, progress)
    }

    @SLEventQueueMessageHandler(eventName = SLCapEventQueue.CapsEventType.ParcelProperties)
    fun HandleParcelProperties(event: LLSDNode) {
        var avatarParcelChanged = false
        try {
            val parcelDataArray = event.byKey("ParcelData")
            val count = parcelDataArray.count
            for (i in 0 until count) {
                val parcelNode = parcelDataArray.byIndex(i)
                try {
                    val parcelData = ParcelData(parcelNode)
                    val parcelID = parcelData.getParcelID()
                    parcels[parcelID] = parcelData
                    val bitmap = parcelData.getParcelBitmap()
                    if (bitmap != null) {
                        val len = Math.min(bitmap.size, parcelIDs.size)
                        for (cell in 0 until len) {
                            if (bitmap[cell]) {
                                parcelIDs[cell] = parcelID
                                if (cell == myAvatarParcelDataIndex) {
                                    avatarParcelChanged = true
                                }
                            }
                        }
                    }
                } catch (e: LLSDException) {
                    Debug.Warning(e)
                }
            }
        } catch (e: LLSDException) {
            Debug.Warning(e)
        }

        if (avatarParcelChanged) {
            requestUpdateAvatarParcelData()
        }
    }

    fun getDistanceToUser(uuid: UUID?): Float? {
        if (uuid == null) {
            return null
        }
        val userLocation = userPositions[uuid]
        return userLocation?.distance ?: Float.NaN
    }

    fun getNearbyAgentLocation(uuid: UUID?): LLVector3? {
        var avatarObject: SLObjectInfo? = null
        if (gridConn != null && gridConn?.parcelInfo != null) {
            avatarObject = gridConn?.parcelInfo?.getAvatarObject(uuid)
            if (avatarObject != null) {
                return avatarObject.getAbsolutePosition()
            }
        }
        if (!Objects.equal(uuid, circuitInfo.agentID) || myAvatarPosition == null) {
            return null
        }
        return LLVector3(myAvatarPosition!!.getX(), myAvatarPosition!!.getY(), myAvatarPosition!!.getZ())
    }

    fun getNearbyChatterList(): MutableList<ChatterID> {
        val arrayList = ArrayList<ChatterID>(userPositions.size)
        for (userLocation in userPositions.values) {
            arrayList.add(userLocation.chatterID)
        }
        return arrayList
    }

    fun requestUpdateAvatarParcelData() {
        agentCircuit.execute(Runnable {
            updateAvatarParcelData()
        })
    }
}
