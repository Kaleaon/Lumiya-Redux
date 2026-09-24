package com.lumiyaviewer.lumiya.slproto.modules.texuploader;

import com.google.common.net.HttpHeaders;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest;
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class SLTextureUploadRequest implements Runnable {
    private static final MediaType MEDIA_TYPE_JP2 = MediaType.parse("image/x-j2c");
    private String capURL;
    TextureUploadCompleteListener onUploadComplete = null;
    private File sourceFile;
    private UUID textureID;
    private int textureLayer;

    public interface TextureUploadCompleteListener {
        void OnTextureUploadComplete(SLTextureUploadRequest sLTextureUploadRequest);
    }

    public SLTextureUploadRequest(File file, int i) {
        this.sourceFile = file;
        this.textureLayer = i;
    }

    public UUID getTextureID() {
        return this.textureID;
    }

    /**
     * Two-step capability upload (UploadBakedTexture): ask the capability for
     * an uploader URL, POST the JPEG-2000 file there, and read new_asset from
     * the LLSD reply. The listener is always called, with textureID left null
     * when the upload failed, so a bake in progress can continue.
     */
    @Override
    public void run() {
        try {
            String uploaderURL = new LLSDXMLRequest().PerformRequest(this.capURL, new LLSDUndefined()).byKey("uploader").asString();
            Debug.Log("TextureUploader: uploader URL = " + uploaderURL);
            Response response = SLHTTPSConnection.getOkHttpClient().newCall(new Request.Builder()
                    .url(uploaderURL)
                    .header("Accept", "application/llsd+xml")
                    .post(RequestBody.create(MEDIA_TYPE_JP2, this.sourceFile))
                    .build()).execute();
            if (response == null) {
                throw new IOException("Null response");
            }
            try {
                if (!response.isSuccessful()) {
                    throw new IOException("Error code " + response.code());
                }
                LLSDNode reply = LLSDNode.parseXML(response.body().byteStream(), null);
                Debug.Log("TextureUploader: LLSD response = " + reply.serializeToXML());
                this.textureID = reply.byKey("new_asset").asUUID();
            } finally {
                response.close();
            }
        } catch (IOException e) {
            Debug.Warning(e);
        } catch (LLSDException e) {
            Debug.Warning(e);
        }
        if (this.onUploadComplete != null) {
            this.onUploadComplete.OnTextureUploadComplete(this);
        }
    }

    public void setCapURL(String str) {
        this.capURL = str;
    }

    public void setOnUploadComplete(TextureUploadCompleteListener textureUploadCompleteListener) {
        this.onUploadComplete = textureUploadCompleteListener;
    }
}
