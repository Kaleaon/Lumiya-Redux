package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo

open class SLPrimObjectDisplayInfoWithChildren : SLPrimObjectDisplayInfo(), SLObjectDisplayInfo.HasChildrenObjects {

    var children: ImmutableList<SLObjectDisplayInfo> = null
    private var implicitlyAdded: Boolean = false

    constructor(objectInfo: SLObjectInfo, f: Float, immutableList: ImmutableList<SLObjectDisplayInfo>, implicitlyAdded: Boolean) : super(objectInfo, f) {
        this.children = immutableList
        this.implicitlyAdded = implicitlyAdded
    }
    fun getChildren(): ImmutableList<SLObjectDisplayInfo> {
        return this.children
    }
    fun isImplicitlyAdded(): Boolean {
        return this.implicitlyAdded
    }
}
