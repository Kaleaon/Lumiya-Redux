package com.lumiyaviewer.lumiya.slproto.https

import androidx.core.os.EnvironmentCompat
import com.google.common.net.HttpHeaders
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.IOException
import java.util.concurrent.atomic.AtomicReference
import okhttp3.Call
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response

open class LLSDXMLRequest {
    private var callRef: AtomicReference<Call?> = AtomicReference(null)

    open fun InterruptRequest() {
        val call: Call? = this.callRef.get()
        if (call != null) {
            try {
                call.cancel()
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }

    @Throws(IOException::class, LLSDXMLException::class)
    open fun PerformRequest(str: String, lsdNode: LLSDNode?): LLSDNode {
        val builder: Request.Builder = Request.Builder().url(str)
        if (lsdNode != null) {
            builder.post(lsdNode.serializeToXML().toRequestBody(MEDIA_TYPE_LLSD_XML))
        }
        builder.header(HttpHeaders.ACCEPT, "application/llsd+binary;q=0.5,application/llsd+xml;q=0.1")
        val newCall: Call = SLHTTPSConnection.getOkHttpClient().newCall(builder.build())
        this.callRef.set(newCall)
        try {
            val execute: Response = newCall.execute()
            try {
                if (!execute.isSuccessful) {
                    throw IOException("Unexpected code ${execute.code}")
                }
                val body = execute.body ?: throw IOException("Null response body")
                val contentType = execute.header(HttpHeaders.CONTENT_TYPE, EnvironmentCompat.MEDIA_UNKNOWN)
                return LLSDNode.fromAny(body.byteStream(), contentType)
            } finally {
                execute.close()
            }
        } finally {
            this.callRef.set(null)
        }
    }

    companion object {
        @JvmStatic
        private val MEDIA_TYPE_LLSD_XML = "application/llsd+xml".toMediaTypeOrNull()
    }
}
