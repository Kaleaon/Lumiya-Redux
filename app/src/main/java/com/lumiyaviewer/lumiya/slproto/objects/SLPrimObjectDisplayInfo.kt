package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.base.Strings

open class SLPrimObjectDisplayInfo(objectInfo: SLObjectInfo, distance: Float) :
    SLObjectDisplayInfo(objectInfo.localID, if (objectInfo.nameKnown) Strings.nullToEmpty(objectInfo.name) else null, distance, objectInfo.hierLevel) {
    @JvmField val localID: Int = objectInfo.localID
    @JvmField val touchable: Boolean = objectInfo.isTouchable
    @JvmField val payable: Boolean = objectInfo.isPayable || objectInfo.saleType.toInt() != 0
}
