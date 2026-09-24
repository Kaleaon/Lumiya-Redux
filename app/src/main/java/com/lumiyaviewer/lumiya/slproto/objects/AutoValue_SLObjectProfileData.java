package com.lumiyaviewer.lumiya.slproto.objects;

import com.google.common.base.Optional;
import java.util.UUID;
import javax.annotation.Nullable;

final class AutoValue_SLObjectProfileData extends SLObjectProfileData {
    private final Optional<String> description;
    private final Optional<String> floatingText;
    private final boolean isCopyable;
    private final boolean isDead;
    private final boolean isModifiable;
    private final boolean isPayable;
    private final boolean isTouchable;
    private final Optional<String> name;
    private final UUID objectUUID;
    private final UUID ownerUUID;
    private final PayInfo payInfo;
    private final int salePrice;
    private final byte saleType;
    private final String touchName;

    AutoValue_SLObjectProfileData(@Nullable UUID uuid, Optional<String> optional, Optional<String> description, @Nullable UUID ownerUUID, boolean isTouchable, @Nullable String touchName, boolean isPayable, byte saleType, int salePrice, boolean isCopyable, boolean isDead, Optional<String> floatingText, @Nullable PayInfo payInfo, boolean isModifiable) {
        this.objectUUID = uuid;
        if (optional == null) {
            throw new NullPointerException("Null name");
        }
        this.name = optional;
        if (description == null) {
            throw new NullPointerException("Null description");
        }
        this.description = description;
        this.ownerUUID = ownerUUID;
        this.isTouchable = isTouchable;
        this.touchName = touchName;
        this.isPayable = isPayable;
        this.saleType = saleType;
        this.salePrice = salePrice;
        this.isCopyable = isCopyable;
        this.isDead = isDead;
        if (floatingText == null) {
            throw new NullPointerException("Null floatingText");
        }
        this.floatingText = floatingText;
        this.payInfo = payInfo;
        this.isModifiable = isModifiable;
    }

    @Override
    public Optional<String> description() {
        return this.description;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof SLObjectProfileData)) {
            return false;
        }
        SLObjectProfileData objectProfileData = (SLObjectProfileData) obj;
        if (this.objectUUID != null ? this.objectUUID.equals(objectProfileData.objectUUID()) : objectProfileData.objectUUID() == null) {
            if (this.name.equals(objectProfileData.name()) && this.description.equals(objectProfileData.description()) && (this.ownerUUID != null ? this.ownerUUID.equals(objectProfileData.ownerUUID()) : objectProfileData.ownerUUID() == null) && this.isTouchable == objectProfileData.isTouchable() && (this.touchName != null ? this.touchName.equals(objectProfileData.touchName()) : objectProfileData.touchName() == null) && this.isPayable == objectProfileData.isPayable() && this.saleType == objectProfileData.saleType() && this.salePrice == objectProfileData.salePrice() && this.isCopyable == objectProfileData.isCopyable() && this.isDead == objectProfileData.isDead() && this.floatingText.equals(objectProfileData.floatingText()) && (this.payInfo != null ? this.payInfo.equals(objectProfileData.payInfo()) : objectProfileData.payInfo() == null)) {
                return this.isModifiable == objectProfileData.isModifiable();
            }
        }
        return false;
    }

    @Override
    public Optional<String> floatingText() {
        return this.floatingText;
    }

    public int hashCode() {
        return (((((((this.isDead ? 1231 : 1237) ^ (((this.isCopyable ? 1231 : 1237) ^ (((((((this.isPayable ? 1231 : 1237) ^ (((this.touchName == null ? 0 : this.touchName.hashCode()) ^ (((this.isTouchable ? 1231 : 1237) ^ (((this.ownerUUID == null ? 0 : this.ownerUUID.hashCode()) ^ (((((((this.objectUUID == null ? 0 : this.objectUUID.hashCode()) ^ 1000003) * 1000003) ^ this.name.hashCode()) * 1000003) ^ this.description.hashCode()) * 1000003)) * 1000003)) * 1000003)) * 1000003)) * 1000003) ^ this.saleType) * 1000003) ^ this.salePrice) * 1000003)) * 1000003)) * 1000003) ^ this.floatingText.hashCode()) * 1000003) ^ (this.payInfo != null ? this.payInfo.hashCode() : 0)) * 1000003) ^ (this.isModifiable ? 1231 : 1237);
    }

    @Override
    public boolean isCopyable() {
        return this.isCopyable;
    }

    @Override
    public boolean isDead() {
        return this.isDead;
    }

    @Override
    public boolean isModifiable() {
        return this.isModifiable;
    }

    @Override
    public boolean isPayable() {
        return this.isPayable;
    }

    @Override
    public boolean isTouchable() {
        return this.isTouchable;
    }

    @Override
    public Optional<String> name() {
        return this.name;
    }

    @Override
    @Nullable
    public UUID objectUUID() {
        return this.objectUUID;
    }

    @Override
    @Nullable
    public UUID ownerUUID() {
        return this.ownerUUID;
    }

    @Override
    @Nullable
    public PayInfo payInfo() {
        return this.payInfo;
    }

    @Override
    public int salePrice() {
        return this.salePrice;
    }

    @Override
    public byte saleType() {
        return this.saleType;
    }

    public String toString() {
        return "SLObjectProfileData{objectUUID=" + this.objectUUID + ", name=" + this.name + ", description=" + this.description + ", ownerUUID=" + this.ownerUUID + ", isTouchable=" + this.isTouchable + ", touchName=" + this.touchName + ", isPayable=" + this.isPayable + ", saleType=" + ((int) this.saleType) + ", salePrice=" + this.salePrice + ", isCopyable=" + this.isCopyable + ", isDead=" + this.isDead + ", floatingText=" + this.floatingText + ", payInfo=" + this.payInfo + ", isModifiable=" + this.isModifiable + "}";
    }

    @Override
    @Nullable
    public String touchName() {
        return this.touchName;
    }
}
