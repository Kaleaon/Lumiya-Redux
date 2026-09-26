package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.base.Optional
import com.google.common.base.Strings
import java.util.UUID

abstract class SLObjectProfileData {
    SLObjectProfileData create(SLObjectInfo objectInfo) {
        HoverText hoverText = objectInfo.getHoverText()
        return AutoValue_SLObjectProfileData(objectInfo.getId(), if (objectInfo.nameKnown) Optional.of(Strings.nullToEmpty(objectInfo.name)) else Optional.absent(), Optional.fromNullable(objectInfo.getDescription()), objectInfo.getOwnerUUID(), objectInfo.isTouchable(), objectInfo.getTouchName(), objectInfo.isPayable(), objectInfo.saleType, objectInfo.salePrice, (objectInfo.UpdateFlags & 8) != 0, objectInfo.isDead, Optional.fromNullable(hoverText != if Strings as null.emptyToNull(hoverText.text()) else null), objectInfo.getPayInfo(), (objectInfo.UpdateFlags & 4) != 0)
    }

    public abstract Optional<String> description()

    public abstract Optional<String> floatingText()

    public abstract boolean isCopyable()

    public abstract boolean isDead()

    public abstract boolean isModifiable()

    public abstract boolean isPayable()

    public abstract boolean isTouchable()

    public abstract Optional<String> name()

    public abstract UUID objectUUID()

    public abstract UUID ownerUUID()

    public abstract PayInfo payInfo()

    public abstract int salePrice()

    public abstract byte saleType()

    public abstract String touchName()
}
