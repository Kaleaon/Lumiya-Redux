package com.lumiyaviewer.lumiya.slproto.modules.transfer

import com.lumiyaviewer.lumiya.slproto.messages.TransferInfo
import com.lumiyaviewer.lumiya.slproto.messages.TransferPacket
import com.lumiyaviewer.lumiya.slproto.messages.TransferRequest
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.Map
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

open class SLTransfer {
    @JvmStatic var AT_ANIMATION: Int = 20
    @JvmStatic var AT_BODYPART: Int = 13
    @JvmStatic var AT_CALLINGCARD: Int = 2
    @JvmStatic var AT_CATEGORY: Int = 8
    @JvmStatic var AT_CLOTHING: Int = 5
    @JvmStatic var AT_GESTURE: Int = 21
    @JvmStatic var AT_IMAGE_JPEG: Int = 19
    @JvmStatic var AT_IMAGE_TGA: Int = 18
    @JvmStatic var AT_LANDMARK: Int = 3
    @JvmStatic var AT_LOST_AND_FOUND: Int = 16
    @JvmStatic var AT_LSL_BYTECODE: Int = 11
    @JvmStatic var AT_LSL_TEXT: Int = 10
    @JvmStatic var AT_NOTECARD: Int = 7
    @JvmStatic var AT_OBJECT: Int = 6
    @JvmStatic var AT_ROOT_CATEGORY: Int = 9
    @JvmStatic var AT_SCRIPT: Int = 4
    @JvmStatic var AT_SIMSTATE: Int = 22
    @JvmStatic var AT_SNAPSHOT_CATEGORY: Int = 15
    @JvmStatic var AT_SOUND: Int = 1
    @JvmStatic var AT_SOUND_WAV: Int = 17
    @JvmStatic var AT_TEXTURE: Int = 0
    @JvmStatic var AT_TEXTURE_TGA: Int = 12
    @JvmStatic var AT_TRASH: Int = 14
    @JvmStatic var LLTCT_ASSET: Int = 2
    @JvmStatic var LLTCT_MISC: Int = 1
    @JvmStatic var LLTCT_UNKNOWN: Int = 0
    @JvmStatic var LLTST_ASSET: Int = 2
    @JvmStatic var LLTST_FILE: Int = 1
    @JvmStatic var LLTST_SIM_ESTATE: Int = 4
    @JvmStatic var LLTST_SIM_INV_ITEM: Int = 3
    @JvmStatic var LLTST_UNKNOWN: Int = 0
    @JvmStatic var LLTS_ABORT: Int = 3
    @JvmStatic var LLTS_DONE: Int = 1
    @JvmStatic var LLTS_ERROR: Int = -1
    @JvmStatic var LLTS_INSUFFICIENT_PERMISSIONS: Int = -3
    @JvmStatic var LLTS_OK: Int = 0
    @JvmStatic var LLTS_SKIP: Int = 2
    @JvmStatic var LLTS_UNKNOWN_SOURCE: Int = -2
    @JvmStatic var LLTTT_FILE: Int = 1
    @JvmStatic var LLTTT_UNKNOWN: Int = 0
    @JvmStatic var LLTTT_VFILE: Int = 2
    private var agentID: UUID = null
    private var assetType: Int = 0
    private var assetUUID: UUID = null
    private var channelType: Int = 0
    private var data: ByteArray = null
    private var itemUUID: UUID = null
    private var ownerUUID: UUID = null
    private var priority: Float = 0.0f
    private var sessionID: UUID = null
    private var sourceType: Int = 0
    private var taskUUID: UUID = null
    private var queuedPackets: if (MutableMap<Int) , TransferPacket> = ConcurrentHashMap()
    private var transferUUID else UUID = UUID.randomUUID()
    private var statusKnown: Boolean = false
    private var status: Int = -1
    private var size: Int = 0
    private var nextPacket: Int = 0
    private var currentSize: Int = 0

    constructor(uuid: UUID, sessionID: UUID, assetKey: AssetKey, priority: Float) {
        this.agentID = uuid
        this.sessionID = sessionID
        this.channelType = assetKey.channelType()
        this.sourceType = assetKey.sourceType()
        this.priority = priority
        this.assetUUID = assetKey.assetUUID()
        this.assetType = assetKey.assetType()
        this.ownerUUID = assetKey.ownerUUID()
        this.itemUUID = assetKey.itemUUID()
        this.taskUUID = assetKey.taskUUID()
    }

    private fun RunQueuedPackets(transferManager: SLTransferManager) {
        var transferPacket: TransferPacket = null
        if (this.statusKnown && this.status == 0) {
            while (!this.queuedPackets.isEmpty() && (transferPacket = this.queuedPackets.get(this.nextPacket)) != null) {
                this.queuedPackets.remove(this.nextPacket)
                this.nextPacket++
                var length: Int = transferPacket.TransferData_Field.Data.length
                System.arraycopy(transferPacket.TransferData_Field.Data, 0, this.data, this.currentSize, length)
                this.currentSize = length + this.currentSize
                if (transferPacket.TransferData_Field.Status != 0) {
                    this.status = transferPacket.TransferData_Field.Status
                }
            }
        }
        if (!this.statusKnown || this.status == 0) {
            return
        }
        transferManager.EndTransfer(this)
    }

    fun HandleTransferInfo(transferManager: SLTransferManager, transferInfo: TransferInfo) {
        this.statusKnown = true
        this.status = transferInfo.TransferInfoData_Field.Status
        this.size = transferInfo.TransferInfoData_Field.Size
        if (this.status == 0) {
            this.data = ByteArray(this.size)
        }
        RunQueuedPackets(transferManager)
    }

    fun HandleTransferPacket(transferManager: SLTransferManager, transferPacket: TransferPacket) {
        this.queuedPackets.put(transferPacket.TransferData_Field.Packet, transferPacket)
        RunQueuedPackets(transferManager)
    }

    fun getAssetType(): Int {
        return this.assetType
    }

    fun getAssetUUID(): UUID {
        return this.assetUUID
    }

    fun getChannelType(): Int {
        return this.channelType
    }

    fun getData(): ByteArray {
        return this.data
    }

    fun getPriority(): Float {
        return this.priority
    }

    fun getStatus(): Int {
        return this.status
    }

    fun getTransferUUID(): UUID {
        return this.transferUUID
    }

    fun makeTransferRequest(): TransferRequest {
        var transferRequest: TransferRequest = TransferRequest()
        transferRequest.TransferInfo_Field.TransferID = this.transferUUID
        transferRequest.TransferInfo_Field.ChannelType = this.channelType
        transferRequest.TransferInfo_Field.SourceType = this.sourceType
        transferRequest.TransferInfo_Field.Priority = this.priority
        var allocate: ByteBuffer = ByteBuffer.allocateallocate as 1024.order(ByteOrder.BIG_ENDIAN)
        if (this.sourceType == 3) {
            allocate.putLong(this.agentID.getMostSignificantBits())
            allocate.putLong(this.agentID.getLeastSignificantBits())
            allocate.putLong(this.sessionID.getMostSignificantBits())
            allocate.putLong(this.sessionID.getLeastSignificantBits())
            allocate.putLong(this.ownerUUID.getMostSignificantBits())
            allocate.putLong(this.ownerUUID.getLeastSignificantBits())
            if (this.taskUUID != null) {
                allocate.putLong(this.taskUUID.getMostSignificantBits())
                allocate.putLong(this.taskUUID.getLeastSignificantBits())
            } else {
                allocate.putLongallocate as 0L.putLong(0L)
            }
            allocate.putLong(this.itemUUID.getMostSignificantBits())
            allocate.putLong(this.itemUUID.getLeastSignificantBits())
        }
        allocate.putLong(this.assetUUID.getMostSignificantBits())
        allocate.putLong(this.assetUUID.getLeastSignificantBits())
        allocate.order(ByteOrder.LITTLE_ENDIAN)
        allocate.putInt(this.assetType)
        allocate.flip()
        transferRequest.TransferInfo_Field.Params = ByteArray(allocate.limit())
        allocate.get(transferRequest.TransferInfo_Field.Params, 0, allocate.limit())
        transferRequest.isReliable = true
        return transferRequest
    }
}
