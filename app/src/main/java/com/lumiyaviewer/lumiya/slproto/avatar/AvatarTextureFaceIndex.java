package com.lumiyaviewer.lumiya.slproto.avatar;

public enum AvatarTextureFaceIndex {
    TEX_HEAD_BODYPAINT("head"),
    TEX_UPPER_SHIRT("upper"),
    TEX_LOWER_PANTS("lower"),
    TEX_EYES_IRIS("eyes"),
    TEX_HAIR("hair"),
    TEX_UPPER_BODYPAINT("upper"),
    TEX_LOWER_BODYPAINT("lower"),
    TEX_LOWER_SHOES("lower"),
    TEX_HEAD_BAKED("head"),
    TEX_UPPER_BAKED("upper"),
    TEX_LOWER_BAKED("lower"),
    TEX_EYES_BAKED("eyes"),
    TEX_LOWER_SOCKS("lower"),
    TEX_UPPER_JACKET("upper"),
    TEX_LOWER_JACKET("lower"),
    TEX_UPPER_GLOVES("upper"),
    TEX_UPPER_UNDERSHIRT("upper"),
    TEX_LOWER_UNDERPANTS("lower"),
    TEX_SKIRT("skirt"),
    TEX_SKIRT_BAKED("skirt"),
    TEX_HAIR_BAKED("hair"),
    TEX_LOWER_ALPHA("lower"),
    TEX_UPPER_ALPHA("upper"),
    TEX_HEAD_ALPHA("head"),
    TEX_EYES_ALPHA("eyes"),
    TEX_HAIR_ALPHA("hair"),
    TEX_HEAD_TATTOO("head"),
    TEX_UPPER_TATTOO("upper"),
    TEX_LOWER_TATTOO("lower"),
    // Universal wearable and Bakes on Mesh slots (2019). The ordinal is the
    // texture entry face, so these follow ETextureIndex in
    // indra/llappearance/llavatarappearancedefines.h exactly. The name is the
    // bake region, used in appearance-service texture URLs.
    TEX_HEAD_UNIVERSAL_TATTOO("head"),
    TEX_UPPER_UNIVERSAL_TATTOO("upper"),
    TEX_LOWER_UNIVERSAL_TATTOO("lower"),
    TEX_SKIRT_TATTOO("skirt"),
    TEX_HAIR_TATTOO("hair"),
    TEX_EYES_TATTOO("eyes"),
    TEX_LEFT_ARM_TATTOO("leftarm"),
    TEX_LEFT_LEG_TATTOO("leftleg"),
    TEX_AUX1_TATTOO("aux1"),
    TEX_AUX2_TATTOO("aux2"),
    TEX_AUX3_TATTOO("aux3"),
    TEX_LEFT_ARM_BAKED("leftarm"),
    TEX_LEFT_LEG_BAKED("leftleg"),
    TEX_AUX1_BAKED("aux1"),
    TEX_AUX2_BAKED("aux2"),
    TEX_AUX3_BAKED("aux3");

    private String bakedTextureName;

    AvatarTextureFaceIndex(String bakedTextureName) {
        this.bakedTextureName = bakedTextureName;
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static AvatarTextureFaceIndex[] valuesCustom() {
        return values();
    }

    public String getBakedTextureName() {
        return this.bakedTextureName;
    }
}
