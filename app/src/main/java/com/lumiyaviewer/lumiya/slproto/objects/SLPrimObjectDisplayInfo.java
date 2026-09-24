package com.lumiyaviewer.lumiya.slproto.objects;

import com.google.common.base.Strings;

public class SLPrimObjectDisplayInfo extends SLObjectDisplayInfo {
    public final int localID;
    public final boolean payable;
    public final boolean touchable;

    public SLPrimObjectDisplayInfo(SLObjectInfo objectInfo, float f) {
        super(objectInfo.localID, objectInfo.nameKnown ? Strings.nullToEmpty(objectInfo.name) : null, f, objectInfo.hierLevel);
        this.localID = objectInfo.localID;
        this.touchable = objectInfo.isTouchable();
        this.payable = objectInfo.isPayable() || objectInfo.saleType != 0;
    }
}
