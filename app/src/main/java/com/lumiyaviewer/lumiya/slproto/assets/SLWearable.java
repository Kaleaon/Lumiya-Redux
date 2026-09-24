package com.lumiyaviewer.lumiya.slproto.assets;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableData;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetData;
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey;
import java.util.UUID;
import java.util.concurrent.Executor;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class SLWearable implements Subscription.OnData<AssetData>, Subscription.OnError {

    @Nonnull
    public final UUID assetID;
    private final Subscription<AssetKey, AssetData> assetSubscription;
    private String inventoryName;
    private volatile boolean isFailed = false;

    @Nonnull
    public final UUID itemID;

    @Nullable
    private final OnWearableStatusChangeListener statusChangeListener;

    @Nullable
    private volatile SLWearableData wearableData;

    public interface OnWearableStatusChangeListener {
        void onWearableStatusChanged(SLWearable wearable);
    }

    public SLWearable(@Nonnull UserManager userManager, @Nullable Executor executor, @Nonnull UUID uuid, @Nonnull UUID assetID, @Nonnull SLWearableType wearableType, @Nullable OnWearableStatusChangeListener onWearableStatusChangeListener) {
        this.itemID = uuid;
        this.assetID = assetID;
        this.statusChangeListener = onWearableStatusChangeListener;
        Debug.Printf("Wearable: subscribing for wearable %s", assetID);
        this.assetSubscription = userManager.getAssetResponseCacher().getPool().subscribe(AssetKey.createAssetKey(null, null, assetID, wearableType.getAssetType().getTypeCode()), executor, this, this);
    }

    public void dispose() {
        Debug.Printf("Wearable: unsubscribing for wearable %s", this.assetID);
        this.assetSubscription.unsubscribe();
    }

    public boolean getIsFailed() {
        return this.isFailed;
    }

    public boolean getIsValid() {
        return this.wearableData != null;
    }

    public String getName() {
        if (this.inventoryName != null) {
            return this.inventoryName;
        }
        SLWearableData wearableData = this.wearableData;
        return wearableData != null ? wearableData.name : this.isFailed ? "(Failed to load)" : "(loading)";
    }

    @Nullable
    public SLWearableData getWearableData() {
        return this.wearableData;
    }

    @Override
    public void onData(AssetData assetData) {
        if (assetData != null) {
            if (assetData.getStatus() != 1 || assetData.getData() == null) {
                Debug.Printf("Wearable: asset transfer failed for asset %s", this.assetID);
                this.isFailed = true;
            } else {
                try {
                    this.wearableData = new SLWearableData(assetData.getData());
                    Debug.Printf("Wearable: retrieved wearable data for asset %s", this.assetID);
                    this.isFailed = false;
                } catch (SLWearableData.WearableFormatException e) {
                    Debug.Printf("Wearable: failed to parse wearable data for asset %s", this.assetID);
                    this.isFailed = true;
                }
            }
            if (this.statusChangeListener != null) {
                this.statusChangeListener.onWearableStatusChanged(this);
            }
        }
    }

    @Override
    public void onError(Throwable th) {
        Debug.Printf("Wearable: got error for asset %s", this.assetID);
        this.isFailed = true;
        if (this.statusChangeListener != null) {
            this.statusChangeListener.onWearableStatusChanged(this);
        }
    }

    public void setInventoryName(String inventoryName) {
        this.inventoryName = inventoryName;
    }
}
