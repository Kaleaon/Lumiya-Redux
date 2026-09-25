package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import androidx.core.app.NotificationCompat

class LogSyncStatus : Bundleable {
    @JvmField val pluginVersionCode: Int
    @JvmField val status: Status
    @JvmField val errorMessage: String?

    enum class Status {
        Ready,
        AppVersionRejected,
        GoogleDriveError
    }

    constructor(pluginVersionCode: Int, status: Status, errorMessage: String?) {
        this.pluginVersionCode = pluginVersionCode
        this.status = status
        this.errorMessage = errorMessage
    }

    constructor(bundle: Bundle) {
        this.pluginVersionCode = bundle.getInt("pluginVersionCode")
        this.status = Status.valueOf(bundle.getString(NotificationCompat.CATEGORY_STATUS)!!)
        this.errorMessage = bundle.getString("errorMessage")
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putInt("pluginVersionCode", pluginVersionCode)
        putString(NotificationCompat.CATEGORY_STATUS, status.toString())
        putString("errorMessage", errorMessage)
    }
}
