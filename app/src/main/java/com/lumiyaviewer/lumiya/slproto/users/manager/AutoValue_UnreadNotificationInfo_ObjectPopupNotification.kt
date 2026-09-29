package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Optional
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo

class AutoValue_UnreadNotificationInfo_ObjectPopupNotification : UnreadNotificationInfo.ObjectPopupNotification() {
    private var freshObjectPopupsCount: Int = 0
    private var lastObjectPopup: Optional<UnreadNotificationInfo.ObjectPopupMessage>? = null
    private var objectPopupsCount: Int = 0

    constructor(freshObjectPopupsCount: Int, objectPopupsCount: Int, optional: Optional<UnreadNotificationInfo.ObjectPopupMessage>) {
        this.freshObjectPopupsCount = freshObjectPopupsCount
        this.objectPopupsCount = objectPopupsCount
        if (optional == null) {
            throw NullPointerException("Null lastObjectPopup")
        }
        this.lastObjectPopup = optional
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is UnreadNotificationInfo.ObjectPopupNotification)) {
        return false
        }
        var objectPopupNotification: UnreadNotificationInfo.ObjectPopupNotification = (UnreadNotificationInfo.ObjectPopupNotification) obj
        if (this.freshObjectPopupsCount == objectPopupNotification.freshObjectPopupsCount() && this.objectPopupsCount == objectPopupNotification.objectPopupsCount()) {
            return this.lastObjectPopup.equals(objectPopupNotification.lastObjectPopup())
        }
        return false
    }
    fun freshObjectPopupsCount(): Int {
        return this.freshObjectPopupsCount
    }

    fun hashCode(): Int {
        return ((((this.freshObjectPopupsCount ^ 1000003) * 1000003) ^ this.objectPopupsCount) * 1000003) ^ this.lastObjectPopup.hashCode()
    }
    fun lastObjectPopup(): Optional<UnreadNotificationInfo.ObjectPopupMessage> {
        return this.lastObjectPopup
    }
    fun objectPopupsCount(): Int {
        return this.objectPopupsCount
    }

    fun toString(): String {
        return "ObjectPopupNotification{freshObjectPopupsCount=" + this.freshObjectPopupsCount + ", objectPopupsCount=" + this.objectPopupsCount + ", lastObjectPopup=" + this.lastObjectPopup + "}"
    }
}
