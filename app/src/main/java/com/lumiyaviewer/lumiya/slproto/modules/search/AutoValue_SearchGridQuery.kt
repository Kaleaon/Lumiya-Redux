package com.lumiyaviewer.lumiya.slproto.modules.search

import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import java.util.UUID

class AutoValue_SearchGridQuery : SearchGridQuery() {
    private var searchText: String = ""
    private var searchType: SearchGridQuery.SearchType = null
    private var searchUUID: UUID = null

    constructor(uuid: UUID, searchText: String, searchType: SearchGridQuery.SearchType) {
        if (uuid == null) {
            throw NullPointerException("Null searchUUID")
        }
        this.searchUUID = uuid
        if (searchText == null) {
            throw NullPointerException("Null searchText")
        }
        this.searchText = searchText
        if (searchType == null) {
            throw NullPointerException("Null searchType")
        }
        this.searchType = searchType
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is SearchGridQuery)) {
        return false
        }
        var searchGridQuery: SearchGridQuery = obj as SearchGridQuery
        if (this.searchUUID.equals(searchGridQuery.searchUUID()) && this.searchText.equals(searchGridQuery.searchText())) {
            return this.searchType.equals(searchGridQuery.searchType())
        }
        return false
    }

    fun hashCode(): Int {
        return ((((this.searchUUID.hashCode() ^ 1000003) * 1000003) ^ this.searchText.hashCode()) * 1000003) ^ this.searchType.hashCode()
    }
    fun searchText(): String {
        return this.searchText
    }
    fun searchType(): SearchGridQuery.SearchType {
        return this.searchType
    }
    fun searchUUID(): UUID {
        return this.searchUUID
    }

    fun toString(): String {
        return "SearchGridQuery{searchUUID=" + this.searchUUID + ", searchText=" + this.searchText + ", searchType=" + this.searchType + "}"
    }
}
