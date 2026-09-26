package com.lumiyaviewer.lumiya.slproto.assets

import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType

enum class SLWearableType {
    WT_SHAPE(0, SLAssetType.AT_BODYPART, true, "Shape"),
    WT_SKIN(1, SLAssetType.AT_BODYPART, true, "Skin"),
    WT_HAIR(2, SLAssetType.AT_BODYPART, false, "Hair"),
    WT_EYES(3, SLAssetType.AT_BODYPART, false, "Eyes"),
    WT_SHIRT(4, SLAssetType.AT_CLOTHING, false, "Shirt"),
    WT_PANTS(5, SLAssetType.AT_CLOTHING, false, "Pants"),
    WT_SHOES(6, SLAssetType.AT_CLOTHING, false, "Shoes"),
    WT_SOCKS(7, SLAssetType.AT_CLOTHING, false, "Socks"),
    WT_JACKET(8, SLAssetType.AT_CLOTHING, false, "Jacket"),
    WT_GLOVES(9, SLAssetType.AT_CLOTHING, false, "Gloves"),
    WT_UNDERSHIRT(10, SLAssetType.AT_CLOTHING, false, "Undershirt"),
    WT_UNDERPANTS(11, SLAssetType.AT_CLOTHING, false, "Underpants"),
    WT_SKIRT(12, SLAssetType.AT_CLOTHING, false, "Skirt"),
    WT_ALPHA(13, SLAssetType.AT_CLOTHING, false, "Alpha"),
    WT_TATTOO(14, SLAssetType.AT_CLOTHING, false, "Tattoo"),
    WT_PHYSICS(15, SLAssetType.AT_CLOTHING, false, "Physics")

    private var assetType: SLAssetType = null
    private var isCritical: Boolean = false
    private var name: String = ""
    private var typeCode: Int = 0

    constructor(typeCode: Int, assetType: SLAssetType, isCritical: Boolean, name: String) {
        this.typeCode = typeCode
        this.assetType = assetType
        this.isCritical = isCritical
        this.name = name
    }

    fun getByCode(i: Int): SLWearableType {
        for (wearableType in valuesCustom()) {
            if (wearableType.typeCode == i) {
        return wearableType
            }
        }
        return null
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    fun valuesCustom(): Array<SLWearableType> {
        return values()
    }

    fun getAssetType(): SLAssetType {
        return this.assetType
    }

    fun getIsCritical(): Boolean {
        return this.isCritical
    }

    fun getName(): String {
        return this.name
    }

    fun getTypeCode(): Int {
        return this.typeCode
    }

    fun isBodyPart(): Boolean {
        return this.assetType == SLAssetType.AT_BODYPART
    }
}
