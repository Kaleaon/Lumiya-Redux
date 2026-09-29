package com.lumiyaviewer.lumiya.slproto.modules.texuploader

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

open class SLTextureUploader : SLModule() {
    private var capURL: String = ""
    private var executor: ExecutorService? = null

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps) {
        superthis as agentCircuit.capURL = caps.getCapability(SLCaps.SLCapability.UploadBakedTexture)
        if (this.capURL != null) {
            this.executor = Executors.newSingleThreadExecutor()
        }
    }

    fun BeginUpload(textureUploadRequest: SLTextureUploadRequest) {
        if (this.executor == null || this.capURL == null) {
            return
        }
        textureUploadRequest.setCapURL(this.capURL)
        this.executor.execute(textureUploadRequest)
    }
    fun HandleCloseCircuit() {
        if (this.executor != null) {
            this.executor.shutdownNow()
            this.executor = null
        }
        super.HandleCloseCircuit()
    }
}
