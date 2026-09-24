package com.lumiyaviewer.lumiya.render.avatar;

import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import javax.annotation.Nonnull;

class AvatarAnimationList {

    @Nonnull
    private final ImmutableList<AvatarRunningAnimation> animations;

    @Nonnull
    private final ImmutableList<AvatarRunningSequence> sequences;

    AvatarAnimationList(Collection<AvatarAnimationState> collection) {
        ArrayList arrayList = new ArrayList(collection.size());
        ImmutableList.Builder<AvatarRunningSequence> builder = ImmutableList.builder();
        Iterator<AvatarAnimationState> it = collection.iterator();
        while (it.hasNext()) {
            it.next().getRunningAnimations(builder, arrayList);
        }
        Collections.sort(arrayList);
        this.sequences = builder.build();
        this.animations = ImmutableList.copyOf((Collection) arrayList);
    }

    void animate(AvatarSkeleton avatarSkeleton, float[] floats, float[] floats2, LLQuaternion[] quaternions, LLVector3[] vector3s) {
        Iterator<AvatarRunningAnimation> it = this.animations.iterator();
        while (it.hasNext()) {
            it.next().animate(avatarSkeleton, floats, floats2, quaternions, vector3s);
        }
        int length = floats.length;
        for (int i = 0; i < length; i++) {
            float f = 1.0f - floats[i];
            if (f > 0.01f && f < 1.0f) {
                float f2 = 1.0f / f;
                quaternions[i].x *= f2;
                quaternions[i].y *= f2;
                quaternions[i].z *= f2;
                LLQuaternion quaternion = quaternions[i];
                quaternion.w = f2 * quaternion.w;
            }
        }
    }

    boolean needAnimate(long j) {
        boolean z = false;
        Iterator<AvatarRunningSequence> it = this.sequences.iterator();
        while (true) {
            boolean z2 = z;
            if (!it.hasNext()) {
                return z2;
            }
            z = it.next().needAnimate(j) | z2;
        }
    }
}
