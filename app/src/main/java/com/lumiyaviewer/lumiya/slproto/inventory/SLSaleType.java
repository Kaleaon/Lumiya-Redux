package com.lumiyaviewer.lumiya.slproto.inventory;

import androidx.core.os.EnvironmentCompat;

public enum SLSaleType {
    FS_NOT(0, "not"),
    FS_ORIGINAL(1, "orig"),
    FS_COPY(2, "copy"),
    FS_CONTENTS(3, "cntn"),
    FS_UNKNOWN(-1, EnvironmentCompat.MEDIA_UNKNOWN);

    private String stringCode;
    private int typeCode;

    SLSaleType(int typeCode, String stringCode) {
        this.typeCode = typeCode;
        this.stringCode = stringCode;
    }

    public static SLSaleType getByString(String str) {
        for (SLSaleType saleType : valuesCustom()) {
            if (saleType.stringCode.equalsIgnoreCase(str)) {
                return saleType;
            }
        }
        return FS_UNKNOWN;
    }

    public static SLSaleType getByType(int i) {
        for (SLSaleType saleType : valuesCustom()) {
            if (saleType.typeCode == i) {
                return saleType;
            }
        }
        return FS_UNKNOWN;
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static SLSaleType[] valuesCustom() {
        return values();
    }

    public String getStringCode() {
        return this.stringCode;
    }

    public int getTypeCode() {
        return this.typeCode;
    }
}
