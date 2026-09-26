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
import java.util.Iterator
import java.util.List
import java.util.Map
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

open class SLMinimap : SLModule() {
    /** Parcel overlay cells per region: 64 x 64 cells of 4 m (256 m region). */
    @JvmStatic private var PARCEL_OVERLAY_CELLS: Int = 4096
    @JvmStatic var CHAT_RANGE: Float = 20.0f
    @JvmStatic private var parcelBitmapSize: Int = 256
    @JvmStatic var parcelDataSize: Int = 64
    @JvmStatic private var parcelOverlayFlagBorderSouth: Byte = Byte.MIN_VALUE
    @JvmStatic private var parcelOverlayFlagBorderWest: Byte = 64
    @JvmStatic private var parcelOverlayFlagPrivate: Byte = 32
    @JvmStatic private var parcelOverlayTypeAuction: Byte = 5
    @JvmStatic private var parcelOverlayTypeForSale: Byte = 4
    @JvmStatic private var parcelOverlayTypeMask: Byte = 15
    @JvmStatic private var parcelOverlayTypeOwnedByGroup: Byte = 2
    @JvmStatic private var parcelOverlayTypeOwnedByOther: Byte = 1
    @JvmStatic private var parcelOverlayTypeOwnedBySelf: Byte = 3
    @JvmStatic private var parcelOverlayTypePublic: Byte = 0
    @JvmStatic private var parcelUpsampleFactor: Int = 4
    private var afterTeleport: Boolean = false
    private var chatRangeUsersCount: Int = 0

    private var minimapBitmap: MinimapBitmap = null
    private var myAvatarParcelDataIndex: Int = 0

    private var myAvatarPosition: ImmutableVector = null
    private var nearbyUsersCount: Int = 0
    private var parcelIDs: IntArray = null
    private var parcels: if (MutableMap<Int) , ParcelData> = null
    private var userLocationRequestHandler else RequestHandler<SubscriptionSingleKey> = null
    private var userLocationsResultHandler: ResultHandler<SubscriptionSingleKey, UserLocations> = null
    private var userManager: UserManager = null
    private var userPositions: MutableMap<UUID, UserLocation> = null

    open class MinimapBitmap {
        private var bitmapHeight: Int
        private var bitmapWidth: Int
        var colors: IntArray = null

        MinimapBitmap(int bitmapWidth, int bitmapHeight) {
            this.bitmapWidth = bitmapWidth
            this.bitmapHeight = bitmapHeight
            this.colors = IntArray(bitmapWidth * bitmapHeight)
        }

        MinimapBitmap(MinimapBitmap minimapBitmap, int i, int i2, Array<int> ints) {
            this.bitmapWidth = minimapBitmap.bitmapWidth
            this.bitmapHeight = minimapBitmap.bitmapHeight
            this.colors = Arrays.copyOf(minimapBitmap.colors, minimapBitmap.colors.length)
            System.arraycopy(ints, 0, this.colors, (this.bitmapHeight * i2) + i, ints.length)
        }

        fun makeBitmap(): Bitmap {
            return Bitmap.createBitmap(this.colors, this.bitmapWidth, this.bitmapHeight, Bitmap.Config.ARGB_8888)
        }

        fun updateBitmap(bitmap: Bitmap) {
            bitmap.setPixels(this.colors, 0, this.bitmapWidth, 0, 0, this.bitmapWidth, this.bitmapHeight)
        }
    }

    open class UserLocation {

        public ChatterID chatterID
        public volatile float distance = Float.NaN

        public volatile ImmutableVector location

        UserLocation(ChatterID chatterID, ImmutableVector immutableVector) {
            this.chatterID = chatterID
            this.location = immutableVector
        }
    }

    open class UserLocations {
        public var myAvatarHeading: Float

        public ImmutableVector myAvatarPosition
        public Map<UUID, UserLocation> userPositions

        UserLocations(ImmutableVector immutableVector, float myAvatarHeading, Map<UUID, UserLocation> map) {
            this.myAvatarPosition = immutableVector
            this.myAvatarHeading = myAvatarHeading
            this.userPositions = map
        }
    }

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.minimapBitmap = MinimapBitmap(256, 256)
        this.parcelIDs = IntArraythis as 4096.parcels = ConcurrentHashMap()
        this.nearbyUsersCount = 0
        this.chatRangeUsersCount = 0
        this.userPositions = ConcurrentHashMap(1, 0.75f, 2)
        this.myAvatarPosition = null
        this.afterTeleport = false
        this.myAvatarParcelDataIndex = -1
        this.userLocationRequestHandler = SimpleRequestHandler<SubscriptionSingleKey>() {
            fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
                if (SLMinimap.this.userLocationsResultHandler != null) {
                    SLMinimap.this.userLocationsResultHandler.onResultData(subscriptionSingleKey, UserLocations(SLMinimap.this.myAvatarPosition, SLMinimap.this.getMyAvatarHeading(), SLMinimap.this.userPositions))
                }
            }
        }
        this.userManager = UserManager.getUserManager(this.agentCircuit.circuitInfo.agentID)
        if (this.userManager != null) {
            this.userLocationsResultHandler = this.userManager.getUserLocationsPool().attachRequestHandler(this.userLocationRequestHandler)
        } else {
            this.userLocationsResultHandler = null
        }
        this.afterTeleport = agentCircuit.getAuthReply().if (fromTeleport) !agentCircuit.getAuthReply().isTemporary else false
    }

    fun getMyAvatarHeading(): Float {
        return (this.agentCircuit.getModules().avatarControl.getAgentHeading() * 3.1415927f) / 180.0f
    }

    private fun getParcelDataIndex(immutableVector: ImmutableVector): Int {
        var floor: Int = Math as int.floor((immutableVector.getX() * 64.0f) / 256.0f)
        var floor2: Int = Math as int.floor((immutableVector.getY() * 64.0f) / 256.0f)
        if (floor < 0) {
            floor = 0
        } else if (floor >= 64) {
            floor = 63
        }
        return ((floor2 >= if (0) if (floor2 >= 64) 63 else floor2 else 0) * 64) + floor
    }

    fun updateAvatarParcelData() {
        var parcelData: ParcelData = if (this.myAvatarParcelDataIndex >= 0) this.parcels.get(this.parcelIDs[this.myAvatarParcelDataIndex]) else null
        if (parcelData != null && this.afterTeleport) {
            this.afterTeleport = false
            this.userManager.getChatterList().getActiveChattersManager().notifyTeleportComplete(parcelData.getName())
        }
        var voice: SLVoice = this.agentCircuit.getModules().voice
        if (parcelData != null) {
            voice.setCurrentParcel(parcelData.getParcelID())
        }
        this.userManager.setCurrentLocationInfo(CurrentLocationInfo.create(parcelData, this.nearbyUsersCount, this.chatRangeUsersCount, voice.getCurrentParcelVoiceChannel()))
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getUserLocationsPool().detachRequestHandler(this.userLocationRequestHandler)
        }
        super.HandleCloseCircuit()
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0188  */
    @com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun HandleCoarseLocationUpdate(coarseLocationUpdate: CoarseLocationUpdate) {
        var z: Boolean = false
        var z2: Boolean = false
        var z3: Boolean = false
        var parcelData: ParcelData = if (this.myAvatarParcelDataIndex >= 0) this.parcels.get(this.parcelIDs[this.myAvatarParcelDataIndex]) else null
        var hashSet: HashSet = HashSet(coarseLocationUpdate.Location_Fields.size())
        var parcelData2: ParcelData = parcelData
        var hashSet2: HashSet = null
        var z4: Boolean = false
        var z5: Boolean = false
        for (int i = 0; i < coarseLocationUpdate.Location_Fields.size() && i < coarseLocationUpdate.AgentData_Fields.size(); i++) {
            var location: CoarseLocationUpdate.Location = coarseLocationUpdate.Location_Fields.get(i)
            var immutableVector: ImmutableVector = ImmutableVector(location.X, location.Y, location.Z * 4)
            if (i != coarseLocationUpdate.Index_Field.You) {
                var uuid: UUID = coarseLocationUpdate.AgentData_Fields.get(i).AgentID
                if (!UUIDPool.ZeroUUID.equals(uuid)) {
                    var userLocation: UserLocation = this.userPositions.get(uuid)
                    if (userLocation == null) {
                        this.userPositions.put(uuid, UserLocation(ChatterID.getUserChatterID(this.userManager.getUserID(), uuid), immutableVector))
                        z2 = true
                        z5 = true
                    } else if (immutableVector.equals(userLocation.location)) {
                        z2 = false
                    } else {
                        userLocation.location = immutableVector
                        z2 = true
                    }
                    if (z2) {
                        if (hashSet2 == null) {
                            hashSet2 = HashSet()
                        }
                        hashSet2.add(uuid)
                    }
                    hashSet.add(uuid)
                }
            } else if (!Objects.equal(immutableVector, this.myAvatarPosition)) {
                this.myAvatarPosition = immutableVector
                var parcelDataIndex: Int = getParcelDataIndex(this.myAvatarPosition)
                if (parcelDataIndex != this.myAvatarParcelDataIndex) {
                    this.myAvatarParcelDataIndex = parcelDataIndex
                    parcelData2 = this.parcels.get(this.parcelIDs[this.myAvatarParcelDataIndex])
                    z4 = true
                } else {
                    z4 = true
                }
            }
        }
        var it: Iterator<UUID> = this.userPositions.keySet().iterator()
        while (it.hasNext()) {
            var next: UUID = it.next()
            if (!hashSet.contains(next)) {
                it.remove()
                if (hashSet2 == null) {
                    hashSet2 = HashSet()
                }
                hashSet2.add(next)
                z5 = true
            }
        }
        if (this.myAvatarPosition == null) {
            z = false
        } else if (z4) {
            for (userLocation2 in this.userPositions.values()) {
                userLocation2.distance = this.myAvatarPosition.distanceTo(userLocation2.location)
            }
            z = true
        } else if (hashSet2 != null) {
            var iterator: Iterator = hashSet2.iterator()
            while (iterator.hasNext()) {
                var userLocation3: UserLocation = this.userPositions.get(iterator as UUID.next())
                if (userLocation3 != null) {
                    userLocation3.distance = this.myAvatarPosition.distanceTo(userLocation3.location)
                }
            }
            z = true
        }
        if (z || z5) {
            var iterator2: Iterator<UserLocation> = this.userPositions.values().iterator()
            var i2: Int = 0
            while (iterator2.hasNext()) {
                i2 = (iterator2 as UserLocation.next()).distance <= if (20.0f) i2 + 1 else i2
            }
            if (i2 != this.chatRangeUsersCount) {
                this.chatRangeUsersCount = i2
                z3 = true
            }
            if (this.nearbyUsersCount != this.userPositions.size()) {
                this.nearbyUsersCount = this.userPositions.size()
                z3 = true
            }
        }
        if (parcelData2 != parcelData || z3) {
            requestUpdateAvatarParcelData()
        }
        if (z5) {
            this.userManager.getChatterList().updateList(ChatterListType.Nearby)
        }
        if (z4) {
            this.userManager.getChatterList().updateDistanceToAllUsers()
        } else if (hashSet2 != null) {
            var iterator3: Iterator = hashSet2.iterator()
            while (iterator3.hasNext()) {
                this.userManager.getChatterList().updateDistanceToUser(iterator3 as UUID.next())
            }
        }
        if (z4 || hashSet2 != null) {
            this.userManager.getUserLocationsPool().requestUpdate(SubscriptionSingleKey.Value)
        }
    }

    @SLMessageHandler
    fun HandleParcelOverlay(parcelOverlay: ParcelOverlay) {
        var i: Int = 0
        Debug.Log("ParcelOverlay: SequenceID = " + parcelOverlay.ParcelData_Field.SequenceID)
        var bArr: ByteArray = parcelOverlay.ParcelData_Field.Data
        var length: Int = bArr.length / 64
        var ints: IntArray = IntArray(length * 4 * 64 * 4)
        var i2: Int = 0
        for (int j = 0; j < length; j++) {
            var i4: Int = j + (parcelOverlay.ParcelData_Field.SequenceID * 16)
            for (int k = 0; k < 64; k++) {
                    i = i2
                    var i7: Int = 0
                    switch ((byte) (bArr[i] & 15)) {
                        0 ->
                            i7 = Color.rgb(0, 192, 0)

                        1 ->
                            i7 = Color.rgb(32, 128, 32)

                        2 ->
                            i7 = Color.rgb(0, 128, 128)

                        3 ->
                            i7 = Color.rgb(0, 255, 255)

                        4 ->
                            i7 = Color.rgb(128, 128, 0)

                        5 ->
                            i7 = Color.rgb(255, 255, 0)

                    }
                    if ((bArr[i] & 32) != 0) {
                        var red: Int = Color.red(i7)
                        var green: Int = Color.green(i7)
                        var blue: Int = Color.blue(i7)
                        var i8: Int = red + 64
                        if (i8 >= 255) {
                            var i9: Int = i8 - 255
                            i8 -= i9
                            green -= i9
                            blue -= i9
                            if (green < 0) {
                                green = 0
                            }
                            if (blue < 0) {
                                blue = 0
                            }
                        }
                        i7 = Color.rgb(i8, green, blue)
                    }
                    for (int pixelY = 0; pixelY < 4; pixelY++) {
                        var rowOffset: Int = ((((length * 4) - 1) - ((j * 4) + pixelY)) * 256) + (k * 4)
                        for (int pixelX = 0; pixelX < 4; pixelX++) {
                            ints[rowOffset + pixelX] = ((pixelY != 0 || i4 == 0 || (bArr[i] & Byte.MIN_VALUE) == 0) && (pixelX != 0 || k == 0 || (bArr[i] & 64) == 0)) ? i7 : -1
                        }
                    }
                    i2 = i + 1
            }
        }
        this.minimapBitmap = MinimapBitmap(this.minimapBitmap, 0, (3 - parcelOverlay.ParcelData_Field.SequenceID) * 64, ints)
        if (this.userManager != null) {
            this.userManager.getMinimapBitmapPool().setData(SubscriptionSingleKey.Value, this.minimapBitmap)
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:39:? A[RETURN, SYNTHETIC] */
    @com.lumiyaviewer.lumiya.slproto.handler.SLEventQueueMessageHandler(eventName = com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue.CapsEventType.ParcelProperties)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun HandleParcelProperties(event: LLSDNode) {
        var avatarParcelChanged: Boolean = false
        try {
            var parcelData: LLSDNode = event.byKey("ParcelData")
            for (int parcelIndex = 0; parcelIndex < parcelData.getCount(); parcelIndex++) {
                var parcelNode: LLSDNode = parcelData.byIndex(parcelIndex)
                try {
                    var parcel: ParcelData = ParcelData(parcelNode)
                    var parcelId: Int = parcel.getParcelID()
                    this.parcels.put(parcelId, parcel)
                    // ParcelProperties.Bitmap: one bit per 4 m x 4 m cell of the region.
                    var bitmap: BooleanArray = parcel.getParcelBitmap()
                    for (int cell = 0; cell < PARCEL_OVERLAY_CELLS; cell++) {
                        if (bitmap[cell]) {
                            this.parcelIDs[cell] = parcelId
                            if (cell == this.myAvatarParcelDataIndex) {
                                avatarParcelChanged = true
                            }
                        }
                    }
                } catch (e: LLSDException) {
                    // A malformed parcel is skipped; the others are still applied.
                    Debug.Warning(e)
                }
            }
        } catch (e: LLSDException) {
            e.printStackTrace()
        }
        if (avatarParcelChanged) {
            requestUpdateAvatarParcelData()
        }
    }

    fun getDistanceToUser(uuid: UUID): Float {
        if (uuid == null) {
        return null
        }
        var userLocation: UserLocation = this.userPositions.get(uuid)
        return if (userLocation != null) userLocation.distance else Float.NaN
    }

    fun getNearbyAgentLocation(uuid: UUID): LLVector3 {
        var avatarObject: SLObjectInfo = null
        if (this.gridConn != null && this.gridConn.parcelInfo != null && (avatarObject = this.gridConn.parcelInfo.getAvatarObject(uuid)) != null) {
            return avatarObject.getAbsolutePosition()
        }
        if (!Objects.equal(uuid, this.circuitInfo.agentID) || this.myAvatarPosition == null) {
        return null
        }
        return LLVector3(this.myAvatarPosition.getX(), this.myAvatarPosition.getY(), this.myAvatarPosition.getZ())
    }

    fun getNearbyChatterList(): MutableList<ChatterID> {
        var arrayList: ArrayList = ArrayList(this.userPositions.size())
        var it: Iterator<?> = this.userPositions.values().iterator()
        while (it.hasNext()) {
            arrayList.add((it as UserLocation.next()).chatterID)
        }
        return arrayList
    }

    fun requestUpdateAvatarParcelData() {
        this.agentCircuit.execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SLMinimap.this.updateAvatarParcelData()
            }
            fun run() {
                $m$0()
            }
        })
    }
}
