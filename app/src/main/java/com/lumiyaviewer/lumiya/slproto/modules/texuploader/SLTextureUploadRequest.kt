package com.lumiyaviewer.lumiya.slproto.modules.texuploader

import com.google.common.net.HttpHeaders
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined
import java.io.File
import java.io.IOException
import java.util.UUID
import okhttp3.MediaType
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.Response

open class SLTextureUploadRequest : Runnable {
    @JvmStatic private var MEDIA_TYPE_JP2: MediaType = MediaType.parse("image/x-j2c")
    private var capURL: String = ""
    var onUploadComplete: TextureUploadCompleteListener? = null
    private var sourceFile: File? = null
    private var textureID: UUID? = null
    private var textureLayer: Int = 0

    interface TextureUploadCompleteListener {
        void OnTextureUploadComplete(SLTextureUploadRequest textureUploadRequest)
    }

    constructor(file: File, textureLayer: Int) {
        this.sourceFile = file
        this.textureLayer = textureLayer
    }

    fun getTextureID(): UUID {
        return this.textureID
    }

    /**
     * Two-step capability upload (UploadBakedTexture): ask the capability for
     * an uploader URL, POST the JPEG-2000 file there, and read new_asset from
     * the LLSD reply. The listener is always called, with textureID left null
     * when the upload failed, so a bake in progress can continue.
     */
    fun run() {
        try {
            var uploaderURL: String = LLSDXMLRequest().PerformRequest(this.capURL, LLSDUndefined()).byKey("uploader").asString()
            Debug.Log("TextureUploader: uploader URL = " + uploaderURL)
            var response: Response = SLHTTPSConnection.getOkHttpClient().newCall(Request.Builder()
                    .url(uploaderURL)
                    .header("Accept", "application/llsd+xml")
                    .post(RequestBody.create(MEDIA_TYPE_JP2, this.sourceFile))
                    .build()).execute()
            if (response == null) {
                throw IOException("Null response")
            }
            try {
                if (!response.isSuccessful()) {
                    throw IOException("Error code " + response.code())
                }
                var reply: LLSDNode = LLSDNode.parseXML(response.body().byteStream(), null)
                Debug.Log("TextureUploader: LLSD response = " + reply.serializeToXML())
                this.textureID = reply.byKey("new_asset").asUUID()
            } finally {
                response.close()
            }
        } catch (e: IOException) {
            Debug.Warning(e)
        } catch (e: LLSDException) {
            Debug.Warning(e)
        }
        if (this.onUploadComplete != null) {
            this.onUploadComplete.OnTextureUploadComplete(this)
        }
    }

    fun setCapURL(capURL: String) {
        this.capURL = capURL
    }

    fun setOnUploadComplete(textureUploadCompleteListener: TextureUploadCompleteListener) {
        this.onUploadComplete = textureUploadCompleteListener
    }
}
