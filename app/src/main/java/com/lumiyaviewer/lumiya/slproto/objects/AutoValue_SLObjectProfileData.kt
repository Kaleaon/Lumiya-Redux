package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.base.Optional
import java.util.UUID

class AutoValue_SLObjectProfileData : SLObjectProfileData() {
    private var description: Optional<String>? = null
    private var floatingText: Optional<String>? = null
    private var isCopyable: Boolean = false
    private var isDead: Boolean = false
    private var isModifiable: Boolean = false
    private var isPayable: Boolean = false
    private var isTouchable: Boolean = false
    private var name: Optional<String>? = null
    private var objectUUID: UUID? = null
    private var ownerUUID: UUID? = null
    private var payInfo: PayInfo? = null
    private var salePrice: Int = 0
    private var saleType: Byte = 0
    private var touchName: String = ""

    constructor(uuid: UUID, optional: Optional<String>, description: Optional<String>, ownerUUID: UUID, isTouchable: Boolean, touchName: String, isPayable: Boolean, saleType: Byte, salePrice: Int, isCopyable: Boolean, isDead: Boolean, floatingText: Optional<String>, payInfo: PayInfo, isModifiable: Boolean) {
        this.objectUUID = uuid
        if (optional == null) {
            throw NullPointerException("Null name")
        }
        this.name = optional
        if (description == null) {
            throw NullPointerException("Null description")
        }
        this.description = description
        this.ownerUUID = ownerUUID
        this.isTouchable = isTouchable
        this.touchName = touchName
        this.isPayable = isPayable
        this.saleType = saleType
        this.salePrice = salePrice
        this.isCopyable = isCopyable
        this.isDead = isDead
        if (floatingText == null) {
            throw NullPointerException("Null floatingText")
        }
        this.floatingText = floatingText
        this.payInfo = payInfo
        this.isModifiable = isModifiable
    }
    fun description(): Optional<String> {
        return this.description
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is SLObjectProfileData)) {
        return false
        }
        var objectProfileData: SLObjectProfileData = obj as SLObjectProfileData
        if (if (this.objectUUID != null) this.objectUUID.equals(objectProfileData.objectUUID()) else objectProfileData.objectUUID() == null) {
            if (this.name.equals(objectProfileData.name()) && this.description.equals(objectProfileData.description()) && (if (this.ownerUUID != null) this.ownerUUID.equals(objectProfileData.ownerUUID()) else objectProfileData.ownerUUID() == null) && this.isTouchable == objectProfileData.isTouchable() && (if (this.touchName != null) this.touchName.equals(objectProfileData.touchName()) else objectProfileData.touchName() == null) && this.isPayable == objectProfileData.isPayable() && this.saleType == objectProfileData.saleType() && this.salePrice == objectProfileData.salePrice() && this.isCopyable == objectProfileData.isCopyable() && this.isDead == objectProfileData.isDead() && this.floatingText.equals(objectProfileData.floatingText()) && (if (this.payInfo != null) this.payInfo.equals(objectProfileData.payInfo()) else objectProfileData.payInfo() == null)) {
                return this.isModifiable == objectProfileData.isModifiable()
            }
        }
        return false
    }
    fun floatingText(): Optional<String> {
        return this.floatingText
    }

    fun hashCode(): Int {
        return (((((((if (this.isDead) 1231 else 1237) ^ (((if (this.isCopyable) 1231 else 1237) ^ (((((((if (this.isPayable) 1231 else 1237) ^ (((if (this.touchName == null) 0 else this.touchName.hashCode()) ^ (((if (this.isTouchable) 1231 else 1237) ^ (((if (this.ownerUUID == null) 0 else this.ownerUUID.hashCode()) ^ (((((((if (this.objectUUID == null) 0 else this.objectUUID.hashCode()) ^ 1000003) * 1000003) ^ this.name.hashCode()) * 1000003) ^ this.description.hashCode()) * 1000003)) * 1000003)) * 1000003)) * 1000003)) * 1000003) ^ this.saleType) * 1000003) ^ this.salePrice) * 1000003)) * 1000003)) * 1000003) ^ this.floatingText.hashCode()) * 1000003) ^ (if (this.payInfo != null) this.payInfo.hashCode() else 0)) * 1000003) ^ (if (this.isModifiable) 1231 else 1237)
    }
    fun isCopyable(): Boolean {
        return this.isCopyable
    }
    fun isDead(): Boolean {
        return this.isDead
    }
    fun isModifiable(): Boolean {
        return this.isModifiable
    }
    fun isPayable(): Boolean {
        return this.isPayable
    }
    fun isTouchable(): Boolean {
        return this.isTouchable
    }
    fun name(): Optional<String> {
        return this.name
    }
    fun objectUUID(): UUID {
        return this.objectUUID
    }
    fun ownerUUID(): UUID {
        return this.ownerUUID
    }
    fun payInfo(): PayInfo {
        return this.payInfo
    }
    fun salePrice(): Int {
        return this.salePrice
    }
    fun saleType(): Byte {
        return this.saleType
    }

    fun toString(): String {
        return "SLObjectProfileData{objectUUID=" + this.objectUUID + ", name=" + this.name + ", description=" + this.description + ", ownerUUID=" + this.ownerUUID + ", isTouchable=" + this.isTouchable + ", touchName=" + this.touchName + ", isPayable=" + this.isPayable + ", saleType=" + (this as int.saleType) + ", salePrice=" + this.salePrice + ", isCopyable=" + this.isCopyable + ", isDead=" + this.isDead + ", floatingText=" + this.floatingText + ", payInfo=" + this.payInfo + ", isModifiable=" + this.isModifiable + "}"
    }
    fun touchName(): String {
        return this.touchName
    }
}
