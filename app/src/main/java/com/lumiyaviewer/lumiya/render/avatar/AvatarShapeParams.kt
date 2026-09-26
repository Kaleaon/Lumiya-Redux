package com.lumiyaviewer.lumiya.render.avatar

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance
import java.util.Arrays

class AvatarShapeParams private constructor(private val visualParamValues: IntArray) {

    override fun equals(other: Any?): Boolean {
        if (other is AvatarShapeParams) {
            return visualParamValues.contentEquals(other.visualParamValues)
        }
        return false
    }

    fun getParamCount(): Int = PARAM_COUNT

    fun getParamValue(index: Int): Int {
        if (index < 0 || index >= PARAM_COUNT) {
            return 0
        }
        return visualParamValues[index]
    }

    override fun hashCode(): Int = visualParamValues.contentHashCode()

    companion object {
        private const val PARAM_COUNT = 218

        @JvmStatic
        fun create(previous: AvatarShapeParams?, avatarAppearance: AvatarAppearance): AvatarShapeParams {
            Debug.Log(
                "DrawableAvatar: new appearance for avatar " + avatarAppearance.Sender_Field.ID +
                    ", numParams = " + avatarAppearance.VisualParam_Fields.size +
                    ", appData = " + avatarAppearance.AppearanceData_Fields.size
            )
            for (i in avatarAppearance.AppearanceData_Fields.indices) {
                val appData = avatarAppearance.AppearanceData_Fields[i]
                Debug.Printf(
                    "appData[%d]: appVer %d, cofVer %d, flags 0x%x",
                    i, appData.AppearanceVersion, appData.CofVersion, appData.Flags
                )
            }
            val values = IntArray(PARAM_COUNT)
            for (j in 0 until PARAM_COUNT) {
                values[j] = if (j < avatarAppearance.VisualParam_Fields.size) {
                    avatarAppearance.VisualParam_Fields[j].ParamValue
                } else {
                    previous?.visualParamValues?.get(j) ?: 0
                }
            }
            return AvatarShapeParams(values)
        }

        @JvmStatic
        fun create(previous: AvatarShapeParams?, values: IntArray): AvatarShapeParams {
            var result = values
            if (result.size != PARAM_COUNT) {
                val resized = IntArray(PARAM_COUNT)
                System.arraycopy(result, 0, resized, 0, minOf(result.size, PARAM_COUNT))
                result = if (result.size >= PARAM_COUNT || previous == null) {
                    resized
                } else {
                    System.arraycopy(
                        previous.visualParamValues, result.size, resized, result.size, PARAM_COUNT - result.size
                    )
                    resized
                }
            }
            return AvatarShapeParams(result)
        }
    }
}
