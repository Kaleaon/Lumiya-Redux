package com.lumiyaviewer.lumiya.slproto.https

import androidx.core.os.EnvironmentCompat
import com.google.common.net.HttpHeaders
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDStreamingParser
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.IOException
import java.util.concurrent.atomic.AtomicReference
import okhttp3.Call
import okhttp3.MediaType
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.Response

open class LLSDStreamingXMLRequest {
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

    public void PerformRequest(String str, LLSDNode lsdNode, LLSDStreamingParser.LLSDContentHandler lsdContentHandler) throws IOException, LLSDXMLException {
        var header: Request.Builder = Request.Builder().url(str).header(HttpHeaders.ACCEPT, "application/llsd+binary;q=0.5,application/llsd+xml;q=0.1")
        if (lsdNode != null) {
            header.post(RequestBody.create(MEDIA_TYPE_LLSD_XML, lsdNode.serializeToXML()))
        }
        var newCall: Call = SLHTTPSConnection.getOkHttpClient().newCall(header.build())
        this.callRef.set(newCall)
        try {
            var execute: Response = newCall.execute()
            if (execute == null) {
                throw IOException("Null response")
            }
            try {
                if (!execute.isSuccessful()) {
                    throw IOException("Error response: " + execute.code())
                }
                LLSDStreamingParser.parseAny(execute.body().byteStream(), execute.header(HttpHeaders.CONTENT_TYPE, EnvironmentCompat.MEDIA_UNKNOWN), lsdContentHandler)
            } finally {
                execute.close()
                this.callRef.set(null)
            }
        } catch (e: LLSDXMLException) {
            this.callRef.set(null)
            var e: throw = null
        } catch (e2: IOException) {
            this.callRef.set(null)
            var e2: throw = null
        } catch (e3: Exception) {
            this.callRef.set(null)
            throw IOException(e3.getMessage(), e3)
        }
    }
}
