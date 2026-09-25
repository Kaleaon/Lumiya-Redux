package com.lumiyaviewer.lumiya.dao

import java.util.UUID

class GroupRoleMember @JvmOverloads constructor(
    var groupID: UUID? = null,
    var requestID: UUID? = null,
    var roleID: UUID? = null,
    var userID: UUID? = null
)
