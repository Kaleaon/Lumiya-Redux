package com.lumiyaviewer.lumiya.slproto.baker

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParamColor
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams
import com.lumiyaviewer.lumiya.slproto.baker.BakeProcess
import java.io.InputStream
import java.util.List

open class BakeLayer {

    var fixedColor: Int = 0
    var globalColor: SLAvatarGlobalColor? = null
    var hasFixedColor: Boolean = false
    var isRenderPassBump: Boolean = false
    var layerName: String = ""
    var localTexture: AvatarTextureFaceIndex? = null
    var localTextureAlphaOnly: Boolean = false
    var paramIDs: IntArray? = null
    var tgaFileIsMask: Boolean = false
    var tgaTexture: String = ""
    var visibilityMask: Boolean = false
    var writeAllChannels: Boolean = false

    constructor(layerName: String, avatarGlobalColor: SLAvatarGlobalColor, hasFixedColor: Boolean, fixedColor: Int, isRenderPassBump: Boolean, visibilityMask: Boolean, writeAllChannels: Boolean, avatarTextureFaceIndex: AvatarTextureFaceIndex, localTextureAlphaOnly: Boolean, tgaTexture: String, tgaFileIsMask: Boolean, ints: IntArray) {
        this.layerName = layerName
        this.globalColor = avatarGlobalColor
        this.hasFixedColor = hasFixedColor
        this.fixedColor = fixedColor
        this.isRenderPassBump = isRenderPassBump
        this.visibilityMask = visibilityMask
        this.writeAllChannels = writeAllChannels
        this.localTexture = avatarTextureFaceIndex
        this.localTextureAlphaOnly = localTextureAlphaOnly
        this.tgaTexture = tgaTexture
        this.tgaFileIsMask = tgaFileIsMask
        this.paramIDs = ints
    }

    private fun getColorByParamList(bakeProcess: BakeProcess, ints: IntArray, i: Int, i2: Int): Int {
        var avatarParam: SLAvatarParams.AvatarParam? = null
        var paramColor: SLAvatarParamColor? = null
        var colorAdd: Int = 0
        var z: Boolean = false
        if (this.layerName.equals("lipstick")) {
            Debug.Log(String.format("Baking: lipstick start color %08x default %08x", i, i2))
        }
        var length: Int = ints.length
        var i3: Int = 0
        var i4: Int = i
        while (i3 < length) {
            var i5: Int = ints[i3]
            var paramSet: SLAvatarParams.ParamSet = SLAvatarParams.paramByIDs.get(i5)
            if (paramSet != null && (paramColor = (avatarParam = paramSet.params.get(0)).paramColor) != null) {
                z = true
                var paramWeight: Float = bakeProcess.getParamWeight(i5, avatarParam)
                var color: Int = paramColor.getColor(paramWeight)
                if (this.layerName.equals("lipstick")) {
                    Debug.Log(String.format("Baking: lipstick color param weight %ff color %08x", paramWeight, color))
                }
                when (paramColor.colorOperation) {
                    Blend ->
                        colorAdd = SLAvatarParamColor.colorLerp(i4, color, paramWeight)

                    Default ->
                        colorAdd = SLAvatarParamColor.colorAdd(i4, color)

                    Multiply ->
                        colorAdd = SLAvatarParamColor.colorMult(i4, color)

                    else ->
                        colorAdd = i4

                }
                if (this.layerName.equals("lipstick")) {
                    Debug.Log(String.format("Baking: after op, lipstick color result %08x", colorAdd))
                    i4 = colorAdd
                } else {
                    i4 = colorAdd
                }
            }
            i3++
            z = z
        }
        if (return !z) i2 else i4
    }

    private fun getNetColor(bakeProcess: BakeProcess): Int {
        var z: Boolean = false
        var paramIDs: IntArray = this.paramIDs
        var length: Int = paramIDs.length
        var i: Int = 0
        while (true) {
            if (i >= length) {
                z = false

            }
            var paramSet: SLAvatarParams.ParamSet = SLAvatarParams.paramByIDs.get(paramIDs[i])
            if (paramSet != null && paramSet.params.get(0).paramColor != null) {
                z = true

            }
            i++
        }
        if (z) {
            var colorByParamList: Int = if (this.globalColor != null) getColorByParamList(bakeProcess, this.globalColor.getParamIDs(), 0, 0) else if (this.hasFixedColor) this.fixedColor else 0
            return getColorByParamList(bakeProcess, this.paramIDs, colorByParamList, colorByParamList)
        }
        if (this.globalColor != null) {
            return getColorByParamList(bakeProcess, this.globalColor.getParamIDs(), 0, 0)
        }
        if (this.hasFixedColor) {
            return this.fixedColor
        }
        return -1
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0243  */
    /* JADX WARN: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x01a8 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun Bake(openJPEG: OpenJPEG, bakeProcess: BakeProcess) {
        var z: Boolean = false
        var z2: Boolean = false
        var z3: Boolean = false
        var z4: Boolean = false
        var z5: Boolean = false
        var z6: Boolean = false
        var netColor: Int = getNetColor(bakeProcess)
        var openJPEG2: OpenJPEG = OpenJPEG(openJPEG.width, openJPEG.height, 4, 4, 0, 0)
        var openJPEG3: OpenJPEG = OpenJPEG(openJPEG.width, openJPEG.height, 4, 4, 0, 0xFF000000)
        Debug.Log(String.format("Baking: layer %s net_color 0x%08x.", this.layerName, netColor))
        var z7: Boolean = true
        var z8: Boolean = false
        var paramIDs: IntArray = this.paramIDs
        var length: Int = paramIDs.length
        var i: Int = 0
        while (i < length) {
            var i2: Int = paramIDs[i]
            z4 = z8
            var paramSet: SLAvatarParams.ParamSet = SLAvatarParams.paramByIDs.get(i2)
            if (paramSet != null) {
                var avatarParam: SLAvatarParams.AvatarParam = paramSet.params.get(0)
                if (avatarParam.paramAlpha == null || avatarParam.paramAlpha.tgaFile == null) {
                    z4 = z8
                } else {
                    var paramWeight: Float = bakeProcess.getParamWeight(i2, avatarParam)
                    if (z7) {
                        z5 = false
                        if (!avatarParam.paramAlpha.multiplyBlend) {
                            openJPEG3.setComponent(3, 0 as byte)
                        }
                    } else {
                        z5 = z7
                    }
                    if (paramWeight == 0.0f && avatarParam.paramAlpha.skipIfZero) {
                        z4 = z8
                        z7 = z5
                    } else {
                        var z9: Boolean = z8 | avatarParam.paramAlpha.multiplyBlend
                        try (InputStream inputStream = LumiyaApp.getAssetManager().open("tga/" + avatarParam.paramAlpha.tgaFile)) {  // closed even if decoding fails (3.4.2 leaked it)
                            var openJPEG4: OpenJPEG = OpenJPEG(inputStream, OpenJPEG.ImageFormat.TGA, true, true, avatarParam.paramAlpha.domain, paramWeight, false)
                            Debug.Log(String.format("Baking: layer %s: applying alpha (weight %f domain %f) mask texture %s, width %d, height %d, num_comps %d", this.layerName, paramWeight, avatarParam.paramAlpha.domain, avatarParam.paramAlpha.tgaFile, openJPEG4.getWidth(), openJPEG4.getHeight(), openJPEG4.getNumComponents()))
                            openJPEG3.blendAlpha(openJPEG4, !avatarParam.paramAlpha.multiplyBlend)
                            z4 = z9
                            z7 = z5
                        } catch (e: Exception) {
                            e.printStackTrace()
                            z4 = z9
                            z7 = z5
                        }
                    }
                }
            }
            i++
            z8 = z4
        }
        var z10: Boolean = false
        if (this.localTexture != null) {
            try {
                var localTexture: MutableList<OpenJPEG> = bakeProcess.getLocalTexture(this.localTexture)
                if (localTexture != null) {
                    z = false
                    for (openJPEG5 in localTexture) {
                        Debug.Log(String.format("Baking: layer %s: applying local texture, writeAllChannels %s", this.layerName, this.writeAllChannels))
                        openJPEG2.draw(openJPEG5, -1, false)
                        z = true
                    }
                    z10 = z
                    z3 = false
                } else {
                    Debug.Log(String.format("Baking: layer %s: missing local texture", this.layerName))
                    z3 = true
                }
                z2 = z10
                z6 = z3
            } catch (e3: BakeProcess.DefaultTextureException) {
                Debug.Log(String.format("Baking: layer %s: default local texture", this.layerName))
                z6 = true
            }
        }
        if (this.tgaTexture != null) {
            try (InputStream inputStream2 = LumiyaApp.getAssetManager().open("tga/" + this.tgaTexture)) {  // closed even if decoding fails (3.4.2 leaked it)
                var openJPEG6: OpenJPEG = OpenJPEG(inputStream2, OpenJPEG.ImageFormat.TGA, this.tgaFileIsMask, false, 0.0f, 0.0f, false)
                Debug.Log(String.format("Baking: layer %s: applying tga texture %s, writeAllChannels %s, width %d, height %d, num_comps %d", this.layerName, this.tgaTexture, this.writeAllChannels, openJPEG6.getWidth(), openJPEG6.getHeight(), openJPEG6.getNumComponents()))
                openJPEG2.draw(openJPEG6, -1, false)
                z2 = true
            } catch (e4: Exception) {
                e4.printStackTrace()
            }
        }
        if (!z2) {
            openJPEG2.setComponent(0, (byte) -1)
            openJPEG2.setComponent(1, (byte) -1)
            openJPEG2.setComponent(2, (byte) -1)
            openJPEG2.setComponent(3, (byte) -1)
        }
        openJPEG2.blendAlpha(openJPEG3, false)
        if (z6) {
            return
        }
        if (this.isRenderPassBump) {
            openJPEG.drawBump(openJPEG2, netColor, this.writeAllChannels, z8)
        } else {
            openJPEG.draw(openJPEG2, netColor, this.writeAllChannels)
        }
    }

    fun BakeAlpha(openJPEG: OpenJPEG, bakeProcess: BakeProcess) {
        if (this.isRenderPassBump) {
            return
        }
        if (this.tgaTexture != null) {
            try (InputStream open = LumiyaApp.getAssetManager().open("tga/" + this.tgaTexture)) {  // closed even if decoding fails (3.4.2 leaked it)
                var openJPEG2: OpenJPEG = OpenJPEG(open, OpenJPEG.ImageFormat.TGA, this.tgaFileIsMask, false, 0.0f, 0.0f, false)
                Debug.Log(String.format("Baking: layer %s: applying tga alpha mask %swidth %d, height %d, num_comps %d", this.layerName, this.tgaTexture, openJPEG2.getWidth(), openJPEG2.getHeight(), openJPEG2.getNumComponents()))
                openJPEG.blendAlpha(openJPEG2, false)
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
        if (this.localTexture != null) {
            try {
                var localTexture: MutableList<OpenJPEG> = bakeProcess.getLocalTexture(this.localTexture)
                if (localTexture != null) {
                    for (openJPEG3 in localTexture) {
                        Debug.Log(String.format("Baking: layer %s: applying local texture alpha", this.layerName))
                        openJPEG.blendAlpha(openJPEG3, false)
                    }
                }
            } catch (e2: BakeProcess.DefaultTextureException) {
                Debug.Log(String.format("Baking: layer %s: default local texture for alpha", this.layerName))
            }
        }
    }
}
