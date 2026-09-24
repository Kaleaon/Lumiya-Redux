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

public class TextureCompressedCache extends ResourceManager<DrawableTextureParams, File> {
    private final StartingExecutor downloadExecutor = new StartingExecutor(GlobalOptions.getInstance().getMaxTextureDownloads());
    private final Object lock = new Object();
    private volatile SLTextureFetcher fetcher = null;

    private class TextureFetchRequest extends ResourceRequest<DrawableTextureParams, File> implements Startable, SLTextureFetchRequest.TextureFetchCompleteListener, Runnable, HasPriority {

        private static final int MAX_RETRIES = 2;
        private final File compressedFile;
        private volatile SLTextureFetchRequest fetchRequest;
        private volatile Future<?> fetchTask;
        private final SLTextureFetcher fetcher;

        public TextureFetchRequest(DrawableTextureParams drawableTextureParams, ResourceManager<DrawableTextureParams, File> resourceManager, File file, SLTextureFetcher textureFetcher) {
            super(drawableTextureParams, resourceManager);
            this.compressedFile = file;
            this.fetcher = textureFetcher;
        }

        @Override
        public void OnTextureFetchComplete(SLTextureFetchRequest textureFetchRequest) {
            completeRequest(textureFetchRequest.outputFile);
        }

        @Override
        public void cancelRequest() {
            SLTextureFetchRequest fetchRequest;
            SLTextureFetcher fetcher;
            Future<?> future;
            Debug.Printf("TextureFetchRequest: cancelled (%s)", getParams().uuid().toString());
            synchronized (this) {
                fetchRequest = this.fetchRequest;
                fetcher = this.fetcher;
                future = this.fetchTask;
            }
            if (fetcher != null && fetchRequest != null) {
                fetcher.CancelFetch(fetchRequest);
            }
            if (future != null) {
                future.cancel(true);
            }
            TextureCompressedCache.this.downloadExecutor.cancelRequest(this);
            super.cancelRequest();
        }

        @Override
        public void completeRequest(File file) {
            TextureCompressedCache.this.downloadExecutor.completeRequest(this);
            super.completeRequest(file);
        }

        @Override
        public void execute() {
            this.fetchTask = HTTPFetchExecutor.getInstance().submit(this);
        }

        @Override
        public int getPriority() {
            switch (getParams().textureClass()) {
                case Baked:
                    return 1;
                case Sculpt:
                    return 0;
                default:
                    return 2;
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:38:0x01d2 A[LOOP:0: B:17:0x00bc->B:38:0x01d2, LOOP_END] */
        /* JADX WARN: Removed duplicated region for block: B:39:0x00fc A[SYNTHETIC] */
        /**
         * Download the compressed (JPEG2000) texture over HTTP into the cache.
         *
         * <p>Baked avatar textures come from the agent appearance service
         * (<code>texture/AVATAR_ID/BAKE_NAME/TEXTURE_ID</code>); everything else
         * from the region's GetTexture capability (<code>?texture_id=</code>), as
         * in the viewer's LLTextureFetch. The body is written to a
         * <code>.part</code> file and renamed into place under the cache lock.
         * Up to {@link #MAX_RETRIES} attempts are made; if all fail, the request
         * is handed to the UDP (ImageData/ImagePacket) download executor.</p>
         */
        @Override
        public void run() {
            if (this.fetcher == null) {
                completeRequest(null);
                return;
            }
            String capURL = this.fetcher.getCapURL();
            String appearanceService = this.fetcher.getAgentAppearanceService();
            DrawableTextureParams params = getParams();
            URL url;
            try {
                UUID avatarUUID = params.avatarUUID();
                AvatarTextureFaceIndex faceIndex = params.avatarFaceIndex();
                if (appearanceService == null || avatarUUID == null || faceIndex == null) {
                    url = new URL(capURL + "/?texture_id=" + params.uuid().toString());
                } else {
                    if (!appearanceService.endsWith("/")) {
                        appearanceService = appearanceService + "/";
                    }
                    url = new URL(appearanceService + "texture/" + avatarUUID.toString() + "/"
                            + faceIndex.getBakedTextureName() + "/" + params.uuid().toString());
                }
            } catch (MalformedURLException e) {
                Debug.Warning(e);
                completeRequest(null);
                return;
            }
            Debug.Log("TextureFetchRequest: Fetching texture " + params.uuid().toString() + ", url = " + url);
            File partFile = new File(this.compressedFile.getAbsolutePath() + ".part");
            File tempOutputDir = partFile.getParentFile();
            boolean createResult = tempOutputDir.mkdirs();
            Debug.Printf("TextureFetchRequest: tempOutputDir = %s, createResult = %b, exists = %b",
                    tempOutputDir, Boolean.valueOf(createResult), Boolean.valueOf(tempOutputDir.exists()));
            for (int attempt = 0; attempt < MAX_RETRIES; attempt++) {
                boolean success = false;
                try {
                    Debug.Printf("TextureFetchRequest: getting connection", new Object[0]);
                    Response response = SLHTTPSConnection.getOkHttpClient().newCall(
                            new Request.Builder().url(url).header(HttpHeaders.ACCEPT, "image/x-j2c").build()).execute();
                    if (response == null) {
                        throw new IOException("Null response");
                    }
                    try {
                        if (!response.isSuccessful()) {
                            throw new IOException("Response code " + Integer.toString(response.code()));
                        }
                        InputStream input = response.body().byteStream();
                        BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(partFile));
                        try {
                            ByteStreams.copy(input, output);
                        } finally {
                            output.close();
                        }
                        // The file is complete once the stream is closed; a
                        // failure closing the response after that still counts.
                        success = true;
                    } finally {
                        response.close();
                    }
                } catch (IOException e) {
                    Debug.Warning(e);
                }
                if (success) {
                    synchronized (TextureCompressedCache.this.lock) {
                        partFile.renameTo(this.compressedFile);
                    }
                    completeRequest(this.compressedFile);
                    return;
                }
            }
            if (!this.fetchTask.isCancelled()) {
                Debug.Log("TextureFetchRequest: HTTP fetch unsuccessful. Trying UDP.");
                TextureCompressedCache.this.downloadExecutor.queueRequest(this);
            }
        }

        @Override
        public void start() {
            SLTextureFetchRequest textureFetchRequest;
            SLTextureFetcher fetcher = this.fetcher;
            if (fetcher == null) {
                completeRequest((File) null);
                return;
            }
            DrawableTextureParams params = getParams();
            synchronized (this) {
                textureFetchRequest = new SLTextureFetchRequest(params.uuid(), 0, params.textureClass(), params.avatarFaceIndex(), params.avatarUUID(), this.compressedFile);
                textureFetchRequest.setOnFetchComplete(this);
                this.fetchRequest = textureFetchRequest;
            }
            fetcher.BeginFetch(textureFetchRequest);
        }
    }

    @Override
    public ResourceRequest<DrawableTextureParams, File> CreateNewRequest(DrawableTextureParams drawableTextureParams, ResourceManager<DrawableTextureParams, File> resourceManager) {
        return new TextureFetchRequest(drawableTextureParams, resourceManager, TextureCache.getInstance().getTextureCompressedFile(drawableTextureParams), this.fetcher);
    }

    @Override
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

    public void setFetcher(SLTextureFetcher textureFetcher) {
        this.fetcher = textureFetcher;
    }

    public void setMaxTextureDownloads(int maxTextureDownloads) {
        if (maxTextureDownloads > 0) {
            this.downloadExecutor.setMaxConcurrentTasks(maxTextureDownloads);
            HTTPFetchExecutor.getInstance().setCorePoolSize(maxTextureDownloads);
            HTTPFetchExecutor.getInstance().setMaximumPoolSize(maxTextureDownloads);
        }
    }
}
