package com.lumiyaviewer.lumiya.slproto.objects;

import com.google.common.base.Optional;
import com.google.common.base.Strings;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class SLObjectProfileData {
    public static SLObjectProfileData create(@Nonnull SLObjectInfo objectInfo) {
        HoverText hoverText = objectInfo.getHoverText();
        return new AutoValue_SLObjectProfileData(objectInfo.getId(), objectInfo.nameKnown ? Optional.of(Strings.nullToEmpty(objectInfo.name)) : Optional.absent(), Optional.fromNullable(objectInfo.getDescription()), objectInfo.getOwnerUUID(), objectInfo.isTouchable(), objectInfo.getTouchName(), objectInfo.isPayable(), objectInfo.saleType, objectInfo.salePrice, (objectInfo.UpdateFlags & 8) != 0, objectInfo.isDead, Optional.fromNullable(hoverText != null ? Strings.emptyToNull(hoverText.text()) : null), objectInfo.getPayInfo(), (objectInfo.UpdateFlags & 4) != 0);
    }

    public abstract Optional<String> description();

    public abstract Optional<String> floatingText();

    public abstract boolean isCopyable();

    public abstract boolean isDead();

    public abstract boolean isModifiable();

    public abstract boolean isPayable();

    public abstract boolean isTouchable();

    public abstract Optional<String> name();

    @Nullable
    public abstract UUID objectUUID();

    @Nullable
    public abstract UUID ownerUUID();

    @Nullable
    public abstract PayInfo payInfo();

    public abstract int salePrice();

    public abstract byte saleType();

    @Nullable
    public abstract String touchName();
}
