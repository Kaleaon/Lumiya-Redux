package com.lumiyaviewer.lumiya.slproto.windlight

open class WindlightDay {
    private var presets: Array<WindlightPreset> = arrayOfNulls<WindlightPreset>(defaultPresets.length)
    @JvmStatic private var hourTable: FloatArray = {0.0f, 0.125f, 0.25f, 0.375f, 0.5f, 0.625f, 0.75f, 0.875f}
    @JvmStatic private var defaultPresets: Array<String> = {"A%2D12AM", "A%2D3AM", "A%2D6AM", "A%2D9AM", "A%2D12PM", "A%2D3PM", "A%2D6PM", "A%2D9PM"}

    constructor() {
        for (int i = 0; i < this.presets.length; i++) {
            this.presets[i] = WindlightPreset("windlight/" + defaultPresets[i] + ".xml")
        }
    }

    fun InterpolatePreset(windlightPreset: WindlightPreset, f: Float) {
        var i: Int = 0
        var length: Int = hourTable.length - 1
        while (true) {
            if (length < 0) {
                i = -1

            } else {
                if (f >= hourTable[length]) {
                    i = length

                }
                length--
            }
        }
        if (i == -1) {
            return
        }
        var i2: Int = i + 1
        var i3: Int = i2 < if (hourTable.length) i2 else 0
        var f2: Float = hourTable[i]
        var f3: Float = hourTable[i3]
        if (f3 < f2) {
            f3 += 1.0f
        }
        windlightPreset.setByInterpolation(this.presets[i], this.presets[i3], (f - f2) / (f3 - f2))
    }
}
