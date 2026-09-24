package com.lumiyaviewer.lumiya.slproto.users.manager;

final class AutoValue_MyAvatarState extends MyAvatarState {
    private final boolean hasHUDs;
    private final boolean isFlying;
    private final boolean isSitting;
    private final int sittingOn;

    AutoValue_MyAvatarState(boolean isSitting, int sittingOn, boolean isFlying, boolean hasHUDs) {
        this.isSitting = isSitting;
        this.sittingOn = sittingOn;
        this.isFlying = isFlying;
        this.hasHUDs = hasHUDs;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof MyAvatarState)) {
            return false;
        }
        MyAvatarState myAvatarState = (MyAvatarState) obj;
        if (this.isSitting == myAvatarState.isSitting() && this.sittingOn == myAvatarState.sittingOn() && this.isFlying == myAvatarState.isFlying()) {
            return this.hasHUDs == myAvatarState.hasHUDs();
        }
        return false;
    }

    @Override
    public boolean hasHUDs() {
        return this.hasHUDs;
    }

    public int hashCode() {
        return (((this.isFlying ? 1231 : 1237) ^ (((((this.isSitting ? 1231 : 1237) ^ 1000003) * 1000003) ^ this.sittingOn) * 1000003)) * 1000003) ^ (this.hasHUDs ? 1231 : 1237);
    }

    @Override
    public boolean isFlying() {
        return this.isFlying;
    }

    @Override
    public boolean isSitting() {
        return this.isSitting;
    }

    @Override
    public int sittingOn() {
        return this.sittingOn;
    }

    public String toString() {
        return "MyAvatarState{isSitting=" + this.isSitting + ", sittingOn=" + this.sittingOn + ", isFlying=" + this.isFlying + ", hasHUDs=" + this.hasHUDs + "}";
    }
}
