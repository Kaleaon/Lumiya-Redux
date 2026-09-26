package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.collect.ImmutableList

open class SLObjectDisplayInfo {
    public var distance: Float
    public var hierarchyLevel: Int
    public var localID: Int

    public var name: String

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
