package com.lumiyaviewer.lumiya.slproto.modules.texuploader;

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.modules.SLModule;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class SLTextureUploader extends SLModule {
    private String capURL;
    private ExecutorService executor;

    public SLTextureUploader(SLAgentCircuit agentCircuit, SLCaps caps) {
        super(agentCircuit);
        this.capURL = caps.getCapability(SLCaps.SLCapability.UploadBakedTexture);
        if (this.capURL != null) {
            this.executor = Executors.newSingleThreadExecutor();
        }
    }

    public void BeginUpload(SLTextureUploadRequest textureUploadRequest) {
        if (this.executor == null || this.capURL == null) {
            return;
        }
        textureUploadRequest.setCapURL(this.capURL);
        this.executor.execute(textureUploadRequest);
    }

    @Override
    public void HandleCloseCircuit() {
        if (this.executor != null) {
            this.executor.shutdownNow();
            this.executor = null;
        }
        super.HandleCloseCircuit();
    }
}
