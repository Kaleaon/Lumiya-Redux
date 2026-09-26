package com.lumiyaviewer.lumiya.slproto.modules.search

import java.util.UUID

abstract class SearchGridQuery {

    enum class SearchType {
        People,
        Groups,
        Places

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static SearchType[] valuesCustom() {
            return values()
        }
    }

    public static SearchGridQuery create(UUID uuid, String str, SearchType searchType) {
        return AutoValue_SearchGridQuery(uuid, str, searchType)
    }

    public abstract String searchText()

    public abstract SearchType searchType()

    public abstract UUID searchUUID()
}
