package com.lumiyaviewer.lumiya.licensing

import android.content.Context
import android.os.Handler
import com.lumiyaviewer.lumiya.R

open class LicenseChecker(@Suppress("UNUSED_PARAMETER") context: Context, handler: Handler, payload: Any) {
    init { handler.obtainMessage(R.id.msg_licensing_allow, payload).sendToTarget() }
    companion object {
        const val APP_STORE_NAME = "Google Play"
        const val APP_STORE_URL = "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya"
        const val CLOUD_PLUGIN_URL = "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.cloud"
        const val MSG_LICENSING_ALLOW = R.id.msg_licensing_allow
        const val MSG_LICENSING_APP_ERROR = R.id.msg_licensing_app_error
        const val MSG_LICENSING_DONT_ALLOW = R.id.msg_licensing_dont_allow
        const val VOICE_PLUGIN_URL = "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.voice"
    }
}
