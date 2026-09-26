package com.lumiyaviewer.lumiya.utils

import android.opengl.Matrix

open class IdentityMatrix {
    companion object {
        private val matrix = FloatArray(16).also { Matrix.setIdentityM(it, 0) }
        @JvmStatic fun getMatrix(): FloatArray = matrix
    }
}
