package com.lumiyaviewer.lumiya.render

import com.google.common.base.Optional
import com.google.common.base.Strings
import java.util.regex.Pattern

class GPUDetection(rendererString: String?) {
    @JvmField
    val detectedFamily: Optional<String>

    @JvmField
    val detectedNumericVersion: Int

    @JvmField
    val detectedVersion: Optional<String>

    init {
        val renderer = Strings.nullToEmpty(rendererString)
        if (renderer.lowercase().contains("adreno")) {
            detectedFamily = Optional.of(GPU_FAMILY_ADRENO)
            val matcher = Pattern.compile(".*?Adreno.*?([0-9]+).*?", Pattern.CASE_INSENSITIVE).matcher(renderer)
            if (matcher.matches()) {
                detectedVersion = Optional.fromNullable(Strings.emptyToNull(matcher.group(1)))
                detectedNumericVersion = try {
                    detectedVersion.or("").toInt()
                } catch (e: NumberFormatException) {
                    INVALID_VERSION
                }
            } else {
                detectedVersion = Optional.absent()
                detectedNumericVersion = INVALID_VERSION
            }
        } else if (renderer.lowercase().contains("tegra")) {
            detectedFamily = Optional.of(GPU_FAMILY_TEGRA)
            detectedVersion = Optional.absent()
            detectedNumericVersion = INVALID_VERSION
        } else {
            detectedFamily = Optional.absent()
            detectedVersion = Optional.absent()
            detectedNumericVersion = INVALID_VERSION
        }
    }

    companion object {
        const val GPU_FAMILY_ADRENO = "Adreno"
        const val GPU_FAMILY_TEGRA = "Tegra"
        const val INVALID_VERSION = -1
    }
}
