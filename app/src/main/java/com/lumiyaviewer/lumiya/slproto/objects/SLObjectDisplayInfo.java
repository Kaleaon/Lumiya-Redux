package com.lumiyaviewer.lumiya.slproto.objects;

import com.google.common.collect.ImmutableList;
import javax.annotation.Nullable;

public class SLObjectDisplayInfo {
    public final float distance;
    public final int hierarchyLevel;
    public final int localID;

    @Nullable
    public final String name;

    public interface HasChildrenObjects {
        ImmutableList<SLObjectDisplayInfo> getChildren();

        boolean isImplicitlyAdded();
    }

    public SLObjectDisplayInfo(int localID, @Nullable String name, float distance, int hierarchyLevel) {
        this.localID = localID;
        this.name = name;
        this.distance = distance;
        this.hierarchyLevel = hierarchyLevel;
    }
}
