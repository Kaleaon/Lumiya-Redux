package com.lumiyaviewer.lumiya.slproto.users.manager

class AutoValue_MyAvatarState : MyAvatarState() {
    private var hasHUDs: Boolean = false
    private var isFlying: Boolean = false
    private var isSitting: Boolean = false
    private var sittingOn: Int = 0

    constructor(isSitting: Boolean, sittingOn: Int, isFlying: Boolean, hasHUDs: Boolean) {
        this.isSitting = isSitting
        this.sittingOn = sittingOn
        this.isFlying = isFlying
        this.hasHUDs = hasHUDs
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is MyAvatarState)) {
        return false
        }
        var myAvatarState: MyAvatarState = obj as MyAvatarState
        if (this.isSitting == myAvatarState.isSitting() && this.sittingOn == myAvatarState.sittingOn() && this.isFlying == myAvatarState.isFlying()) {
            return this.hasHUDs == myAvatarState.hasHUDs()
        }
        return false
    }
    fun hasHUDs(): Boolean {
        return this.hasHUDs
    }

    fun hashCode(): Int {
        return (((if (this.isFlying) 1231 else 1237) ^ (((((if (this.isSitting) 1231 else 1237) ^ 1000003) * 1000003) ^ this.sittingOn) * 1000003)) * 1000003) ^ (if (this.hasHUDs) 1231 else 1237)
    }
    fun isFlying(): Boolean {
        return this.isFlying
    }
    fun isSitting(): Boolean {
        return this.isSitting
    }
    fun sittingOn(): Int {
        return this.sittingOn
    }

    fun toString(): String {
        return "MyAvatarState{isSitting=" + this.isSitting + ", sittingOn=" + this.sittingOn + ", isFlying=" + this.isFlying + ", hasHUDs=" + this.hasHUDs + "}"
    }
}
