package com.lumiyaviewer.lumiya.slproto.modules.search

import java.util.UUID

class AutoValue_SearchGridQuery(
    private val searchUUID: UUID,
    private val searchText: String,
    private val searchType: SearchGridQuery.SearchType
) : SearchGridQuery() {
    override fun searchText(): String = searchText
    override fun searchType(): SearchType = searchType
    override fun searchUUID(): UUID = searchUUID

    override fun equals(other: Any?): Boolean =
        other === this ||
            (other is SearchGridQuery &&
                searchUUID == other.searchUUID() &&
                searchText == other.searchText() &&
                searchType == other.searchType())

    override fun hashCode(): Int {
        var result = searchUUID.hashCode()
        result = 31 * result + searchText.hashCode()
        result = 31 * result + searchType.hashCode()
        return result
    }

    override fun toString(): String =
        "SearchGridQuery{searchUUID=$searchUUID, searchText=$searchText, searchType=$searchType}"
}
