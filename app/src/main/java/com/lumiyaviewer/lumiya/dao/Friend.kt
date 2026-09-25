package com.lumiyaviewer.lumiya.dao

import java.util.UUID

class Friend @JvmOverloads constructor(
    var uuid: UUID? = null,
    var rightsGiven: Int = 0,
    var rightsHas: Int = 0,
    @JvmField var isOnline: Boolean = false
) {
    companion object {
        const val GRANT_ONLINE_STATUS = 1
        const val GRANT_MAP_LOCATION = 2
        const val GRANT_MODIFY_OBJECTS = 4
    }
}
