package com.lumiyaviewer.lumiya.dao

import com.google.common.base.Objects
import com.google.common.base.Strings
import java.util.UUID

class UserName @JvmOverloads constructor(
    var uuid: UUID? = null,
    var userName: String? = null,
    var displayName: String? = null,
    var isBadUUID: Boolean = false
) {
    fun isComplete(): Boolean {
        if (isBadUUID) return true
        if (Strings.isNullOrEmpty(userName)) return false
        return !Strings.isNullOrEmpty(displayName)
    }

    fun mergeWith(other: UserName): Boolean {
        if (other.isBadUUID && !isBadUUID) {
            isBadUUID = true
            return true
        }
        if (isBadUUID) return false
        var changed = false
        if (!Strings.isNullOrEmpty(other.userName) && !Objects.equal(userName, other.userName)) {
            userName = other.userName
            changed = true
        }
        if (!Strings.isNullOrEmpty(other.displayName) && !Objects.equal(displayName, other.displayName)) {
            displayName = other.displayName
            changed = true
        }
        return changed
    }
}
