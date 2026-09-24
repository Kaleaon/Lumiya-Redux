package com.lumiyaviewer.lumiya.render.avatar;

import com.google.common.collect.ImmutableList;
import java.util.Collection;
import javax.annotation.Nonnull;

class AvatarRunningSequence extends AnimationTiming {

    @Nonnull
    private final AnimationData animationData;
    private final boolean dontEaseIn;
    private final ImmutableList<AvatarRunningAnimation> runningAnimations;
    private final long runningSince;
    final int sequenceID;
    private final long stoppingSince;

    AvatarRunningSequence(@Nonnull AnimationData animationData, int sequenceID, long runningSince, long stoppingSince, boolean dontEaseIn) {
        this.animationData = animationData;
        this.sequenceID = sequenceID;
        this.runningSince = runningSince;
        this.stoppingSince = stoppingSince;
        this.dontEaseIn = dontEaseIn;
        this.runningAnimations = animationData.createRunningAnimations(this);
    }

    public int getAnimationPriority() {
        return this.animationData.getPriority();
    }

    void getRunningAnimations(Collection<AvatarRunningAnimation> collection) {
        collection.addAll(this.runningAnimations);
    }

    boolean needAnimate(long j) {
        return this.animationData.updateAnimationTiming(j, this.runningSince, this.stoppingSince, this.dontEaseIn, this);
    }
}
