package com.lumiyaviewer.lumiya.slproto.modules.transfer;

import com.google.common.collect.BiMap;
import com.google.common.collect.HashBiMap;
import com.google.common.collect.Maps;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler;
import com.lumiyaviewer.lumiya.react.RequestHandler;
import com.lumiyaviewer.lumiya.react.ResultHandler;
import com.lumiyaviewer.lumiya.res.anim.AnimationCache;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.messages.TransferAbort;
import com.lumiyaviewer.lumiya.slproto.messages.TransferInfo;
import com.lumiyaviewer.lumiya.slproto.messages.TransferPacket;
import com.lumiyaviewer.lumiya.slproto.modules.SLModule;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetData;
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nonnull;

public class SLTransferManager extends SLModule {
    private static final float DEFAULT_PRIORITY = 10000.0f;
    private final BiMap<AssetKey, UUID> activeTransferIds;
    private final Map<UUID, SLTransfer> activeTransfers;
    private final RequestHandler<AssetKey> assetRequestHandler;
    private final ResultHandler<AssetKey, AssetData> assetResultHandler;
    private final UserManager userManager;

    public SLTransferManager(SLAgentCircuit agentCircuit) {
        super(agentCircuit);
        this.activeTransfers = Collections.synchronizedMap(new HashMap());
        this.activeTransferIds = Maps.synchronizedBiMap(HashBiMap.create());
        this.assetRequestHandler = new AsyncRequestHandler(this.agentCircuit, new RequestHandler<AssetKey>() {
            @Override
            public void onRequest(@Nonnull AssetKey assetKey) {
                Debug.Printf("Transfer: Requested asset download for %s", assetKey);
                SLTransfer sLTransfer = new SLTransfer(SLTransferManager.this.circuitInfo.agentID, SLTransferManager.this.circuitInfo.sessionID, assetKey, SLTransferManager.DEFAULT_PRIORITY);
                SLTransferManager.this.activeTransferIds.forcePut(assetKey, sLTransfer.getTransferUUID());
                SLTransferManager.this.BeginTransfer(sLTransfer);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override
            public void onRequestCancelled(@Nonnull AssetKey assetKey) {
                SLTransfer sLTransfer;
                UUID uuid = (UUID) SLTransferManager.this.activeTransferIds.remove(assetKey);
                if (uuid == null || (sLTransfer = (SLTransfer) SLTransferManager.this.activeTransfers.get(uuid)) == null) {
                    return;
                }
                SLTransferManager.this.CancelTransfer(sLTransfer);
            }
        });
        this.userManager = UserManager.getUserManager(this.agentCircuit.circuitInfo.agentID);
        if (this.userManager != null) {
            AnimationCache.getInstance().setAssetResponseCacher(this.userManager.getAssetResponseCacher());
        }
        this.assetResultHandler = this.userManager != null ? this.userManager.getAssetResponseCacher().getRequestSource().attachRequestHandler(this.assetRequestHandler) : null;
    }

    public void BeginTransfer(SLTransfer transfer) {
        Debug.Printf("Transfer: Starting transfer: assetUUID %s, assetType %d", transfer.getAssetUUID().toString(), Integer.valueOf(transfer.getAssetType()));
        this.activeTransfers.put(transfer.getTransferUUID(), transfer);
        this.agentCircuit.SendMessage(transfer.makeTransferRequest());
    }

    public void CancelTransfer(SLTransfer transfer) {
        this.activeTransfers.remove(transfer.getTransferUUID());
        TransferAbort transferAbort = new TransferAbort();
        transferAbort.TransferInfo_Field.TransferID = transfer.getTransferUUID();
        transferAbort.TransferInfo_Field.ChannelType = transfer.getChannelType();
        transferAbort.isReliable = true;
        this.agentCircuit.SendMessage(transferAbort);
    }

    void EndTransfer(SLTransfer transfer) {
        int status;
        this.activeTransfers.remove(transfer.getTransferUUID());
        AssetKey remove = this.activeTransferIds.inverse().remove(transfer.getTransferUUID());
        if (remove == null || this.assetResultHandler == null || (status = transfer.getStatus()) == 3 || status == 0) {
            return;
        }
        this.assetResultHandler.onResultData(remove, new AssetData(status, transfer.getData()));
    }

    @Override
    public void HandleCloseCircuit() {
        AnimationCache.getInstance().setAssetResponseCacher(null);
        if (this.userManager != null) {
            this.userManager.getAssetResponseCacher().getRequestSource().detachRequestHandler(this.assetRequestHandler);
        }
        super.HandleCloseCircuit();
    }

    @SLMessageHandler
    public void HandleTransferInfo(TransferInfo transferInfo) {
        SLTransfer transfer = this.activeTransfers.get(transferInfo.TransferInfoData_Field.TransferID);
        if (transfer != null) {
            Debug.Log(String.format("Transfer: Info recd, status %d, size %d", Integer.valueOf(transferInfo.TransferInfoData_Field.Status), Integer.valueOf(transferInfo.TransferInfoData_Field.Size)));
            transfer.HandleTransferInfo(this, transferInfo);
        }
    }

    @SLMessageHandler
    public void HandleTransferPacket(TransferPacket transferPacket) {
        SLTransfer transfer = this.activeTransfers.get(transferPacket.TransferData_Field.TransferID);
        if (transfer != null) {
            Debug.Log(String.format("Transfer: data recd, packet %d, status %d, size %d.", Integer.valueOf(transferPacket.TransferData_Field.Packet), Integer.valueOf(transferPacket.TransferData_Field.Status), Integer.valueOf(transferPacket.TransferData_Field.Data.length)));
            transfer.HandleTransferPacket(this, transferPacket);
        }
    }
}
