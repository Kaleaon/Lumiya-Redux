package com.lumiyaviewer.lumiya.res.anim;

import java.io.InputStream;

import android.content.res.AssetManager;
import com.google.common.collect.ImmutableSet;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.render.avatar.AnimationData;
import com.lumiyaviewer.lumiya.res.ResourceManager;
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache;
import com.lumiyaviewer.lumiya.res.ResourceRequest;
import com.lumiyaviewer.lumiya.res.executors.LoaderExecutor;
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetData;
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey;
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetResponseCacher;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

public class AnimationCache extends ResourceMemoryCache<UUID, AnimationData> {
    private final ImmutableSet<String> assetAnimations;
    private final AtomicReference<AssetResponseCacher> assetResponseCacher;

    private static class AssetLoadRequest extends ResourceRequest<UUID, AnimationData> implements Runnable {
        private final String assetName;

        AssetLoadRequest(UUID uuid, ResourceManager<UUID, AnimationData> resourceManager, String str) {
            super(uuid, resourceManager);
            this.assetName = str;
        }

        @Override
        public void cancelRequest() {
            LoaderExecutor.getInstance().remove(this);
            super.cancelRequest();
        }

        @Override
        public void execute() {
            LoaderExecutor.getInstance().execute(this);
        }

        /* JADX WARN: Removed duplicated region for block: B:39:0x0070 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        @Override
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void run() {
            AnimationData animationData = null;
            AssetManager assetManager = LumiyaApp.getAssetManager();
            if (assetManager != null) {
                try (InputStream input = assetManager.open("anims/" + this.assetName)) {
                    animationData = new AnimationData(getParams(), input);
                    if (animationData.getPriority() >= 6) {
                        Debug.Printf("Animation: priority %d loaded from asset %s",
                                Integer.valueOf(animationData.getPriority()), this.assetName);
                    }
                } catch (IOException exception) {
                    Debug.Warning(exception);
                }
            }
            completeRequest(animationData);
        }
    }

    private class DownloadRequest extends ResourceRequest<UUID, AnimationData> implements Subscription.OnData<AssetData>, Subscription.OnError {
        private Subscription<AssetKey, AssetData> assetSubscription;

        DownloadRequest(UUID uuid, ResourceManager<UUID, AnimationData> resourceManager) {
            super(uuid, resourceManager);
        }

        @Override
        public void cancelRequest() {
            Subscription<AssetKey, AssetData> subscription = this.assetSubscription;
            if (subscription != null) {
                subscription.unsubscribe();
            }
            super.cancelRequest();
        }

        @Override
        public void completeRequest(AnimationData animationData) {
            Subscription<AssetKey, AssetData> subscription = this.assetSubscription;
            if (subscription != null) {
                subscription.unsubscribe();
            }
            super.completeRequest(animationData);
        }

        @Override
        public void execute() {
            AssetResponseCacher assetResponseCacher = (AssetResponseCacher) AnimationCache.this.assetResponseCacher.get();
            if (assetResponseCacher != null) {
                this.assetSubscription = assetResponseCacher.getPool().subscribe(AssetKey.createAssetKey(null, null, getParams(), 20), LoaderExecutor.getInstance(), this, this);
            } else {
                completeRequest((AnimationData) null);
            }
        }

        @Override
        public void onData(AssetData assetData) {
            AnimationData animationData;
            if (assetData == null || assetData.getData() == null || assetData.getStatus() != 1) {
                completeRequest((AnimationData) null);
                return;
            }
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(assetData.getData());
            try {
                animationData = new AnimationData(getParams(), byteArrayInputStream);
                try {
                    byteArrayInputStream.close();
                } catch (IOException e) {
                    Debug.Warning(e);
                }
            } catch (IOException e2) {
                Debug.Warning(e2);
                animationData = null;
            }
            completeRequest(animationData);
        }

        @Override
        public void onError(Throwable th) {
            completeRequest((AnimationData) null);
        }
    }

    private static class InstanceHolder {
        private static final AnimationCache Instance = new AnimationCache(null);

        private InstanceHolder() {
        }
    }

    private AnimationCache() {
        this.assetResponseCacher = new AtomicReference<>(null);
        ImmutableSet.Builder builder = ImmutableSet.builder();
        AssetManager assetManager = LumiyaApp.getAssetManager();
        if (assetManager != null) {
            try {
                String[] list = assetManager.list("anims");
                if (list != null) {
                    builder.addAll((Iterable) Arrays.asList(list));
                }
            } catch (IOException e) {
                Debug.Warning(e);
            }
        }
        this.assetAnimations = builder.build();
    }

    /* synthetic */ AnimationCache(AnimationCache animationCache) {
        this();
    }

    public static AnimationCache getInstance() {
        return InstanceHolder.Instance;
    }

    @Override
    protected ResourceRequest<UUID, AnimationData> CreateNewRequest(UUID uuid, ResourceManager<UUID, AnimationData> resourceManager) {
        String uuid2 = uuid.toString();
        return this.assetAnimations.contains(uuid2) ? new AssetLoadRequest(uuid, resourceManager, uuid2) : new DownloadRequest(uuid, resourceManager);
    }

    public void setAssetResponseCacher(AssetResponseCacher assetResponseCacher) {
        this.assetResponseCacher.set(assetResponseCacher);
    }
}
