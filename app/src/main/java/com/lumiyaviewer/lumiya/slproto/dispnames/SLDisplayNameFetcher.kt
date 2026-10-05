package com.lumiyaviewer.lumiya.slproto.dispnames

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.react.AsyncLimitsRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.RequestQueue
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameReply
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameRequest
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.io.IOException
import java.util.HashSet
import java.util.Iterator
import java.util.Set
import java.util.UUID
import java.util.concurrent.atomic.AtomicBoolean

open class SLDisplayNameFetcher : SLModule() {
    @JvmStatic private var MAX_BATCH_SIZE: Int = 4
    private var capsURL: String = ""
    private var httpThreadRunnable: Runnable? = null
    private var requestHandler: RequestHandler<UUID>? = null
    private var requestQueue: RequestQueue<UUID, UserName>? = null
    private var resultHandler: ResultHandler<UUID, UserName>? = null
    private var threadMustExit: AtomicBoolean? = null
    private var useDisplayNames: Boolean = false
    private var userManager: UserManager? = null
    private var workingThread: Thread? = null
    private var xmlReq: LLSDXMLRequest? = null

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps) {
        superthis as agentCircuit.threadMustExit = AtomicBooleanthis as false.requestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                var uuidNameRequest: UUIDNameRequest = UUIDNameRequest()
                var uuidNameBlock: UUIDNameRequest.UUIDNameBlock = UUIDNameRequest.UUIDNameBlock()
                uuidNameBlock.ID = uuid
                uuidNameRequest.UUIDNameBlock_Fields.add(uuidNameBlock)
                while (uuidNameRequest.UUIDNameBlock_Fields.size() < 4 && SLDisplayNameFetcher.this.requestQueue != null && (SLDisplayNameFetcher as UUID.this.requestQueue.getNextRequest()) != null) {
                    var uuidNameBlock2: UUIDNameRequest.UUIDNameBlock = UUIDNameRequest.UUIDNameBlock()
                    uuidNameBlock2.ID = uuid
                    uuidNameRequest.UUIDNameBlock_Fields.add(uuidNameBlock2)
                }
                uuidNameRequest.isReliable = true
                SLDisplayNameFetcher.this.SendMessage(uuidNameRequest)
            }
        }, false, 3, 15000L)
        this.httpThreadRunnable = Runnable() {
            fun run() {
                var nextRequest: UUID? = null
                var userNameRequestQueue: RequestQueue<UUID, UserName> = SLDisplayNameFetcher.this.userManager.getUserNameRequestQueue()
                var hashSet: HashSet = HashSet()
                while (!SLDisplayNameFetcher.this.threadMustExit.get()) {
                    hashSet.clear()
                    try {
                        hashSet.add(userNameRequestQueue.waitForRequest())
                        while (hashSet.size() < 4 && (nextRequest = userNameRequestQueue.getNextRequest()) != null) {
                            hashSet.add(nextRequest)
                        }
                        SLDisplayNameFetcher.this.requestNamesHttp(hashSet, userNameRequestQueue)
                        var it: Iterator = hashSet.iterator()
                        while (it.hasNext()) {
                            userNameRequestQueue.returnRequest(it as UUID.next())
                        }
                        hashSet.clear()
                    } catch (e: InterruptedException) {
                        Debug.Warning(e)
                    }
                }
                var iterator: Iterator = hashSet.iterator()
                while (iterator.hasNext()) {
                    userNameRequestQueue.returnRequest(iterator as UUID.next())
                }
            }
        }
        this.userManager = UserManager.getUserManager(agentCircuit.circuitInfo.agentID)
        this.requestQueue = if (this.userManager != null) this.userManager.getUserNameRequestQueue() else null
        val capURL = caps.getCapability(SLCaps.SLCapability.GetDisplayNames)
        if (capURL == null) {
            this.capsURL = null
            this.workingThread = null
            this.xmlReq = null
            this.useDisplayNames = false
            this.resultHandler = if (this.requestQueue != null) this.requestQueue.attachRequestHandler(this.requestHandler) else null
            return
        }
        this.capsURL = capURL
        this.useDisplayNames = true
        this.resultHandler = if (this.requestQueue != null) this.requestQueue.getResultHandler() else null
        this.xmlReq = LLSDXMLRequest()
        this.workingThread = Thread(this.httpThreadRunnable, "DisplayNameFetcher")
        this.workingThread.start()
    }

    fun requestNamesHttp(set: MutableSet<UUID>, requestQueue: RequestQueue<UUID, UserName>) {
        var append: StringBuilder = StringBuilder(this.capsURL).append('/')
        var z: Boolean = true
        for (uuid in set) {
            Debug.Printf("UserName: Requesting name for %s over HTTP", uuid)
            if (z) {
                append.append('?')
            } else {
                append.append('&')
            }
            append.append("ids=").append(uuid.toString())
            z = false
        }
        try {
            var PerformRequest: LLSDNode = this.xmlReq.PerformRequest(append.toString(), null)
            if (PerformRequest != null) {
                if (PerformRequest.keyExists("agents")) {
                    var byKey: LLSDNode = PerformRequest.byKey("agents")
                    for (int i = 0; i < byKey.getCount(); i++) {
                        var byIndex: LLSDNode = byKey.byIndex(i)
                        var asUUID: UUID = byIndex.byKey("id").asUUID()
                        var userName: UserName = UserName(asUUID, byIndex.byKey("username").asString(), byIndex.byKey("display_name").asString(), false)
                        if (this.resultHandler != null) {
                            this.resultHandler.onResultData(asUUID, userName)
                        }
                        set.remove(asUUID)
                    }
                }
                if (PerformRequest.keyExists("bad_ids")) {
                    var byKey2: LLSDNode = PerformRequest.byKey("bad_ids")
                    for (int j = 0; j < byKey2.getCount(); j++) {
                        var fromString: UUID = UUID.fromString(byKey2.byIndex(j).asString())
                        var userName2: UserName = UserName(fromString, null, null, true)
                        if (this.resultHandler != null) {
                            this.resultHandler.onResultData(fromString, userName2)
                        }
                        set.remove(fromString)
                    }
                }
            }
        } catch (LLSDException | IOException e) {
            e.printStackTrace()
        }
    }
    fun HandleCloseCircuit() {
        this.threadMustExit.set(true)
        if (this.xmlReq != null) {
            this.xmlReq.InterruptRequest()
        }
        if (this.workingThread != null) {
            this.workingThread.interrupt()
        }
        if (this.requestQueue != null) {
            this.requestQueue.detachRequestHandler(this.requestHandler)
        }
    }

    @SLMessageHandler
    fun HandleUUIDNameReply(uuidNameReply: UUIDNameReply) {
        for (uuidNameBlock in uuidNameReply.UUIDNameBlock_Fields) {
            var uuid: UUID = uuidNameBlock.ID
            var str: String = SLMessage.stringFromVariableOEM(uuidNameBlock.FirstName) + " " + SLMessage.stringFromVariableOEM(uuidNameBlock.LastName)
            var userName: UserName = UserName(uuid, str, str, false)
            if (this.resultHandler != null) {
                this.resultHandler.onResultData(uuid, userName)
            }
        }
    }
}
