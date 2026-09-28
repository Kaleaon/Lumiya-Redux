package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.content.res.TypedArray
import androidx.preference.Preference
import android.util.AttributeSet
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels

open class PreferenceSubPage : Preference {
    private var notificationType: NotificationType? = null
    private var pageNotificationDetails: Boolean = false
    private var pageResource: Int = 0

    constructor(context: Context) : super(context) {
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
    }

    constructor(context: Context, attributeSet: AttributeSet) : super(context, attributeSet) {
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
        applyAttributes(context, attributeSet, 0, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) : super(context, attributeSet, i) {
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
        applyAttributes(context, attributeSet, i, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) : super(context, attributeSet, i, i2) {
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
        applyAttributes(context, attributeSet, i, i2)
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        val obtainStyledAttributes: TypedArray = context.theme.obtainStyledAttributes(attributeSet, R.styleable.PreferenceSubPage, i, i2)
        try {
            this.pageResource = obtainStyledAttributes.getResourceId(0, this.pageResource)
            this.pageNotificationDetails = obtainStyledAttributes.getBoolean(1, this.pageNotificationDetails)
            val string = obtainStyledAttributes.getString(2)
            if (string != null) {
                try {
                    this.notificationType = NotificationType.valueOf(string)
                } catch (e: Exception) {
                    this.notificationType = null
                }
            }
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    fun getNotificationType(): NotificationType? {
        if (this.pageNotificationDetails) {
            return this.notificationType
        }
        return null
    }

    fun getPageResource(): Int {
        return this.pageResource
    }

    override fun getSummary(): CharSequence? {
        if (!this.pageNotificationDetails || this.notificationType == null) {
            return super.getSummary()
        }
        val notificationChannels = NotificationChannels.getInstance()
        if (notificationChannels.areNotificationsSystemControlled()) {
            val channel = notificationChannels.getChannelByType(this.notificationType!!)
            val notificationSummary = if (channel != null) notificationChannels.getNotificationSummary(context, channel) else null
            return notificationSummary ?: super.getSummary()
        }
        val notificationSettings = NotificationSettings(this.notificationType!!)
        notificationSettings.Load(sharedPreferences)
        return notificationSettings.getSummary(context)
    }
}
