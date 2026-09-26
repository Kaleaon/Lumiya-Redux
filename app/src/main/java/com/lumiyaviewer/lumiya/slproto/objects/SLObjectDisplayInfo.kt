package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.collect.ImmutableList

open class SLObjectDisplayInfo {
    public float distance
    public int hierarchyLevel
    public int localID

    public String name

    interface HasChildrenObjects {
        ImmutableList<SLObjectDisplayInfo> getChildren()

        boolean isImplicitlyAdded()
    }

    public SLObjectDisplayInfo(int localID, String name, float distance, int hierarchyLevel) {
        this.localID = localID
        this.name = name
        this.distance = distance
        this.hierarchyLevel = hierarchyLevel
    }
}
