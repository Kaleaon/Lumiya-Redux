package com.lumiyaviewer.lumiya.slproto.modules.transfer

import com.google.common.collect.BiMap
import com.google.common.collect.HashBiMap
import com.google.common.collect.Maps
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.res.anim.AnimationCache
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.TransferAbort
import com.lumiyaviewer.lumiya.slproto.messages.TransferInfo
import com.lumiyaviewer.lumiya.slproto.messages.TransferPacket
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetData
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey
import java.util.Collections
import java.util.HashMap
import java.util.Map
import java.util.UUID

open class SLTransferManager : SLModule() {
    @JvmStatic private var DEFAULT_PRIORITY: Float = 10000.0f
    private var activeTransferIds: BiMap<AssetKey, UUID>? = null
    private var activeTransfers: MutableMap<UUID, SLTransfer>? = null
    private var assetRequestHandler: RequestHandler<AssetKey>? = null
    private var assetResultHandler: ResultHandler<AssetKey, AssetData>? = null
    private var userManager: UserManager? = null

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.activeTransfers = Collections.synchronizedMap(HashMap())
        this.activeTransferIds = Maps.synchronizedBiMap(HashBiMap.create())
        this.assetRequestHandler = AsyncRequestHandler(this.agentCircuit, RequestHandler<AssetKey>() {
            fun onRequest(assetKey: AssetKey) {
                Debug.Printf("Transfer: Requested asset download for %s", assetKey)
                var sLTransfer: SLTransfer = SLTransfer(SLTransferManager.this.circuitInfo.agentID, SLTransferManager.this.circuitInfo.sessionID, assetKey, SLTransferManager.DEFAULT_PRIORITY)
                SLTransferManager.this.activeTransferIds.forcePut(assetKey, sLTransfer.getTransferUUID())
                SLTransferManager.this.BeginTransfer(sLTransfer)
            }

            /* JADX WARN: Multi-variable type inference failed */
            fun onRequestCancelled(assetKey: AssetKey) {
                var sLTransfer: SLTransfer? = null
                var uuid: UUID = SLTransferManager as UUID.this.activeTransferIds.remove(assetKey)
                if (uuid == null || (sLTransfer = SLTransferManager as SLTransfer.this.activeTransfers.get(uuid)) == null) {
                    return
                }
                SLTransferManager.this.CancelTransfer(sLTransfer)
            }
        })
        this.userManager = UserManager.getUserManager(this.agentCircuit.circuitInfo.agentID)
        if (this.userManager != null) {
            AnimationCache.getInstance().setAssetResponseCacher(this.userManager.getAssetResponseCacher())
        }
        this.assetResultHandler = if (this.userManager != null) this.userManager.getAssetResponseCacher().getRequestSource().attachRequestHandler(this.assetRequestHandler) else null
    }

    fun BeginTransfer(transfer: SLTransfer) {
        Debug.Printf("Transfer: Starting transfer: assetUUID %s, assetType %d", transfer.getAssetUUID().toString(), transfer.getAssetType())
        this.activeTransfers.put(transfer.getTransferUUID(), transfer)
        this.agentCircuit.SendMessage(transfer.makeTransferRequest())
    }

    fun CancelTransfer(transfer: SLTransfer) {
        this.activeTransfers.remove(transfer.getTransferUUID())
        var transferAbort: TransferAbort = TransferAbort()
        transferAbort.TransferInfo_Field.TransferID = transfer.getTransferUUID()
        transferAbort.TransferInfo_Field.ChannelType = transfer.getChannelType()
        transferAbort.isReliable = true
        this.agentCircuit.SendMessage(transferAbort)
    }

    fun EndTransfer(transfer: SLTransfer) {
        var status: Int = 0
        this.activeTransfers.remove(transfer.getTransferUUID())
        var remove: AssetKey = this.activeTransferIds.inverse().remove(transfer.getTransferUUID())
        if (remove == null || this.assetResultHandler == null || (status = transfer.getStatus()) == 3 || status == 0) {
            return
        }
        this.assetResultHandler.onResultData(remove, AssetData(status, transfer.getData()))
    }
    fun HandleCloseCircuit() {
        AnimationCache.getInstance().setAssetResponseCacher(null)
        if (this.userManager != null) {
            this.userManager.getAssetResponseCacher().getRequestSource().detachRequestHandler(this.assetRequestHandler)
        }
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun HandleTransferInfo(transferInfo: TransferInfo) {
        var transfer: SLTransfer = this.activeTransfers.get(transferInfo.TransferInfoData_Field.TransferID)
        if (transfer != null) {
            Debug.Log(String.format("Transfer: Info recd, status %d, size %d", transferInfo.TransferInfoData_Field.Status, transferInfo.TransferInfoData_Field.Size))
            transfer.HandleTransferInfo(this, transferInfo)
        }
    }

    @SLMessageHandler
    fun HandleTransferPacket(transferPacket: TransferPacket) {
        var transfer: SLTransfer = this.activeTransfers.get(transferPacket.TransferData_Field.TransferID)
        if (transfer != null) {
            Debug.Log(String.format("Transfer: data recd, packet %d, status %d, size %d.", transferPacket.TransferData_Field.Packet, transferPacket.TransferData_Field.Status, transferPacket.TransferData_Field.Data.length))
            transfer.HandleTransferPacket(this, transferPacket)
        }
    }
}
