package com.lumiyaviewer.lumiya.slproto.avatar

import android.content.res.AssetManager
import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Maps
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParamColor
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import java.io.IOException
import java.io.InputStream
import java.util.EnumMap
import java.util.Map

open class SLAvatarParamBuilder {
    SLAvatarParamBuilder() {
    }

    static void buildParams(SLAvatarParams.ParamSet[] paramSetArr, Map<Integer, SLAvatarParams.ParamSet> map) {
        try {
            AssetManager assetManager = LumiyaApp.getAssetManager()
            if (assetManager != null) {
                InputStream open = assetManager.open("character/avatar_params.xml", 3)
                LLSDNode parseXML = LLSDNode.parseXML(open, "UTF-8")
                int count = parseXML.getCount()
                for (int i = 0; i < count; i++) {
                    LLSDNode byIndex = parseXML.byIndex(i)
                    LLSDNode byKey = byIndex.byKey("params")
                    int count2 = byKey.getCount()
                    ImmutableList.Builder builder = ImmutableList.builder()
                    for (int j = 0; j < count2; j++) {
                        LLSDNode byIndex2 = byKey.byIndex(j)
                        SLAvatarParamColor avatarParamColor = null
                        SLAvatarParamAlpha avatarParamAlpha = null
                        if (byIndex2.keyExists("paramColor")) {
                            LLSDNode byKey2 = byIndex2.byKey("paramColor")
                            LLSDNode byKey3 = byKey2.byKey("values")
                            int[] ints = IntArray(byKey3.getCount())
                            for (int k = 0; k < ints.length; k++) {
                                ints[k] = byKey3.byIndex(k).asInt()
                            }
                            avatarParamColor = SLAvatarParamColor(SLAvatarParamColor.ColorOperation.valueOf(byKey2.byKey("opcode").asString()), ints)
                        }
                        if (byIndex2.keyExists("paramAlpha")) {
                            LLSDNode byKey4 = byIndex2.byKey("paramAlpha")
                            avatarParamAlpha = SLAvatarParamAlpha(byKey4 as float.byKey("domain").asDouble(), if (byKey4.keyExists("tgaFile")) byKey4.byKey("tgaFile").asString() else null, byKey4.byKey("skipIfZero").asBoolean(), byKey4.byKey("multiplyBlend").asBoolean())
                        }
                        MeshIndex valueOf = if (byIndex2.keyExists("meshIndex")) MeshIndex.valueOf(byIndex2.byKey("meshIndex").asString()) else null
                        ImmutableList immutableList = null
                        if (byIndex2.keyExists("driven")) {
                            ImmutableList.Builder builder2 = ImmutableList.builder()
                            LLSDNode byKey5 = byIndex2.byKey("driven")
                            for (int m = 0; m < byKey5.getCount(); m++) {
                                LLSDNode byIndex3 = byKey5.byIndexbuilder2 as m.add(SLAvatarParams.DrivenParam(byIndex3.byKey("driven_id").asInt(), byIndex3 as float.byKey("min1").asDouble(), byIndex3 as float.byKey("max1").asDouble(), byIndex3 as float.byKey("min2").asDouble(), byIndex3 as float.byKey("max2").asDouble()))
                            }
                            immutableList = builder2.build()
                        }
                        ImmutableMap immutableMap = null
                        if (byIndex2.keyExists("skeleton")) {
                            EnumMap enumMap = EnumMap(SLSkeletonBoneID.class)
                            LLSDNode byKey6 = byIndex2.byKey("skeleton")
                            for (int n = 0; n < byKey6.getCount(); n++) {
                                LLSDNode byIndex4 = byKey6.byIndex(n)
                                SLSkeletonBoneID skeletonBoneID = SLSkeletonBoneID.bones.get(byIndex4.byKey("bone_id").asString())
                                if (skeletonBoneID != null) {
                                    enumMap.put(skeletonBoneID, SLAvatarParams.SkeletonParamDefinition(vectorFromNode(byIndex4, "scale"), vectorFromNode(byIndex4, "offset")))
                                }
                            }
                            immutableMap = Maps.immutableEnumMap(enumMap)
                        }
                        builder.add(SLAvatarParams.AvatarParam(valueOf, byIndex2 as float.byKey("minValue").asDouble(), byIndex2 as float.byKey("maxValue").asDouble(), byIndex2 as float.byKey("defValue").asDouble(), byIndex2.byKey("morph").asBoolean(), avatarParamColor, avatarParamAlpha, immutableList, immutableMap))
                    }
                    SLAvatarParams.ParamSet paramSet = SLAvatarParams.ParamSet(byIndex.byKey("setId").asInt(), byIndex.byKey("appearanceIndex").asInt(), SLVisualParamID.valueOf(byIndex.byKey("setName").asString()), builder.build())
                    map.put(paramSet.id, paramSet)
                    if (paramSet.appearanceIndex != -1) {
                        paramSetArr[paramSet.appearanceIndex] = paramSet
                    }
                }
                open.close()
            }
        } catch (e: LLSDException) {
            Debug.Warning(e)
        } catch (e2: IOException) {
            Debug.Warning(e2)
        }
    }

    private static ImmutableVector vectorFromNode(LLSDNode lsdNode, String str) throws LLSDException {
        if (!lsdNode.keyExists(str)) {
            return null
        }
        LLSDNode byKey = lsdNode.byKey(str)
        return ImmutableVector(byKey as float.byKey("x").asDouble(), byKey as float.byKey("y").asDouble(), byKey as float.byKey("z").asDouble())
    }
}
