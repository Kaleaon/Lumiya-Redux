package com.lumiyaviewer.lumiya.render.avatar;

import com.lumiyaviewer.lumiya.render.avatar.AnimationData;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import javax.annotation.Nonnull;

class AvatarRunningAnimation implements Comparable<AvatarRunningAnimation> {

    @Nonnull
    private final AnimationData.AnimationJointSet jointSet;

    @Nonnull
    private final AvatarRunningSequence sequence;

    AvatarRunningAnimation(@Nonnull AvatarRunningSequence avatarRunningSequence, @Nonnull AnimationData.AnimationJointSet animationJointSet) {
        this.sequence = avatarRunningSequence;
        this.jointSet = animationJointSet;
    }

    void animate(AvatarSkeleton avatarSkeleton, float[] floats, float[] floats2, LLQuaternion[] quaternions, LLVector3[] vector3s) {
        this.jointSet.animate(avatarSkeleton, this.sequence, floats, floats2, quaternions, vector3s);
    }

    @Override
    public int compareTo(@Nonnull AvatarRunningAnimation avatarRunningAnimation) {
        int priority = avatarRunningAnimation.jointSet.getPriority() - this.jointSet.getPriority();
        if (priority != 0) {
            return priority;
        }
        int i = avatarRunningAnimation.sequence.sequenceID - this.sequence.sequenceID;
        if (i != 0) {
            return i;
        }
        return 0;
    }
}
