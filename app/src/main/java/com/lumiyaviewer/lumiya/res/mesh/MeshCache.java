package com.lumiyaviewer.lumiya.res.mesh;

import com.google.common.io.ByteStreams;
import com.google.common.net.HttpHeaders;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.res.ResourceFileCache;
import com.lumiyaviewer.lumiya.res.ResourceManager;
import com.lumiyaviewer.lumiya.res.ResourceRequest;
import com.lumiyaviewer.lumiya.res.executors.HTTPFetchExecutor;
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection;
import com.lumiyaviewer.lumiya.slproto.mesh.MeshData;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.Future;
import okhttp3.Request;
import okhttp3.Response;

public class MeshCache extends ResourceFileCache<UUID, MeshData> {
    private static final int MAX_ATTEMPTS = 2;
    private static volatile File baseDir;
    private final Object capURLlock = new Object();
    private volatile String capURL = null;

    private class MeshDownloadRequest extends ResourceRequest<UUID, MeshData> implements Runnable {
        private volatile Future<?> downloadTask;
        private final File outputFile;

        public MeshDownloadRequest(UUID uuid, ResourceManager<UUID, MeshData> resourceManager, File file) {
            super(uuid, resourceManager);
            this.outputFile = file;
        }

        @Override
        public void cancelRequest() {
            Future<?> future = this.downloadTask;
            if (future != null) {
                future.cancel(true);
            }
            super.cancelRequest();
        }

        @Override
        public void execute() {
            this.downloadTask = HTTPFetchExecutor.getInstance().submit(this);
        }

        @Override
        public void run() {
            String str;
            synchronized (MeshCache.this.capURLlock) {
                str = null;
                while (str == null) {
                    str = MeshCache.this.capURL;
                    if (str == null) {
                        try {
                            MeshCache.this.capURLlock.wait();
                        } catch (InterruptedException e) {
                        }
                    }
                }
            }
            if (str == null) {
                completeRequest(null);
                return;
            }
            File partFile = new File(this.outputFile.getAbsolutePath() + ".tmp");
            String url = str + "/?mesh_id=" + getParams().toString();
            Debug.Printf("Fetching mesh: %s", url);
            // Beyond 3.4.2, which kept looping after a successful download:
            // it fetched every mesh twice, completed the request twice and
            // then completed it a third time with null.
            for (int attempt = 0; attempt < 2 && !Thread.currentThread().isInterrupted(); attempt++) {
                boolean saved = false;
                try {
                    Response response = SLHTTPSConnection.getOkHttpClient().newCall(new Request.Builder().url(url).header(HttpHeaders.ACCEPT, "application/octet-stream").build()).execute();
                    if (response == null) {
                        throw new IOException("Null response");
                    }
                    try {
                        if (!response.isSuccessful()) {
                            throw new IOException("Error response code " + response.code());
                        }
                        File partDir = partFile.getParentFile();
                        if (partDir != null) {
                            partDir.mkdirs();
                        }
                        BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(partFile));
                        long copied;
                        try {
                            copied = ByteStreams.copy(response.body().byteStream(), output);
                        } finally {
                            output.close();
                        }
                        File outputDir = this.outputFile.getParentFile();
                        if (outputDir != null) {
                            outputDir.mkdirs();
                        }
                        saved = partFile.renameTo(this.outputFile);
                        Debug.Printf("MeshFetch: Saved %d bytes to %s", Long.valueOf(copied), this.outputFile.toString());
                    } finally {
                        response.close();
                    }
                    if (saved) {
                        completeRequest(new MeshData(this.outputFile));
                        return;
                    }
                } catch (IOException e) {
                    Debug.Warning(e);
                }
                partFile.delete();
            }
            if (this.downloadTask.isCancelled()) {
                return;
            }
            completeRequest(null);
        }
    }

    private static File getBaseDir() {
        if (baseDir == null) {
            baseDir = GlobalOptions.getInstance().getCacheDir("mesh");
        }
        return baseDir;
    }

    public static void onCacheDirChanged() {
        baseDir = null;
    }

    @Override
    public MeshData createResourceFromFile(UUID uuid, File file) {
        try {
            return new MeshData(file);
        } catch (IOException e) {
            return null;
        }
    }

    @Override
    public ResourceRequest<UUID, MeshData> createResourceGenRequest(UUID uuid, ResourceManager<UUID, MeshData> resourceManager, File file) {
        return new MeshDownloadRequest(uuid, resourceManager, file);
    }

    @Override
    public File getResourceFile(UUID uuid) {
        int hashCode = uuid.hashCode();
        return new File(getBaseDir(), String.format("%02x/%s.mesh", Integer.valueOf(((hashCode >> 24) ^ (((hashCode >> 8) ^ hashCode) ^ (hashCode >> 16))) & 255), uuid.toString()));
    }

    public void setCapURL(String capURL) {
        synchronized (this.capURLlock) {
            this.capURL = capURL;
            this.capURLlock.notifyAll();
        }
    }
}
