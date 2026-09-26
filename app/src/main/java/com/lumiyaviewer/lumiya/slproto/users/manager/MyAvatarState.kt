package com.lumiyaviewer.lumiya.slproto.users.manager

abstract class MyAvatarState {
    abstract fun hasHUDs(): Boolean
    abstract fun isFlying(): Boolean
    abstract fun isSitting(): Boolean
    abstract fun sittingOn(): Int

    companion object {
        @JvmStatic fun create(flying: Boolean, sittingOn: Int, sitting: Boolean, hasHUDs: Boolean): MyAvatarState =
            AutoValue_MyAvatarState(flying, sittingOn, sitting, hasHUDs)
    }
}
