package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.content.res.TypedArray
import androidx.preference.Preference
import android.util.AttributeSet
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels

open class PreferenceSubPage : Preference() {
    private NotificationType notificationType
    private boolean pageNotificationDetails
    private int pageResource

    constructor(context: Context) {
        super(context)
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
        applyAttributes(context, attributeSet, 0, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
        applyAttributes(context, attributeSet, i, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        super(context, attributeSet, i, i2)
        this.pageResource = 0
        this.pageNotificationDetails = false
        this.notificationType = null
        applyAttributes(context, attributeSet, i, i2)
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        TypedArray obtainStyledAttributes = context.getTheme().obtainStyledAttributes(attributeSet, R.styleable.PreferenceSubPage, i, i2)
        try {
            this.pageResource = obtainStyledAttributes.getResourceId(0, this.pageResource)
            this.pageNotificationDetails = obtainStyledAttributes.getBoolean(1, this.pageNotificationDetails)
            String string = obtainStyledAttributes.getString(2)
            internal fun if(null: string !=):  {
                try {
                    this.notificationType = NotificationType.valueOf(string)
                } catch (Exception e) {
                    this.notificationType = null
                }
            }
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    internal fun getNotificationType(): NotificationType {
        internal fun if(this.pageNotificationDetails):  {
            return this.notificationType
        }
        return null
    }

    internal fun getPageResource(): Int {
        return this.pageResource
    }

    override fun getSummary(): CharSequence {
        internal fun if(null: !this.pageNotificationDetails || this.notificationType ==):  {
            return super.getSummary()
        }
        NotificationChannels notificationChannels = NotificationChannels.getInstance()
        if (notificationChannels.areNotificationsSystemControlled()) {
            String notificationSummary = notificationChannels.getNotificationSummary(getContext(), notificationChannels.getChannelByType(this.notificationType))
            return notificationSummary != null ? notificationSummary : super.getSummary()
        }
        NotificationSettings notificationSettings = NotificationSettings(this.notificationType)
        notificationSettings.Load(getSharedPreferences())
        return notificationSettings.getSummary(getContext())
    }
}
