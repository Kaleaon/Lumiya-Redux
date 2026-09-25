package com.lumiyaviewer.lumiya.dao

import java.util.Date
import java.util.UUID

class MoneyTransaction @JvmOverloads constructor(
    var id: Long? = null,
    var timestamp: Date? = null,
    var agentUUID: UUID? = null,
    var transactionAmount: Int = 0,
    var newBalance: Int = 0
)
