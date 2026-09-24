package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo;

final class AutoValue_UnreadNotificationInfo_ObjectPopupMessage extends UnreadNotificationInfo.ObjectPopupMessage {
    private final String message;
    private final String objectName;

    AutoValue_UnreadNotificationInfo_ObjectPopupMessage(String objectName, String message) {
        if (objectName == null) {
            throw new NullPointerException("Null objectName");
        }
        this.objectName = objectName;
        if (message == null) {
            throw new NullPointerException("Null message");
        }
        this.message = message;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof UnreadNotificationInfo.ObjectPopupMessage)) {
            return false;
        }
        UnreadNotificationInfo.ObjectPopupMessage objectPopupMessage = (UnreadNotificationInfo.ObjectPopupMessage) obj;
        if (this.objectName.equals(objectPopupMessage.objectName())) {
            return this.message.equals(objectPopupMessage.message());
        }
        return false;
    }

    public int hashCode() {
        return ((this.objectName.hashCode() ^ 1000003) * 1000003) ^ this.message.hashCode();
    }

    @Override
    public String message() {
        return this.message;
    }

    @Override
    public String objectName() {
        return this.objectName;
    }

    public String toString() {
        return "ObjectPopupMessage{objectName=" + this.objectName + ", message=" + this.message + "}";
    }
}
