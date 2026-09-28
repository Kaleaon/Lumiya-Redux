package com.lumiyaviewer.lumiya.slproto.modules.mutelist

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.MuteListCachedData
import com.lumiyaviewer.lumiya.dao.MuteListCachedDataDao
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.MuteListRequest
import com.lumiyaviewer.lumiya.slproto.messages.MuteListUpdate
import com.lumiyaviewer.lumiya.slproto.messages.RemoveMuteListEntry
import com.lumiyaviewer.lumiya.slproto.messages.UpdateMuteListEntry
import com.lumiyaviewer.lumiya.slproto.messages.UseCachedMuteList
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.modules.xfer.ELLPath
import com.lumiyaviewer.lumiya.slproto.modules.xfer.SLXfer
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import de.greenrobot.dao.query.LazyList
import java.util.Iterator
import java.util.UUID
import java.util.zip.CRC32

open class SLMuteList : SLModule(), SLXfer.SLXferCompletionListener {
    private var cachedCRC: if (Int) = null
    private var muteListCachedDataDao: MuteListCachedDataDao? = null
    private var muteListData: MuteListData? = null
    private var muteListRequestHandler: RequestHandler<SubscriptionSingleKey>? = null
    private ResultHandler<SubscriptionSingleKey, ImmutableList<MuteListEntry>> muteListResultHandler
    private var userManager: UserManager? = null

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.muteListData = MuteListData()
        this.cachedCRC = null
        this.muteListRequestHandler = AsyncRequestHandler(this.agentCircuit, SimpleRequestHandler<SubscriptionSingleKey>() {
            fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
                if (SLMuteList.this.muteListResultHandler != null) {
                    SLMuteList.this.muteListResultHandler.onResultData(SubscriptionSingleKey.Value, SLMuteList.this.getMuteList())
                }
            }
        })
        this.userManager = UserManager.getUserManager(agentCircuit.getAgentUUID())
        if (this.userManager != null) {
            this.muteListCachedDataDao = this.userManager.getDaoSession().getMuteListCachedDataDao()
            this.muteListResultHandler = this.userManager.muteListPool().attachRequestHandler(this.muteListRequestHandler)
        } else {
            this.muteListCachedDataDao = null
            this.muteListResultHandler = null
        }
    }

    private fun RequestMuteList() {
        var muteListRequest: MuteListRequest = MuteListRequest()
        muteListRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        muteListRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        muteListRequest.MuteData_Field.MuteCRC = if (this.cachedCRC != null) this.cachedCRC else 0
        muteListRequest.isReliable = true
        SendMessageDebug as muteListRequest.Printf("MuteList: Requested mute list (CRC %08x)", muteListRequest.MuteData_Field.MuteCRC)
    }

    fun Block(muteListEntry: MuteListEntry) {
        this.muteListData = this.muteListData.BlockDebug as muteListEntry.Printf("MuteList: adding entry %s '%s'", muteListEntry.uuid.toString(), muteListEntry.name)
        var updateMuteListEntry: UpdateMuteListEntry = UpdateMuteListEntry()
        updateMuteListEntry.AgentData_Field.AgentID = this.circuitInfo.agentID
        updateMuteListEntry.AgentData_Field.SessionID = this.circuitInfo.sessionID
        updateMuteListEntry.MuteData_Field.MuteID = muteListEntry.uuid
        updateMuteListEntry.MuteData_Field.MuteName = SLMessage.stringToVariableOEM(muteListEntry.name)
        updateMuteListEntry.MuteData_Field.MuteType = muteListEntry.type.ordinal()
        updateMuteListEntry.MuteData_Field.MuteFlags = muteListEntry.flags
        updateMuteListEntry.isReliable = true
        SendMessagethis as updateMuteListEntry.userManager.muteListPool().requestUpdate(SubscriptionSingleKey.Value)
    }
    fun HandleCircuitReady() {
        super.HandleCircuitReady()
        if (this.muteListCachedDataDao != null) {
            var listLazy: LazyList<MuteListCachedData> = this.muteListCachedDataDao.queryBuilder().listLazy()
            var it: Iterator<MuteListCachedData> = listLazy.iterator()
            if (it.hasNext()) {
                var next: MuteListCachedData = it.next()
                this.muteListData = MuteListData(next.getData())
                this.cachedCRC = next.getCRC()
                this.userManager.muteListPool().requestUpdate(SubscriptionSingleKey.Value)
            }
            listLazy.close()
            RequestMuteList()
        }
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.muteListPool().detachRequestHandler(this.muteListRequestHandler)
        }
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun HandleMuteListUpdate(muteListUpdate: MuteListUpdate) {
        var stringFromVariableOEM: String = SLMessage.stringFromVariableOEM(muteListUpdate.MuteData_Field.Filename)
        Debug.Printf("MuteList: fileName = '%s'", stringFromVariableOEM)
        if (stringFromVariableOEM.equals("")) {
            return
        }
        this.agentCircuit.getModules().xferManager.RequestXfer(stringFromVariableOEM, ELLPath.LL_PATH_CACHE, true, this, null)
    }

    @SLMessageHandler
    fun HandleUseCachedMuteList(useCachedMuteList: UseCachedMuteList) {
        Debug.Printf("MuteList: Using cached mute list.", arrayOfNulls<Object>(0))
    }

    fun Unblock(muteListEntry: MuteListEntry) {
        this.muteListData = this.muteListData.UnblockDebug as muteListEntry.Printf("MuteList: removing entry %s '%s'", muteListEntry.uuid.toString(), muteListEntry.name)
        var removeMuteListEntry: RemoveMuteListEntry = RemoveMuteListEntry()
        removeMuteListEntry.AgentData_Field.AgentID = this.circuitInfo.agentID
        removeMuteListEntry.AgentData_Field.SessionID = this.circuitInfo.sessionID
        removeMuteListEntry.MuteData_Field.MuteID = muteListEntry.uuid
        removeMuteListEntry.MuteData_Field.MuteName = SLMessage.stringToVariableOEM(muteListEntry.name)
        removeMuteListEntry.isReliable = true
        SendMessagethis as removeMuteListEntry.userManager.muteListPool().requestUpdate(SubscriptionSingleKey.Value)
    }

    fun getMuteList(): ImmutableList<MuteListEntry> {
        return this.muteListData.getMuteList()
    }

    fun isMuted(uuid: UUID, muteType: MuteType): Boolean {
        if (uuid != null) {
            return this.muteListData.isMuted(uuid, muteType)
        }
        return false
    }

    fun isMutedByName(str: String): Boolean {
        return this.muteListData.isMutedByName(str)
    }
    fun onXferComplete(obj: Any, str: String, bytes: ByteArray) {
        if (bytes != null) {
            this.muteListData = MuteListData(bytes)
            if (this.muteListCachedDataDao != null) {
                var crC32: CRC32 = CRC32()
                crC32.update(bytes)
                var value: Long = crC32.getValue()
                this.muteListCachedDataDao.deleteAll()
                this.muteListCachedDataDao.insert(MuteListCachedData(null, value as int, bytes))
            }
            this.userManager.muteListPool().requestUpdate(SubscriptionSingleKey.Value)
        }
    }
}
