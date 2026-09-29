package com.lumiyaviewer.lumiya.ui.chat

import android.graphics.Bitmap
import android.view.View
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.lang.ref.WeakReference
import java.util.UUID
import java.util.concurrent.atomic.AtomicReference

class ChatterThumbnailData(chatterID: ChatterID, view: View?) : ResourceConsumer {
    private val bitmapData = AtomicReference<Bitmap>()
    private val subscription: Subscription<*, *>?

    private val updateView: WeakReference<View>? = if (view != null) WeakReference(view) else null

    private val userManager: UserManager? = chatterID.getUserManager()

    init {
        val userManager = this.userManager
        if (userManager == null) {
            this.subscription = null
        } else if (chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            this.subscription = userManager.getCurrentLocationInfo().subscribe(
                SubscriptionSingleDataPool.getSingleDataKey(), UIThreadExecutor.getInstance()
            ) { obj: CurrentLocationInfo -> onCurrentLocationInfo(obj) }
        } else if (chatterID.isValidUUID()) {
            this.subscription = chatterID.getPictureID(userManager, UIThreadExecutor.getInstance(), ChatterID.OnChatterPictureIDListener { uuid ->
                requestBitmap(uuid)
            })
        } else {
            this.subscription = null
        }
    }

    fun onCurrentLocationInfo(currentLocationInfo: CurrentLocationInfo) {
        val parcelData = currentLocationInfo.parcelData()
        val snapshotUUID = parcelData?.getSnapshotUUID()
        val userManager = this.userManager
        if (snapshotUUID != null && !Objects.equal(snapshotUUID, UUIDPool.ZeroUUID) && userManager != null) {
            userManager.getUserPicBitmapCache().RequestResource(snapshotUUID, this)
            return
        }
        this.bitmapData.set(null)
        val view = this.updateView?.get() ?: return
        view.postInvalidate()
    }

    fun requestBitmap(uuid: UUID?) {
        val userManager = this.userManager
        if (uuid == null || Objects.equal(uuid, UUIDPool.ZeroUUID) || userManager == null) {
            return
        }
        userManager.getUserPicBitmapCache().RequestResource(uuid, this)
    }

    override fun OnResourceReady(obj: Any?, z: Boolean) {
        if (obj is Bitmap) {
            this.bitmapData.set(obj)
            val view = this.updateView?.get() ?: return
            view.postInvalidate()
        }
    }

    fun dispose() {
        this.subscription?.unsubscribe()
        this.userManager?.getUserPicBitmapCache()?.CancelRequest(this)
        this.bitmapData.set(null)
    }

    fun getBitmapData(): Bitmap? {
        return this.bitmapData.get()
    }
}
