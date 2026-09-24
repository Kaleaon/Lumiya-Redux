package com.lumiyaviewer.lumiya.slproto.baker;


import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex;
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParamColor;
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams;
import com.lumiyaviewer.lumiya.slproto.baker.BakeProcess;
import java.io.InputStream;
import java.util.List;

public class BakeLayer {

    public int fixedColor;
    public SLAvatarGlobalColor globalColor;
    public boolean hasFixedColor;
    public boolean isRenderPassBump;
    public String layerName;
    public AvatarTextureFaceIndex localTexture;
    public boolean localTextureAlphaOnly;
    public int[] paramIDs;
    public boolean tgaFileIsMask;
    public String tgaTexture;
    public boolean visibilityMask;
    public boolean writeAllChannels;

    public BakeLayer(String layerName, SLAvatarGlobalColor avatarGlobalColor, boolean hasFixedColor, int fixedColor, boolean isRenderPassBump, boolean visibilityMask, boolean writeAllChannels, AvatarTextureFaceIndex avatarTextureFaceIndex, boolean localTextureAlphaOnly, String tgaTexture, boolean tgaFileIsMask, int[] ints) {
        this.layerName = layerName;
        this.globalColor = avatarGlobalColor;
        this.hasFixedColor = hasFixedColor;
        this.fixedColor = fixedColor;
        this.isRenderPassBump = isRenderPassBump;
        this.visibilityMask = visibilityMask;
        this.writeAllChannels = writeAllChannels;
        this.localTexture = avatarTextureFaceIndex;
        this.localTextureAlphaOnly = localTextureAlphaOnly;
        this.tgaTexture = tgaTexture;
        this.tgaFileIsMask = tgaFileIsMask;
        this.paramIDs = ints;
    }

    private int getColorByParamList(BakeProcess bakeProcess, int[] ints, int i, int i2) {
        SLAvatarParams.AvatarParam avatarParam;
        SLAvatarParamColor paramColor;
        int colorAdd;
        boolean z = false;
        if (this.layerName.equals("lipstick")) {
            Debug.Log(String.format("Baking: lipstick start color %08x default %08x", Integer.valueOf(i), Integer.valueOf(i2)));
        }
        int length = ints.length;
        int i3 = 0;
        int i4 = i;
        while (i3 < length) {
            int i5 = ints[i3];
            SLAvatarParams.ParamSet paramSet = SLAvatarParams.paramByIDs.get(Integer.valueOf(i5));
            if (paramSet != null && (paramColor = (avatarParam = paramSet.params.get(0)).paramColor) != null) {
                z = true;
                float paramWeight = bakeProcess.getParamWeight(i5, avatarParam);
                int color = paramColor.getColor(paramWeight);
                if (this.layerName.equals("lipstick")) {
                    Debug.Log(String.format("Baking: lipstick color param weight %ff color %08x", Float.valueOf(paramWeight), Integer.valueOf(color)));
                }
                switch (paramColor.colorOperation) {
                    case Blend:
                        colorAdd = SLAvatarParamColor.colorLerp(i4, color, paramWeight);
                        break;
                    case Default:
                        colorAdd = SLAvatarParamColor.colorAdd(i4, color);
                        break;
                    case Multiply:
                        colorAdd = SLAvatarParamColor.colorMult(i4, color);
                        break;
                    default:
                        colorAdd = i4;
                        break;
                }
                if (this.layerName.equals("lipstick")) {
                    Debug.Log(String.format("Baking: after op, lipstick color result %08x", Integer.valueOf(colorAdd)));
                    i4 = colorAdd;
                } else {
                    i4 = colorAdd;
                }
            }
            i3++;
            z = z;
        }
        return !z ? i2 : i4;
    }

    private int getNetColor(BakeProcess bakeProcess) {
        boolean z;
        int[] paramIDs = this.paramIDs;
        int length = paramIDs.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                z = false;
                break;
            }
            SLAvatarParams.ParamSet paramSet = SLAvatarParams.paramByIDs.get(Integer.valueOf(paramIDs[i]));
            if (paramSet != null && paramSet.params.get(0).paramColor != null) {
                z = true;
                break;
            }
            i++;
        }
        if (z) {
            int colorByParamList = this.globalColor != null ? getColorByParamList(bakeProcess, this.globalColor.getParamIDs(), 0, 0) : this.hasFixedColor ? this.fixedColor : 0;
            return getColorByParamList(bakeProcess, this.paramIDs, colorByParamList, colorByParamList);
        }
        if (this.globalColor != null) {
            return getColorByParamList(bakeProcess, this.globalColor.getParamIDs(), 0, 0);
        }
        if (this.hasFixedColor) {
            return this.fixedColor;
        }
        return -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0243  */
    /* JADX WARN: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x01a8 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void Bake(OpenJPEG openJPEG, BakeProcess bakeProcess) {
        boolean z;
        boolean z2 = false;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6 = false;
        int netColor = getNetColor(bakeProcess);
        OpenJPEG openJPEG2 = new OpenJPEG(openJPEG.width, openJPEG.height, 4, 4, 0, 0);
        OpenJPEG openJPEG3 = new OpenJPEG(openJPEG.width, openJPEG.height, 4, 4, 0, 0xFF000000);
        Debug.Log(String.format("Baking: layer %s net_color 0x%08x.", this.layerName, Integer.valueOf(netColor)));
        boolean z7 = true;
        boolean z8 = false;
        int[] paramIDs = this.paramIDs;
        int length = paramIDs.length;
        int i = 0;
        while (i < length) {
            int i2 = paramIDs[i];
            z4 = z8;
            SLAvatarParams.ParamSet paramSet = SLAvatarParams.paramByIDs.get(Integer.valueOf(i2));
            if (paramSet != null) {
                SLAvatarParams.AvatarParam avatarParam = paramSet.params.get(0);
                if (avatarParam.paramAlpha == null || avatarParam.paramAlpha.tgaFile == null) {
                    z4 = z8;
                } else {
                    float paramWeight = bakeProcess.getParamWeight(i2, avatarParam);
                    if (z7) {
                        z5 = false;
                        if (!avatarParam.paramAlpha.multiplyBlend) {
                            openJPEG3.setComponent(3, (byte) 0);
                        }
                    } else {
                        z5 = z7;
                    }
                    if (paramWeight == 0.0f && avatarParam.paramAlpha.skipIfZero) {
                        z4 = z8;
                        z7 = z5;
                    } else {
                        boolean z9 = z8 | avatarParam.paramAlpha.multiplyBlend;
                        try (InputStream inputStream = LumiyaApp.getAssetManager().open("tga/" + avatarParam.paramAlpha.tgaFile)) {  // closed even if decoding fails (3.4.2 leaked it)
                            OpenJPEG openJPEG4 = new OpenJPEG(inputStream, OpenJPEG.ImageFormat.TGA, true, true, avatarParam.paramAlpha.domain, paramWeight, false);
                            Debug.Log(String.format("Baking: layer %s: applying alpha (weight %f domain %f) mask texture %s, width %d, height %d, num_comps %d", this.layerName, Float.valueOf(paramWeight), Float.valueOf(avatarParam.paramAlpha.domain), avatarParam.paramAlpha.tgaFile, Integer.valueOf(openJPEG4.getWidth()), Integer.valueOf(openJPEG4.getHeight()), Integer.valueOf(openJPEG4.getNumComponents())));
                            openJPEG3.blendAlpha(openJPEG4, !avatarParam.paramAlpha.multiplyBlend);
                            z4 = z9;
                            z7 = z5;
                        } catch (Exception e) {
                            e.printStackTrace();
                            z4 = z9;
                            z7 = z5;
                        }
                    }
                }
            }
            i++;
            z8 = z4;
        }
        boolean z10 = false;
        if (this.localTexture != null) {
            try {
                List<OpenJPEG> localTexture = bakeProcess.getLocalTexture(this.localTexture);
                if (localTexture != null) {
                    z = false;
                    for (OpenJPEG openJPEG5 : localTexture) {
                        Debug.Log(String.format("Baking: layer %s: applying local texture, writeAllChannels %s", this.layerName, Boolean.valueOf(this.writeAllChannels)));
                        openJPEG2.draw(openJPEG5, -1, false);
                        z = true;
                    }
                    z10 = z;
                    z3 = false;
                } else {
                    Debug.Log(String.format("Baking: layer %s: missing local texture", this.layerName));
                    z3 = true;
                }
                z2 = z10;
                z6 = z3;
            } catch (BakeProcess.DefaultTextureException e3) {
                Debug.Log(String.format("Baking: layer %s: default local texture", this.layerName));
                z6 = true;
            }
        }
        if (this.tgaTexture != null) {
            try (InputStream inputStream2 = LumiyaApp.getAssetManager().open("tga/" + this.tgaTexture)) {  // closed even if decoding fails (3.4.2 leaked it)
                OpenJPEG openJPEG6 = new OpenJPEG(inputStream2, OpenJPEG.ImageFormat.TGA, this.tgaFileIsMask, false, 0.0f, 0.0f, false);
                Debug.Log(String.format("Baking: layer %s: applying tga texture %s, writeAllChannels %s, width %d, height %d, num_comps %d", this.layerName, this.tgaTexture, Boolean.valueOf(this.writeAllChannels), Integer.valueOf(openJPEG6.getWidth()), Integer.valueOf(openJPEG6.getHeight()), Integer.valueOf(openJPEG6.getNumComponents())));
                openJPEG2.draw(openJPEG6, -1, false);
                z2 = true;
            } catch (Exception e4) {
                e4.printStackTrace();
            }
        }
        if (!z2) {
            openJPEG2.setComponent(0, (byte) -1);
            openJPEG2.setComponent(1, (byte) -1);
            openJPEG2.setComponent(2, (byte) -1);
            openJPEG2.setComponent(3, (byte) -1);
        }
        openJPEG2.blendAlpha(openJPEG3, false);
        if (z6) {
            return;
        }
        if (this.isRenderPassBump) {
            openJPEG.drawBump(openJPEG2, netColor, this.writeAllChannels, z8);
        } else {
            openJPEG.draw(openJPEG2, netColor, this.writeAllChannels);
        }
    }

    public void BakeAlpha(OpenJPEG openJPEG, BakeProcess bakeProcess) {
        if (this.isRenderPassBump) {
            return;
        }
        if (this.tgaTexture != null) {
            try (InputStream open = LumiyaApp.getAssetManager().open("tga/" + this.tgaTexture)) {  // closed even if decoding fails (3.4.2 leaked it)
                OpenJPEG openJPEG2 = new OpenJPEG(open, OpenJPEG.ImageFormat.TGA, this.tgaFileIsMask, false, 0.0f, 0.0f, false);
                Debug.Log(String.format("Baking: layer %s: applying tga alpha mask %swidth %d, height %d, num_comps %d", this.layerName, this.tgaTexture, Integer.valueOf(openJPEG2.getWidth()), Integer.valueOf(openJPEG2.getHeight()), Integer.valueOf(openJPEG2.getNumComponents())));
                openJPEG.blendAlpha(openJPEG2, false);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (this.localTexture != null) {
            try {
                List<OpenJPEG> localTexture = bakeProcess.getLocalTexture(this.localTexture);
                if (localTexture != null) {
                    for (OpenJPEG openJPEG3 : localTexture) {
                        Debug.Log(String.format("Baking: layer %s: applying local texture alpha", this.layerName));
                        openJPEG.blendAlpha(openJPEG3, false);
                    }
                }
            } catch (BakeProcess.DefaultTextureException e2) {
                Debug.Log(String.format("Baking: layer %s: default local texture for alpha", this.layerName));
            }
        }
    }
}
