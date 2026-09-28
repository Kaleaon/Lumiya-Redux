package com.lumiyaviewer.lumiya.slproto.modules.search

import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.dao.SearchGridResultDao
import com.lumiyaviewer.lumiya.react.AsyncLimitsRequestHandler
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.DirFindQuery
import com.lumiyaviewer.lumiya.slproto.messages.DirGroupsReply
import com.lumiyaviewer.lumiya.slproto.messages.DirPeopleReply
import com.lumiyaviewer.lumiya.slproto.messages.DirPlacesQuery
import com.lumiyaviewer.lumiya.slproto.messages.DirPlacesReply
import com.lumiyaviewer.lumiya.slproto.messages.ParcelInfoReply
import com.lumiyaviewer.lumiya.slproto.messages.ParcelInfoRequest
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.LevensteinDistance
import com.lumiyaviewer.lumiya.utils.UUIDPool
import de.greenrobot.dao.query.LazyList
import de.greenrobot.dao.query.WhereCondition
import java.util.Iterator
import java.util.UUID
import java.util.concurrent.atomic.AtomicReference

open class SLSearch : SLModule() {
    @JvmStatic private var DFQ_ADULT_SIMS_ONLY: Int = 134217728
    @JvmStatic private var DFQ_AGENT_OWNED: Int = 64
    @JvmStatic private var DFQ_AREA_SORT: Int = 262144
    @JvmStatic private var DFQ_AUCTION: Int = 512
    @JvmStatic private var DFQ_DATE_EVENTS: Int = 32
    @JvmStatic private var DFQ_DWELL_SORT: Int = 1024
    @JvmStatic private var DFQ_EVENTS: Int = 8
    @JvmStatic private var DFQ_FILTER_MATURE: Int = 4194304
    @JvmStatic private var DFQ_FOR_SALE: Int = 128
    @JvmStatic private var DFQ_GROUPS: Int = 16
    @JvmStatic private var DFQ_GROUP_OWNED: Int = 256
    @JvmStatic private var DFQ_INC_ADULT: Int = 67108864
    @JvmStatic private var DFQ_INC_MATURE: Int = 33554432
    @JvmStatic private var DFQ_INC_NEW_VIEWER: Int = 117440512
    @JvmStatic private var DFQ_INC_PG: Int = 16777216
    @JvmStatic private var DFQ_LIMIT_BY_AREA: Int = 2097152
    @JvmStatic private var DFQ_LIMIT_BY_PRICE: Int = 1048576
    @JvmStatic private var DFQ_MATURE_SIMS_ONLY: Int = 16384
    @JvmStatic private var DFQ_NAME_SORT: Int = 524288
    @JvmStatic private var DFQ_ONLINE: Int = 2
    @JvmStatic private var DFQ_PEOPLE: Int = 1
    @JvmStatic private var DFQ_PER_METER_SORT: Int = 131072
    @JvmStatic private var DFQ_PG_EVENTS_ONLY: Int = 8192
    @JvmStatic private var DFQ_PG_PARCELS_ONLY: Int = 8388608
    @JvmStatic private var DFQ_PG_SIMS_ONLY: Int = 2048
    @JvmStatic private var DFQ_PICTURES_ONLY: Int = 4096
    @JvmStatic private var DFQ_PLACES: Int = 4
    @JvmStatic private var DFQ_PRICE_SORT: Int = 65536
    @JvmStatic private var DFQ_SORT_ASC: Int = 32768
    private var currentSearchQuery: AtomicReference<SearchGridQuery>? = null
    private var parcelInfoRequestHandler: RequestHandler<UUID>? = null
    private var parcelInfoResultHandler: ResultHandler<UUID, ParcelInfoReply>? = null
    private var searchRequestHandler: RequestHandler<SearchGridQuery>? = null
    private ResultHandler<SearchGridQuery, LazyList<SearchGridResult>> searchResultHandler
    private var userManager: UserManager? = null

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.currentSearchQuery = AtomicReference<>this as null.searchRequestHandler = AsyncRequestHandler(this.agentCircuit, SimpleRequestHandler<SearchGridQuery>() {
            fun onRequest(searchGridQuery: SearchGridQuery) {
                SLSearch.this.currentSearchQuery.set(searchGridQuery)
                switch (searchGridQuery.searchType()) {
                    Groups ->
                        SLSearch.this.SearchGroups(searchGridQuery.searchText(), searchGridQuery.searchUUID())

                    People ->
                        SLSearch.this.SearchPeople(searchGridQuery.searchText(), searchGridQuery.searchUUID())

                    Places ->
                        SLSearch.this.SearchPlaces(searchGridQuery.searchText(), searchGridQuery.searchUUID())

                }
            }
        })
        this.parcelInfoRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                Debug.Printf("ParcelInfo: Requesting for %s", uuid)
                var parcelInfoRequest: ParcelInfoRequest = ParcelInfoRequest()
                parcelInfoRequest.AgentData_Field.AgentID = SLSearch.this.circuitInfo.agentID
                parcelInfoRequest.AgentData_Field.SessionID = SLSearch.this.circuitInfo.sessionID
                parcelInfoRequest.Data_Field.ParcelID = uuid
                parcelInfoRequest.isReliable = true
                SLSearch.this.SendMessage(parcelInfoRequest)
            }
        }, false, 3, 15000L)
        this.userManager = UserManager.getUserManager(agentCircuit.getAgentUUID())
        if (this.userManager != null) {
            this.searchResultHandler = this.userManager.getSearchManager().searchResults().attachRequestHandler(this.searchRequestHandler)
            this.parcelInfoResultHandler = this.userManager.parcelInfoData().getRequestSource().attachRequestHandler(this.parcelInfoRequestHandler)
        } else {
            this.searchResultHandler = null
            this.parcelInfoResultHandler = null
        }
    }

    fun SearchGroups(str: String, uuid: UUID) {
        var dirFindQuery: DirFindQuery = DirFindQuery()
        dirFindQuery.AgentData_Field.AgentID = this.circuitInfo.agentID
        dirFindQuery.AgentData_Field.SessionID = this.circuitInfo.sessionID
        dirFindQuery.QueryData_Field.QueryID = uuid
        dirFindQuery.QueryData_Field.QueryText = SLMessage.stringToVariableUTFdirFindQuery as str.QueryData_Field.QueryFlags = 117440528
        dirFindQuery.QueryData_Field.QueryStart = 0
        dirFindQuery.isReliable = true
        SendMessage(dirFindQuery)
    }

    fun SearchPeople(str: String, uuid: UUID) {
        var dirFindQuery: DirFindQuery = DirFindQuery()
        dirFindQuery.AgentData_Field.AgentID = this.circuitInfo.agentID
        dirFindQuery.AgentData_Field.SessionID = this.circuitInfo.sessionID
        dirFindQuery.QueryData_Field.QueryID = uuid
        dirFindQuery.QueryData_Field.QueryText = SLMessage.stringToVariableUTFdirFindQuery as str.QueryData_Field.QueryFlags = 117440513
        dirFindQuery.QueryData_Field.QueryStart = 0
        dirFindQuery.isReliable = true
        SendMessage(dirFindQuery)
    }

    fun SearchPlaces(str: String, uuid: UUID) {
        var dirPlacesQuery: DirPlacesQuery = DirPlacesQuery()
        dirPlacesQuery.AgentData_Field.AgentID = this.circuitInfo.agentID
        dirPlacesQuery.AgentData_Field.SessionID = this.circuitInfo.sessionID
        dirPlacesQuery.QueryData_Field.QueryID = uuid
        dirPlacesQuery.QueryData_Field.QueryText = SLMessage.stringToVariableUTFdirPlacesQuery as str.QueryData_Field.QueryFlags = 117440516
        dirPlacesQuery.QueryData_Field.QueryStart = 0
        dirPlacesQuery.QueryData_Field.SimName = SLMessage.stringToVariableOEM("")
        dirPlacesQuery.isReliable = true
        SendMessage(dirPlacesQuery)
    }

    private fun updateSearchResults(searchGridResultDao: SearchGridResultDao, searchGridQuery: SearchGridQuery) {
        if (this.searchResultHandler != null) {
            this.searchResultHandler.onResultData(searchGridQuery, searchGridResultDao.queryBuilder().where(SearchGridResultDao.Properties.SearchUUID.eq(searchGridQuery.searchUUID()), arrayOfNulls<WhereCondition>(0)).orderAsc(SearchGridResultDao.Properties.LevensteinDistance).listLazyUncached())
            this.userManager.getSearchManager().getSearchRepository().deleteOtherQueries(searchGridQuery.searchUUID())
        }
    }

    @SLMessageHandler
    fun DirGroupsReply(dirGroupsReply: DirGroupsReply) {
        var uuid: UUID = dirGroupsReply.QueryData_Field.QueryID
        var searchGridQuery: SearchGridQuery = this.currentSearchQuery.get()
        if (!Objects.equal(searchGridQuery.searchUUID(), uuid) || this.userManager == null || this.searchResultHandler == null) {
            return
        }
        var searchGridResultDao: SearchGridResultDao = this.userManager.getSearchManager().getSearchGridResultDao()
        for (queryReplies in dirGroupsReply.QueryReplies_Fields) {
            if (!queryReplies.GroupID.equals(UUIDPool.ZeroUUID)) {
                var stringFromVariableOEM: String = SLMessage.stringFromVariableOEM(queryReplies.GroupName)
                this.userManager.getSearchManager().getSearchRepository().insert(SearchGridResult(null, uuid, SearchGridQuery.SearchType.Groups.ordinal(), queryReplies.GroupID, stringFromVariableOEM, LevensteinDistance.computeLevensteinDistance(stringFromVariableOEM, searchGridQuery.searchText()), queryReplies.Members))
            }
        }
        updateSearchResults(searchGridResultDao, searchGridQuery)
    }

    @SLMessageHandler
    fun DirPeopleReply(dirPeopleReply: DirPeopleReply) {
        var searchGridQuery: SearchGridQuery = this.currentSearchQuery.get()
        var uuid: UUID = dirPeopleReply.QueryData_Field.QueryID
        if (!Objects.equal(searchGridQuery.searchUUID(), uuid) || this.userManager == null || this.searchResultHandler == null) {
            return
        }
        var searchGridResultDao: SearchGridResultDao = this.userManager.getSearchManager().getSearchGridResultDao()
        for (queryReplies in dirPeopleReply.QueryReplies_Fields) {
            var uuid2: UUID = queryReplies.AgentID
            if (uuid2.getLeastSignificantBits() != 0 || uuid2.getMostSignificantBits() != 0) {
                var str: String = SLMessage.stringFromVariableOEM(queryReplies.FirstName) + " " + SLMessage.stringFromVariableOEM(queryReplies.LastName)
                this.userManager.getSearchManager().getSearchRepository().insert(SearchGridResult(null, uuid, SearchGridQuery.SearchType.People.ordinal(), uuid2, str, LevensteinDistance.computeLevensteinDistance(str, searchGridQuery.searchText()), 0))
            }
        }
        updateSearchResults(searchGridResultDao, searchGridQuery)
    }

    @SLMessageHandler
    fun DirPlacesReply(dirPlacesReply: DirPlacesReply) {
        var searchGridQuery: SearchGridQuery = this.currentSearchQuery.get()
        var it: Iterator<DirPlacesReply.QueryData> = dirPlacesReply.QueryData_Fields.iterator()
        while (it.hasNext()) {
            var uuid: UUID = ((DirPlacesReply.QueryData) it.next()).QueryID
            if (Objects.equal(searchGridQuery.searchUUID(), uuid) && this.userManager != null && this.searchResultHandler != null) {
                var searchGridResultDao: SearchGridResultDao = this.userManager.getSearchManager().getSearchGridResultDao()
                for (queryReplies in dirPlacesReply.QueryReplies_Fields) {
                    if (!queryReplies.ParcelID.equals(UUIDPool.ZeroUUID)) {
                        var stringFromVariableOEM: String = SLMessage.stringFromVariableOEM(queryReplies.Name)
                        this.userManager.getSearchManager().getSearchRepository().insert(SearchGridResult(null, uuid, SearchGridQuery.SearchType.Places.ordinal(), queryReplies.ParcelID, stringFromVariableOEM, LevensteinDistance.computeLevensteinDistance(stringFromVariableOEM, searchGridQuery.searchText()), 0))
                    }
                }
                updateSearchResults(searchGridResultDao, searchGridQuery)
            }
        }
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getSearchManager().searchResults().detachRequestHandler(this.searchRequestHandler)
            this.userManager.parcelInfoData().getRequestSource().detachRequestHandler(this.parcelInfoRequestHandler)
        }
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun ParcelInfoReply(parcelInfoReply: ParcelInfoReply) {
        Debug.Printf("ParcelInfo: Got reply for %s", parcelInfoReply.Data_Field.ParcelID)
        if (this.parcelInfoResultHandler != null) {
            this.parcelInfoResultHandler.onResultData(parcelInfoReply.Data_Field.ParcelID, parcelInfoReply)
        }
    }
}
