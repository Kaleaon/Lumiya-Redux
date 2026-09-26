package com.lumiyaviewer.lumiya.ui.chat

import android.graphics.Bitmap
import android.view.View
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.lang.ref.WeakReference
import java.util.UUID
import java.util.concurrent.atomic.AtomicReference

open class ChatterThumbnailData : ResourceConsumer {
    private AtomicReference<Bitmap> bitmapData = new AtomicReference<>()
    private Subscription subscription

    private WeakReference<View> updateView

    private UserManager userManager

    constructor(chatterID: ChatterID, view: View) {
        this.userManager = chatterID.getUserManager()
        this.updateView = view != null ? new WeakReference<>(view) : null
        internal fun if(null: this.userManager ==):  {
            this.subscription = null
            return
        }
        if (chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            this.subscription = this.userManager.getCurrentLocationInfo().subscribe(SubscriptionSingleDataPool.getSingleDataKey(), UIThreadExecutor.getInstance(), new Subscription.OnData() {
                    ChatterThumbnailData.this.onCurrentLocationInfo((CurrentLocationInfo) obj)
                }

                override fun onData(obj: Any) {