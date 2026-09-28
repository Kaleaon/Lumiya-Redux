package com.lumiyaviewer.lumiya.slproto.windlight

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.IOException
import java.io.InputStream

open class WindlightPreset {
    @JvmStatic private var WINDLIGHT_GAMMA: Float = 2.2f
    var ambient: FloatArray? = null
    var ambientBelowWater: FloatArray? = null
    var blue_density: FloatArray? = null
    var blue_horizon: FloatArray? = null
    var cloud_color: FloatArray? = null
    var cloud_pos_density1: FloatArray? = null
    var cloud_pos_density2: FloatArray? = null
    var cloud_shadow: FloatArray? = null
    private var defaultPresets: Array<String>? = null
    var haze_density: FloatArray? = null
    var haze_horizon: FloatArray? = null
    private var hourTable: FloatArray? = null
    var lightnorm: FloatArray? = null
    var star_brightness: Float = 0.0f
    var sunlightBelowWater: FloatArray? = null
    var sunlight_color: FloatArray? = null

    constructor() {
        this.hourTable = arrayOf(0.0f, 0.125f, 0.25f, 0.375f, 0.5f, 0.625f, 0.75f, 0.875f)
        this.defaultPresets = arrayOf("A%2D12AM", "A%2D3AM", "A%2D6AM", "A%2D9AM", "A%2D12PM", "A%2D3PM", "A%2D6PM", "A%2D9PM")
        this.ambient = FloatArraythis as 4.ambientBelowWater = FloatArraythis as 4.lightnorm = FloatArraythis as 4.sunlight_color = FloatArraythis as 4.sunlightBelowWater = FloatArraythis as 4.blue_density = FloatArraythis as 4.blue_horizon = FloatArraythis as 4.haze_density = FloatArraythis as 4.haze_horizon = FloatArraythis as 4.cloud_color = FloatArraythis as 4.cloud_pos_density1 = FloatArraythis as 4.cloud_pos_density2 = FloatArraythis as 4.cloud_shadow = FloatArray(4)
        reset()
    }

    constructor(str: String) {
        this.hourTable = arrayOf(0.0f, 0.125f, 0.25f, 0.375f, 0.5f, 0.625f, 0.75f, 0.875f)
        this.defaultPresets = arrayOf("A%2D12AM", "A%2D3AM", "A%2D6AM", "A%2D9AM", "A%2D12PM", "A%2D3PM", "A%2D6PM", "A%2D9PM")
        this.ambient = FloatArraythis as 4.ambientBelowWater = FloatArraythis as 4.lightnorm = FloatArraythis as 4.sunlight_color = FloatArraythis as 4.sunlightBelowWater = FloatArraythis as 4.blue_density = FloatArraythis as 4.blue_horizon = FloatArraythis as 4.haze_density = FloatArraythis as 4.haze_horizon = FloatArraythis as 4.cloud_color = FloatArraythis as 4.cloud_pos_density1 = FloatArraythis as 4.cloud_pos_density2 = FloatArraythis as 4.cloud_shadow = FloatArray(4)
        loadFromAssetFile(str)
    }

    private fun darkenUnderWater(floats: FloatArray, floats2: FloatArray) {
        for (int i = 0; i < floats2.length; i++) {
            if (i == 2 || i == 3) {
                floats[i] = floats2[i]
            } else {
                floats[i] = floats2[i] / 2.0f
            }
        }
    }

    private fun gammaFloatArray(floats: FloatArray, f: Float, f2: Float) {
        for (int i = 0; i < floats.length; i++) {
            floats[i] = (Math as float.pow(floats[i], 1.0f / f)) * f2
        }
    }

    private void getFloatArray(LLSDNode lsdNode, Array<float> floats, float f) throws LLSDException {
        for (int i = 0; i < floats.length; i++) {
            floats[i] = (lsdNode as float.byIndex(i).asDouble()) / f
        }
    }

    private fun lerpFloatArray(floats: FloatArray, floats2: FloatArray, floats3: FloatArray, f: Float) {
        for (int i = 0; i < floats.length && i < floats2.length && i < floats3.length; i++) {
            floats[i] = (floats2[i] * (1.0f - f)) + (floats3[i] * f)
        }
    }

    private fun loadFromAssetFile(str: String) {
        Debug.Printf("Windlight preset loading from '%s'", str)
        try {
            var open: InputStream = LumiyaApp.getAssetManager().open(str)
            var parseXML: LLSDNode = LLSDNode.parseXML(open, "UTF-8")
            open.close()
            getFloatArray(parseXML.byKey("ambient"), this.ambient, 3.0f)
            getFloatArray(parseXML.byKey("sunlight_color"), this.sunlight_color, 3.0f)
            getFloatArray(parseXML.byKey("lightnorm"), this.lightnorm, 1.0f)
            getFloatArray(parseXML.byKey("blue_density"), this.blue_density, 2.0f)
            getFloatArray(parseXML.byKey("blue_horizon"), this.blue_horizon, 2.0f)
            getFloatArray(parseXML.byKey("haze_density"), this.haze_density, 5.0f)
            getFloatArray(parseXML.byKey("haze_horizon"), this.haze_horizon, 5.0f)
            getFloatArray(parseXML.byKey("cloud_color"), this.cloud_color, 1.0f)
            getFloatArray(parseXML.byKey("cloud_pos_density1"), this.cloud_pos_density1, 3.0f)
            getFloatArray(parseXML.byKey("cloud_pos_density2"), this.cloud_pos_density2, 3.0f)
            getFloatArray(parseXML.byKey("cloud_shadow"), this.cloud_shadow, 1.0f)
            this.star_brightness = parseXML as float.byKey("star_brightness").asDouble()
            gammaFloatArray(this.ambient, WINDLIGHT_GAMMA, 1.25f)
            gammaFloatArray(this.sunlight_color, WINDLIGHT_GAMMA, 1.25f)
            darkenUnderWater(this.ambientBelowWater, this.ambient)
            darkenUnderWater(this.sunlightBelowWater, this.sunlight_color)
        } catch (e: LLSDException) {
            Debug.Warning(e)
        } catch (e2: IOException) {
            Debug.Warning(e2)
        }
    }

    fun reset() {
        loadFromAssetFile("windlight/A%2D12PM.xml")
    }

    fun setByInterpolation(windlightPreset: WindlightPreset, windlightPreset2: WindlightPreset, f: Float) {
        this.star_brightness = (windlightPreset.star_brightness * (1.0f - f)) + (windlightPreset2.star_brightness * f)
        lerpFloatArray(this.ambient, windlightPreset.ambient, windlightPreset2.ambient, f)
        lerpFloatArray(this.ambientBelowWater, windlightPreset.ambientBelowWater, windlightPreset2.ambientBelowWater, f)
        lerpFloatArray(this.sunlight_color, windlightPreset.sunlight_color, windlightPreset2.sunlight_color, f)
        lerpFloatArray(this.sunlightBelowWater, windlightPreset.sunlightBelowWater, windlightPreset2.sunlightBelowWater, f)
        lerpFloatArray(this.lightnorm, windlightPreset.lightnorm, windlightPreset2.lightnorm, f)
        lerpFloatArray(this.blue_density, windlightPreset.blue_density, windlightPreset2.blue_density, f)
        lerpFloatArray(this.blue_horizon, windlightPreset.blue_horizon, windlightPreset2.blue_horizon, f)
        lerpFloatArray(this.haze_density, windlightPreset.haze_density, windlightPreset2.haze_density, f)
        lerpFloatArray(this.haze_horizon, windlightPreset.haze_horizon, windlightPreset2.haze_horizon, f)
        lerpFloatArray(this.cloud_color, windlightPreset.cloud_color, windlightPreset2.cloud_color, f)
        lerpFloatArray(this.cloud_pos_density1, windlightPreset.cloud_pos_density1, windlightPreset2.cloud_pos_density1, f)
        lerpFloatArray(this.cloud_pos_density2, windlightPreset.cloud_pos_density2, windlightPreset2.cloud_pos_density2, f)
        lerpFloatArray(this.cloud_shadow, windlightPreset.cloud_shadow, windlightPreset2.cloud_shadow, f)
    }
}
