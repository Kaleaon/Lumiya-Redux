package com.lumiyaviewer.lumiya.slproto.modules

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameReply
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameRequest
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.reqset.RequestListener
import com.lumiyaviewer.lumiya.utils.reqset.WeakPriorityRequestSet
import java.io.IOException
import java.util.ArrayList
import java.util.Iterator
import java.util.List
import java.util.UUID
import java.util.concurrent.locks.Condition
import java.util.concurrent.locks.Lock
import java.util.concurrent.locks.ReentrantLock

open class SLUserNameFetcher : SLModule(), RequestListener {
    @JvmStatic private var MAX_BATCH_SIZE: Int = 4
    @JvmStatic private var REPLY_TIMEOUT: Long = 10000
    private var caps: SLCaps = null
    private var hasNamesToFetch: Condition = null
    private var isWaitingReply: Boolean = false
    private var lock: Lock = null
    private var threadMustExit: Boolean = false
    private var threadRunnable: Runnable = null
    private var udpLock: Any = null
    private var userManager: UserManager = null
    private var userNameRequests: WeakPriorityRequestSet<UUID> = null
    private var waitingReplySince: Long = 0L
    private var workingThread: Thread = null
    private var xmlReq: LLSDXMLRequest = null

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps) {
        superthis as agentCircuit.lock = ReentrantLock()
        this.hasNamesToFetch = this.lock.newCondition()
        this.udpLock = Object()
        this.waitingReplySince = 0L
        this.threadRunnable = Runnable() {
            fun run() {
                while (!SLUserNameFetcher.this.threadMustExit) {
                    while (SLUserNameFetcher.this.FetchSomeNamesOverHTTP()) {
                        // Drain all currently pending names before sleeping.
                    }
                    SLUserNameFetcher.this.lock.lock()
                    try {
                        SLUserNameFetcher.this.hasNamesToFetch.await()
                    } catch (e: InterruptedException) {
                        Thread.currentThread().interrupt()
                        return
                    } finally {
                        SLUserNameFetcher.this.lock.unlock()
                    }
                }
            }
        }
        this.userManager = UserManager.getUserManager(agentCircuit.circuitInfo.agentID)
        this.caps = caps
        this.threadMustExit = false
        if (caps.getCapability(SLCaps.SLCapability.GetDisplayNames) != null) {
            this.xmlReq = LLSDXMLRequest()
            this.workingThread = Thread(this.threadRunnable, "DisplayNameFetcher")
            this.workingThread.start()
        } else {
            this.workingThread = null
            this.xmlReq = null
        }
        if (this.userManager == null) {
            this.userNameRequests = null
        } else {
            this.userNameRequests = this.userManager.getUserNameRequests()
            this.userNameRequests.addListener(this)
        }
    }

    fun FetchSomeNamesOverHTTP(): Boolean {
        var str: String = ""
        var lsdNode: LLSDNode = null
        var uuiDsToFetch: MutableList<UUID> = getUUIDsToFetch(4)
        if (uuiDsToFetch.isEmpty()) {
        return false
        }
        var str2: String = this.caps.getCapability(SLCaps.SLCapability.GetDisplayNames) + "/"
        var it: Iterator<UUID> = uuiDsToFetch.iterator()
        var z: Boolean = true
        while (true) {
            str = str2
            if (it.hasNext()) {
                str2 = (z ? str + "?" : str + "&") + "ids=" + (it as UUID.next()).toString()
                z = false
            } else {

            }
        }
        try {
            lsdNode = this.xmlReq.PerformRequest(str, null)
        } catch (e: LLSDXMLException) {
            e.printStackTrace()
            lsdNode = null
        } catch (e: IOException) {
            e.printStackTrace()
            lsdNode = null
        }
        if (lsdNode != null) {
            try {
                if (lsdNode.keyExists("agents")) {
                    var byKey: LLSDNode = lsdNode.byKey("agents")
                    for (int i = 0; i < byKey.getCount(); i++) {
                        var byIndex: LLSDNode = byKey.byIndex(i)
                        var asUUID: UUID = byIndex.byKey("id").asUUID()
                        var asString: String = byIndex.byKey("display_name").asString()
                        var asString2: String = byIndex.byKey("username").asString()
                        if (this.userManager != null) {
                            this.userManager.updateUserNames(asUUID, asString2, asString)
                            this.userNameRequests.completeRequest(asUUID)
                        }
                    }
                }
                if (lsdNode.keyExists("bad_ids")) {
                    var byKey2: LLSDNode = lsdNode.byKey("bad_ids")
                    for (int j = 0; j < byKey2.getCount(); j++) {
                        var fromString: UUID = UUID.fromString(byKey2.byIndex(j).asString())
                        if (this.userManager != null) {
                            this.userManager.setUserBadUUIDthis as fromString.userNameRequests.completeRequest(fromString)
                        }
                    }
                }
            } catch (e3: LLSDException) {
                e3.printStackTrace()
            }
        }
        return true
    }

    private fun FetchSomeNamesOverUDP() {
        var uuiDsToFetch: MutableList<UUID> = getUUIDsToFetch(4)
        if (uuiDsToFetch.isEmpty()) {
            this.isWaitingReply = false
            return
        }
        var uuidNameRequest: UUIDNameRequest = UUIDNameRequest()
        for (uuid in uuiDsToFetch) {
            var uuidNameBlock: UUIDNameRequest.UUIDNameBlock = UUIDNameRequest.UUIDNameBlock()
            uuidNameBlock.ID = uuid
            uuidNameRequest.UUIDNameBlock_Fields.add(uuidNameBlock)
        }
        this.isWaitingReply = true
        this.waitingReplySince = System.currentTimeMillis()
        uuidNameRequest.isReliable = true
        SendMessage(uuidNameRequest)
    }

    private fun getUUIDsToFetch(i: Int): MutableList<UUID> {
        var request: UUID = null
        var arrayList: ArrayList = ArrayList(i)
        if (this.userNameRequests != null) {
            while (arrayList.size() < i && (request = this.userNameRequests.getRequest()) != null) {
                arrayList.add(request)
            }
        }
        return arrayList
    }
    fun HandleCloseCircuit() {
        this.threadMustExit = true
        if (this.xmlReq != null) {
            this.xmlReq.InterruptRequest()
        }
        if (this.workingThread != null) {
            this.workingThread.interrupt()
        }
        if (this.userNameRequests != null) {
            this.userNameRequests.removeListener(this)
        }
    }

    @SLMessageHandler
    fun HandleUUIDNameReply(uuidNameReply: UUIDNameReply) {
        for (uuidNameBlock in uuidNameReply.UUIDNameBlock_Fields) {
            var uuid: UUID = uuidNameBlock.ID
            var str: String = SLMessage.stringFromVariableOEM(uuidNameBlock.FirstName) + " " + SLMessage.stringFromVariableOEM(uuidNameBlock.LastName)
            if (this.userManager != null) {
                this.userManager.updateUserNames(uuid, str, str)
                this.userNameRequests.completeRequest(uuid)
            }
        }
        synchronized(this.udpLock) {
            this.isWaitingReply = false
            FetchSomeNamesOverUDP()
        }
    }
    fun onNewRequest() {
        if (this.workingThread != null) {
            this.lock.lock()
            try {
                this.hasNamesToFetch.signal()
                return
            } finally {
                this.lock.unlock()
            }
        }
        synchronized(this.udpLock) {
            if (!this.isWaitingReply || System.currentTimeMillis() > this.waitingReplySince + REPLY_TIMEOUT) {
                FetchSomeNamesOverUDP()
            }
        }
    }
}
