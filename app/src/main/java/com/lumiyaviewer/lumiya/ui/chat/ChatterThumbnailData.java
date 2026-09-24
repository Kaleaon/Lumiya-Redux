package com.lumiyaviewer.lumiya.ui.chat;

import android.graphics.Bitmap;
import android.view.View;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.lang.ref.WeakReference;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class ChatterThumbnailData implements ResourceConsumer {
    private final AtomicReference<Bitmap> bitmapData = new AtomicReference<>();
    private final Subscription subscription;

    @Nullable
    private final WeakReference<View> updateView;

    @Nullable
    private final UserManager userManager;

    public ChatterThumbnailData(@Nonnull ChatterID chatterID, @Nullable View view) {
        this.userManager = chatterID.getUserManager();
        this.updateView = view != null ? new WeakReference<>(view) : null;
        if (this.userManager == null) {
            this.subscription = null;
            return;
        }
        if (chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            this.subscription = this.userManager.getCurrentLocationInfo().subscribe(SubscriptionSingleDataPool.getSingleDataKey(), UIThreadExecutor.getInstance(), new Subscription.OnData() {
                private final /* synthetic */ void $m$0(Object obj) {
                    ChatterThumbnailData.this.onCurrentLocationInfo((CurrentLocationInfo) obj);
                }

                @Override
                public final void onData(Object obj) {
                    $m$0(obj);
                }
            });
        } else if (chatterID.isValidUUID()) {
            this.subscription = chatterID.getPictureID(this.userManager, UIThreadExecutor.getInstance(), new ChatterID.OnChatterPictureIDListener() {
                private final /* synthetic */ void $m$0(UUID uuid) {
                    ChatterThumbnailData.this.requestBitmap(uuid);
                }

                @Override
                public final void onChatterPictureID(UUID uuid) {
                    $m$0(uuid);
                }
            });
        } else {
            this.subscription = null;
        }
    }

    public void onCurrentLocationInfo(CurrentLocationInfo currentLocationInfo) {
        View view;
        ParcelData parcelData = currentLocationInfo.parcelData();
        UUID snapshotUUID = parcelData != null ? parcelData.getSnapshotUUID() : null;
        if (snapshotUUID != null && (!Objects.equal(snapshotUUID, UUIDPool.ZeroUUID)) && this.userManager != null) {
            this.userManager.getUserPicBitmapCache().RequestResource(snapshotUUID, this);
            return;
        }
        this.bitmapData.set(null);
        if (this.updateView == null || (view = this.updateView.get()) == null) {
            return;
        }
        view.postInvalidate();
    }

    public void requestBitmap(UUID uuid) {
        if (uuid == null || !(!Objects.equal(uuid, UUIDPool.ZeroUUID)) || this.userManager == null) {
            return;
        }
        this.userManager.getUserPicBitmapCache().RequestResource(uuid, this);
    }

    @Override
    public void OnResourceReady(Object obj, boolean z) {
        View view;
        if (obj instanceof Bitmap) {
            this.bitmapData.set((Bitmap) obj);
            if (this.updateView == null || (view = this.updateView.get()) == null) {
                return;
            }
            view.postInvalidate();
        }
    }

    public void dispose() {
        if (this.subscription != null) {
            this.subscription.unsubscribe();
        }
        if (this.userManager != null) {
            this.userManager.getUserPicBitmapCache().CancelRequest(this);
        }
        this.bitmapData.set(null);
    }

    @Nullable
    public Bitmap getBitmapData() {
        return this.bitmapData.get();
    }
}
