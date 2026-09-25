package com.lumiyaviewer.lumiya.dao

import java.util.UUID

class GroupMember @JvmOverloads constructor(
    var groupID: UUID? = null,
    var requestID: UUID? = null,
    var userID: UUID? = null,
    var contribution: Int = 0,
    var onlineStatus: String? = null,
    var agentPowers: Long = 0,
    var title: String? = null,
    var isOwner: Boolean = false
)
