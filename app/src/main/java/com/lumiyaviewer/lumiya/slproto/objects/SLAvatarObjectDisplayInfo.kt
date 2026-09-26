package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo
import java.util.UUID

open class SLAvatarObjectDisplayInfo : SLObjectDisplayInfo(), SLObjectDisplayInfo.HasChildrenObjects {

    var children: ImmutableList<SLObjectDisplayInfo> = null
    private var implicitlyAdded: Boolean = false

    var uuid: UUID = null

    constructor(str: String, objectInfo: SLObjectInfo, f: Float, immutableList: ImmutableList<SLObjectDisplayInfo>, implicitlyAdded: Boolean) : super(objectInfo.localID, str, f, objectInfo.hierLevel) {
        this.children = immutableList
        this.implicitlyAdded = implicitlyAdded
        this.uuid = objectInfo.getId()
    }
    fun getChildren(): ImmutableList<SLObjectDisplayInfo> {
        return this.children
    }
    fun isImplicitlyAdded(): Boolean {
        return this.implicitlyAdded
    }
}
