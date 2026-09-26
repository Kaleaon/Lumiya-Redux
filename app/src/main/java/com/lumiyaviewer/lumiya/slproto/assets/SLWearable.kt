package com.lumiyaviewer.lumiya.slproto.assets

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableData
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetData
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey
import java.util.UUID
import java.util.concurrent.Executor

open class SLWearable : Subscription.OnData<AssetData>, Subscription.OnError {

    var assetID: UUID = null
    private var assetSubscription: Subscription<AssetKey, AssetData> = null
    private var inventoryName: String = ""
    private var isFailed: Boolean = false

    var itemID: UUID = null

    private var statusChangeListener: OnWearableStatusChangeListener = null

    private var wearableData: SLWearableData = null

    interface OnWearableStatusChangeListener {
        void onWearableStatusChanged(SLWearable wearable)
    }

    constructor(userManager: UserManager, executor: Executor, uuid: UUID, assetID: UUID, wearableType: SLWearableType, onWearableStatusChangeListener: OnWearableStatusChangeListener) {
        this.itemID = uuid
        this.assetID = assetID
        this.statusChangeListener = onWearableStatusChangeListener
        Debug.Printf("Wearable: subscribing for wearable %s", assetID)
        this.assetSubscription = userManager.getAssetResponseCacher().getPool().subscribe(AssetKey.createAssetKey(null, null, assetID, wearableType.getAssetType().getTypeCode()), executor, this, this)
    }

    fun dispose() {
        Debug.Printf("Wearable: unsubscribing for wearable %s", this.assetID)
        this.assetSubscription.unsubscribe()
    }

    fun getIsFailed(): Boolean {
        return this.isFailed
    }

    fun getIsValid(): Boolean {
        return this.wearableData != null
    }

    fun getName(): String {
        if (this.inventoryName != null) {
            return this.inventoryName
        }
        var wearableData: SLWearableData = this.wearableData
        return if (wearableData != null) wearableData.name else if (this.isFailed) "(Failed to load)" else "(loading)"
    }

    fun getWearableData(): SLWearableData {
        return this.wearableData
    }
    fun onData(assetData: AssetData) {
        if (assetData != null) {
            if (assetData.getStatus() != 1 || assetData.getData() == null) {
                Debug.Printf("Wearable: asset transfer failed for asset %s", this.assetID)
                this.isFailed = true
            } else {
                try {
                    this.wearableData = SLWearableData(assetData.getData())
                    Debug.Printf("Wearable: retrieved wearable data for asset %s", this.assetID)
                    this.isFailed = false
                } catch (e: SLWearableData.WearableFormatException) {
                    Debug.Printf("Wearable: failed to parse wearable data for asset %s", this.assetID)
                    this.isFailed = true
                }
            }
            if (this.statusChangeListener != null) {
                this.statusChangeListener.onWearableStatusChanged(this)
            }
        }
    }
    fun onError(th: Throwable) {
        Debug.Printf("Wearable: got error for asset %s", this.assetID)
        this.isFailed = true
        if (this.statusChangeListener != null) {
            this.statusChangeListener.onWearableStatusChanged(this)
        }
    }

    fun setInventoryName(inventoryName: String) {
        this.inventoryName = inventoryName
    }
}
