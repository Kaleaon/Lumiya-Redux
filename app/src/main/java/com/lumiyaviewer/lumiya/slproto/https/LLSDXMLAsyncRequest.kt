package com.lumiyaviewer.lumiya.slproto.https

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.IOException

open class LLSDXMLAsyncRequest {

    interface LLSDXMLResultListener {
        void onLLSDXMLResult(LLSDNode lLSDNode)
    }

    constructor(str: final String, lLSDNode: LLSDNode, lLSDXMLResultListener: LLSDXMLResultListener) {
        Thread(Runnable() {
            fun run() {
                var lLSDNode2: LLSDNode? = null
                try {
                    lLSDNode2 = LLSDXMLRequest().PerformRequest(str, lLSDNode)
                } catch (e: LLSDXMLException) {
                    Debug.Warning(e)
                    lLSDNode2 = null
                } catch (e2: IOException) {
                    Debug.Warning(e2)
                    lLSDNode2 = null
                }
                lLSDXMLResultListener.onLLSDXMLResult(lLSDNode2)
            }
        }).start()
    }
}
