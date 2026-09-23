package com.lumiyaviewer.lumiya.res.textures;

import com.google.common.io.ByteStreams;
import com.google.common.net.HttpHeaders;
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex;
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.UUID;
import okhttp3.Request;
import okhttp3.Response;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams;
import com.lumiyaviewer.lumiya.render.tex.TextureClass;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.res.ResourceManager;
import com.lumiyaviewer.lumiya.res.ResourceRequest;
import com.lumiyaviewer.lumiya.res.executors.HTTPFetchExecutor;
import com.lumiyaviewer.lumiya.res.executors.Startable;
import com.lumiyaviewer.lumiya.res.executors.StartingExecutor;
import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetchRequest;
import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetcher;
import com.lumiyaviewer.lumiya.utils.HasPriority;
import java.io.File;
import java.util.concurrent.Future;

/* loaded from: classes.dex */
public class TextureCompressedCache extends ResourceManager<DrawableTextureParams, File> {
    private final StartingExecutor downloadExecutor = new StartingExecutor(GlobalOptions.getInstance().getMaxTextureDownloads());
    private final Object lock = new Object();
    private volatile SLTextureFetcher fetcher = null;

    private class TextureFetchRequest extends ResourceRequest<DrawableTextureParams, File> implements Startable, SLTextureFetchRequest.TextureFetchCompleteListener, Runnable, HasPriority {

        /* renamed from: -com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues, reason: not valid java name */
        private /* synthetic */ int[] f53comlumiyaviewerlumiyarendertexTextureClassSwitchesValues = null;
        private static final int MAX_RETRIES = 2;
        private final File compressedFile;
        private volatile SLTextureFetchRequest fetchRequest;
        private volatile Future<?> fetchTask;
        private final SLTextureFetcher fetcher;

        /* renamed from: -getcom-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues, reason: not valid java name */
        private /* synthetic */ int[] m129x8a7b09f7() {
            if (f53comlumiyaviewerlumiyarendertexTextureClassSwitchesValues != null) {
                return f53comlumiyaviewerlumiyarendertexTextureClassSwitchesValues;
            }
            int[] iArr = new int[TextureClass.valuesCustom().length];
            try {
                iArr[TextureClass.Asset.ordinal()] = 3;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[TextureClass.Baked.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[TextureClass.Prim.ordinal()] = 4;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[TextureClass.Sculpt.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[TextureClass.Terrain.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            f53comlumiyaviewerlumiyarendertexTextureClassSwitchesValues = iArr;
            return iArr;
        }

        public TextureFetchRequest(DrawableTextureParams drawableTextureParams, ResourceManager<DrawableTextureParams, File> resourceManager, File file, SLTextureFetcher sLTextureFetcher) {
            super(drawableTextureParams, resourceManager);
            this.compressedFile = file;
            this.fetcher = sLTextureFetcher;
        }

        @Override // com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetchRequest.TextureFetchCompleteListener
        public void OnTextureFetchComplete(SLTextureFetchRequest sLTextureFetchRequest) {
            completeRequest(sLTextureFetchRequest.outputFile);
        }

        @Override // com.lumiyaviewer.lumiya.res.ResourceRequest
        public void cancelRequest() {
            SLTextureFetchRequest sLTextureFetchRequest;
            SLTextureFetcher sLTextureFetcher;
            Future<?> future;
            Debug.Printf("TextureFetchRequest: cancelled (%s)", getParams().uuid().toString());
            synchronized (this) {
                sLTextureFetchRequest = this.fetchRequest;
                sLTextureFetcher = this.fetcher;
                future = this.fetchTask;
            }
            if (sLTextureFetcher != null && sLTextureFetchRequest != null) {
                sLTextureFetcher.CancelFetch(sLTextureFetchRequest);
            }
            if (future != null) {
                future.cancel(true);
            }
            TextureCompressedCache.this.downloadExecutor.cancelRequest(this);
            super.cancelRequest();
        }

        @Override // com.lumiyaviewer.lumiya.res.ResourceRequest
        public void completeRequest(File file) {
            TextureCompressedCache.this.downloadExecutor.completeRequest(this);
            super.completeRequest(file);
        }

        @Override // com.lumiyaviewer.lumiya.res.ResourceRequest
        public void execute() {
            this.fetchTask = HTTPFetchExecutor.getInstance().submit(this);
        }

        @Override // com.lumiyaviewer.lumiya.utils.HasPriority
        public int getPriority() {
            switch (m129x8a7b09f7()[getParams().textureClass().ordinal()]) {
                case 1:
                    return 1;
                case 2:
                    return 0;
                default:
                    return 2;
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:38:0x01d2 A[LOOP:0: B:17:0x00bc->B:38:0x01d2, LOOP_END] */
        /* JADX WARN: Removed duplicated region for block: B:39:0x00fc A[SYNTHETIC] */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void run() {
            if (this.fetcher == null) {
                completeRequest(null);
                return;
            }
            DrawableTextureParams params = getParams();
            try {
                String appearanceService = this.fetcher.getAgentAppearanceService();
                UUID avatarId = params.avatarUUID();
                AvatarTextureFaceIndex face = params.avatarFaceIndex();
                URL url;
                if (appearanceService != null && avatarId != null && face != null) {
                    if (!appearanceService.endsWith("/")) appearanceService += "/";
                    url = new URL(appearanceService + "texture/" + avatarId + "/"
                            + face.getBakedTextureName() + "/" + params.uuid());
                } else {
                    url = new URL(this.fetcher.getCapURL() + "/?texture_id=" + params.uuid());
                }
                File partial = new File(this.compressedFile.getAbsolutePath() + ".part");
                File parent = partial.getParentFile();
                if (parent != null && !parent.exists() && !parent.mkdirs() && !parent.exists()) {
                    Debug.Log("Cannot create texture cache directory " + parent);
                    completeRequest(null);
                    return;
                }
                for (int attempt = 0; attempt < MAX_RETRIES && !Thread.currentThread().isInterrupted(); attempt++) {
                    try (Response response = SLHTTPSConnection.getOkHttpClient().newCall(
                            new Request.Builder().url(url).header(HttpHeaders.ACCEPT, "image/x-j2c").build()).execute()) {
                        if (!response.isSuccessful() || response.body() == null) {
                            throw new IOException("Response code " + response.code());
                        }
                        try (InputStream input = response.body().byteStream();
                             BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(partial))) {
                            ByteStreams.copy(input, output);
                        }
                        synchronized (TextureCompressedCache.this.lock) {
                            if (!partial.renameTo(this.compressedFile)) {
                                throw new IOException("Cannot commit texture cache file " + this.compressedFile);
                            }
                        }
                        completeRequest(this.compressedFile);
                        return;
                    } catch (IOException exception) {
                        Debug.Warning(exception);
                        partial.delete();
                    }
                }
                if (!Thread.currentThread().isInterrupted() && !this.fetchTask.isCancelled()) {
                    Debug.Log("TextureFetchRequest: HTTP fetch unsuccessful. Trying UDP.");
                    TextureCompressedCache.this.downloadExecutor.queueRequest(this);
                }
            } catch (MalformedURLException exception) {
                Debug.Warning(exception);
                completeRequest(null);
            }
        }

        @Override // com.lumiyaviewer.lumiya.res.executors.Startable
        public void start() {
            SLTextureFetchRequest sLTextureFetchRequest;
            SLTextureFetcher sLTextureFetcher = this.fetcher;
            if (sLTextureFetcher == null) {
                completeRequest((File) null);
                return;
            }
            DrawableTextureParams params = getParams();
            synchronized (this) {
                sLTextureFetchRequest = new SLTextureFetchRequest(params.uuid(), 0, params.textureClass(), params.avatarFaceIndex(), params.avatarUUID(), this.compressedFile);
                sLTextureFetchRequest.setOnFetchComplete(this);
                this.fetchRequest = sLTextureFetchRequest;
            }
            sLTextureFetcher.BeginFetch(sLTextureFetchRequest);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.lumiyaviewer.lumiya.res.ResourceManager
    public ResourceRequest<DrawableTextureParams, File> CreateNewRequest(DrawableTextureParams drawableTextureParams, ResourceManager<DrawableTextureParams, File> resourceManager) {
        return new TextureFetchRequest(drawableTextureParams, resourceManager, TextureCache.getInstance().getTextureCompressedFile(drawableTextureParams), this.fetcher);
    }

    @Override // com.lumiyaviewer.lumiya.res.ResourceManager
    public void RequestResource(DrawableTextureParams drawableTextureParams, ResourceConsumer resourceConsumer) {
        File textureCompressedFileOld = TextureCache.getInstance().getTextureCompressedFileOld(drawableTextureParams);
        File textureCompressedFile = TextureCache.getInstance().getTextureCompressedFile(drawableTextureParams);
        synchronized (this.lock) {
            if (!textureCompressedFileOld.exists()) {
                textureCompressedFileOld = textureCompressedFile.exists() ? textureCompressedFile : null;
            }
        }
        if (textureCompressedFileOld != null) {
            resourceConsumer.OnResourceReady(textureCompressedFileOld, false);
        } else {
            super.RequestResource(drawableTextureParams, resourceConsumer);
        }
    }

    public void setFetcher(SLTextureFetcher sLTextureFetcher) {
        this.fetcher = sLTextureFetcher;
    }

    public void setMaxTextureDownloads(int i) {
        if (i > 0) {
            this.downloadExecutor.setMaxConcurrentTasks(i);
            HTTPFetchExecutor.getInstance().setCorePoolSize(i);
            HTTPFetchExecutor.getInstance().setMaximumPoolSize(i);
        }
    }
}
