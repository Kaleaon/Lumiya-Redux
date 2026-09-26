package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo

class AutoValue_UnreadNotificationInfo_ObjectPopupMessage : UnreadNotificationInfo.ObjectPopupMessage() {
    private var message: String = ""
    private var objectName: String = ""

    constructor(objectName: String, message: String) {
        if (objectName == null) {
            throw NullPointerException("Null objectName")
        }
        this.objectName = objectName
        if (message == null) {
            throw NullPointerException("Null message")
        }
        this.message = message
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is UnreadNotificationInfo.ObjectPopupMessage)) {
        return false
        }
        var objectPopupMessage: UnreadNotificationInfo.ObjectPopupMessage = (UnreadNotificationInfo.ObjectPopupMessage) obj
        if (this.objectName.equals(objectPopupMessage.objectName())) {
            return this.message.equals(objectPopupMessage.message())
        }
        return false
    }

    fun hashCode(): Int {
        return ((this.objectName.hashCode() ^ 1000003) * 1000003) ^ this.message.hashCode()
    }
    fun message(): String {
        return this.message
    }
    fun objectName(): String {
        return this.objectName
    }

    fun toString(): String {
        return "ObjectPopupMessage{objectName=" + this.objectName + ", message=" + this.message + "}"
    }
}
