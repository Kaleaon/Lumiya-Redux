package com.lumiyaviewer.lumiya.slproto.inventory

import androidx.core.os.EnvironmentCompat

enum class SLSaleType {
    FS_NOT(0, "not"),
    FS_ORIGINAL(1, "orig"),
    FS_COPY(2, "copy"),
    FS_CONTENTS(3, "cntn"),
    FS_UNKNOWN(-1, EnvironmentCompat.MEDIA_UNKNOWN)

    private var stringCode: String = ""
    private var typeCode: Int = 0

    constructor(typeCode: Int, stringCode: String) {
        this.typeCode = typeCode
        this.stringCode = stringCode
    }

    fun getByString(str: String): SLSaleType {
        for (saleType in valuesCustom()) {
            if (saleType.stringCode.equalsIgnoreCase(str)) {
        return saleType
            }
        }
        return FS_UNKNOWN
    }

    fun getByType(i: Int): SLSaleType {
        for (saleType in valuesCustom()) {
            if (saleType.typeCode == i) {
        return saleType
            }
        }
        return FS_UNKNOWN
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    fun valuesCustom(): Array<SLSaleType> {
        return values()
    }

    fun getStringCode(): String {
        return this.stringCode
    }

    fun getTypeCode(): Int {
        return this.typeCode
    }
}
