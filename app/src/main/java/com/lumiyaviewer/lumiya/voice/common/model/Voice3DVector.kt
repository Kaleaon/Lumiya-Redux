package com.lumiyaviewer.lumiya.voice.common.model

import android.annotation.SuppressLint
import android.os.Bundle
import javax.annotation.concurrent.Immutable

@Immutable
class Voice3DVector(
    val x: Float,
    val y: Float,
    val z: Float
) {
    constructor(bundle: Bundle) : this(
        bundle.getFloat("x"),
        bundle.getFloat("y"),
        bundle.getFloat("z")
    )

    fun toBundle(): Bundle = Bundle().apply {
        putFloat("x", x)
        putFloat("y", y)
        putFloat("z", z)
    }

    @SuppressLint("DefaultLocale")
    override fun toString(): String = String.format("(%.2f, %.2f, %.2f)", x, y, z)

    companion object {
        @JvmStatic
        fun fromLLCoords(f: Float, f2: Float, f3: Float): Voice3DVector =
            Voice3DVector(f, f3, -f2)
    }
}
