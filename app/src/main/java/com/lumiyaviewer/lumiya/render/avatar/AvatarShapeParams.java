package com.lumiyaviewer.lumiya.render.avatar;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance;
import java.util.Arrays;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class AvatarShapeParams {

    @Nonnull
    private final int[] visualParamValues;

    private AvatarShapeParams(@Nonnull int[] ints) {
        this.visualParamValues = ints;
    }

    @Nonnull
    public static AvatarShapeParams create(@Nullable AvatarShapeParams avatarShapeParams, AvatarAppearance avatarAppearance) {
        Debug.Log("DrawableAvatar: new appearance for avatar " + avatarAppearance.Sender_Field.ID + ", numParams = " + avatarAppearance.VisualParam_Fields.size() + ", appData = " + avatarAppearance.AppearanceData_Fields.size());
        for (int i = 0; i < avatarAppearance.AppearanceData_Fields.size(); i++) {
            Debug.Printf("appData[%d]: appVer %d, cofVer %d, flags 0x%x", Integer.valueOf(i), Integer.valueOf(avatarAppearance.AppearanceData_Fields.get(i).AppearanceVersion), Integer.valueOf(avatarAppearance.AppearanceData_Fields.get(i).CofVersion), Integer.valueOf(avatarAppearance.AppearanceData_Fields.get(i).Flags));
        }
        int[] ints = new int[218];
        for (int j = 0; j < 218; j++) {
            if (j < avatarAppearance.VisualParam_Fields.size()) {
                ints[j] = avatarAppearance.VisualParam_Fields.get(j).ParamValue;
            } else {
                ints[j] = avatarShapeParams != null ? avatarShapeParams.visualParamValues[j] : 0;
            }
        }
        return new AvatarShapeParams(ints);
    }

    @Nonnull
    public static AvatarShapeParams create(@Nullable AvatarShapeParams avatarShapeParams, int[] ints2) {
        if (ints2.length != 218) {
            int[] ints = new int[218];
            System.arraycopy(ints2, 0, ints, 0, Math.min(ints2.length, 218));
            if (ints2.length >= 218 || avatarShapeParams == null) {
                ints2 = ints;
            } else {
                System.arraycopy(avatarShapeParams.visualParamValues, ints2.length, ints, ints2.length, 218 - ints2.length);
                ints2 = ints;
            }
        }
        return new AvatarShapeParams(ints2);
    }

    public boolean equals(Object obj) {
        if (obj instanceof AvatarShapeParams) {
            return Arrays.equals(this.visualParamValues, ((AvatarShapeParams) obj).visualParamValues);
        }
        return false;
    }

    public int getParamCount() {
        return 218;
    }

    public int getParamValue(int i) {
        if (i < 0 || i >= 218) {
            return 0;
        }
        return this.visualParamValues[i];
    }

    public int hashCode() {
        return Arrays.hashCode(this.visualParamValues);
    }
}
