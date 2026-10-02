package com.lumiyaviewer.lumiya.slproto.https

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.IOException

open class LLSDXMLAsyncRequest(
    url: String,
    requestNode: LLSDNode,
    listener: LLSDXMLResultListener
) {
    fun interface LLSDXMLResultListener {
        fun onLLSDXMLResult(result: LLSDNode?)
    }

    init {
        Thread {
            var result: LLSDNode? = null
            try {
                result = LLSDXMLRequest().PerformRequest(url, requestNode)
            } catch (e: LLSDXMLException) {
                Debug.Warning(e)
            } catch (e: IOException) {
                Debug.Warning(e)
            }
            listener.onLLSDXMLResult(result)
        }.start()
    }
}
