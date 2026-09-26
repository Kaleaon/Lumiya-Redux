package com.lumiyaviewer.lumiya.slproto.https

import androidx.core.os.EnvironmentCompat
import com.google.common.net.HttpHeaders
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.IOException
import java.util.concurrent.atomic.AtomicReference
import okhttp3.Call
import okhttp3.MediaType
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.Response

open class LLSDXMLRequest {
    @JvmStatic private var MEDIA_TYPE_LLSD_XML: MediaType = MediaType.parse("application/llsd+xml")
    private var callRef: AtomicReference<Call> = AtomicReference<>(null)

    fun InterruptRequest() {
        var call: Call = this.callRef.get()
        if (call != null) {
            try {
                call.cancel()
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }

    public LLSDNode PerformRequest(String str, LLSDNode lsdNode) throws IOException, LLSDXMLException {
        var url: Request.Builder = Request.Builder().url(str)
        if (lsdNode != null) {
            url.post(RequestBody.create(MEDIA_TYPE_LLSD_XML, lsdNode.serializeToXML()))
        }
        url.header(HttpHeaders.ACCEPT, "application/llsd+binary;q=0.5,application/llsd+xml;q=0.1")
        var newCall: Call = SLHTTPSConnection.getOkHttpClient().newCall(url.build())
        this.callRef.set(newCall)
        try {
            var execute: Response = newCall.execute()
            if (execute == null) {
                throw IOException("Null response")
            }
            try {
                if (!execute.isSuccessful()) {
                    throw IOException("Unexpected code " + execute.code())
                }
                return LLSDNode.fromAny(execute.body().byteStream(), execute.header(HttpHeaders.CONTENT_TYPE, EnvironmentCompat.MEDIA_UNKNOWN))
            } finally {
                execute.close()
            }
        } finally {
            this.callRef.set(null)
        }
    }
}
