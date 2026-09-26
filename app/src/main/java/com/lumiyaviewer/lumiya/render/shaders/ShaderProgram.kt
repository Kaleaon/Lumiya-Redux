package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20
import com.lumiyaviewer.lumiya.Debug

abstract class ShaderProgram(
    private val vertexShader: Shader,
    private val fragmentShader: Shader
) {
    @JvmField
    protected var handle: Int = 0

    @Throws(ShaderCompileException::class)
    open fun Compile(shaderPreprocessor: ShaderPreprocessor): Int {
        vertexShader.Compile(shaderPreprocessor)
        fragmentShader.Compile(shaderPreprocessor)
        Debug.Printf("Shaders: Linking...")
        handle = GLES20.glCreateProgram()
        GLES20.glAttachShader(handle, vertexShader.getHandle())
        GLES20.glAttachShader(handle, fragmentShader.getHandle())
        GLES20.glLinkProgram(handle)
        val status = IntArray(1)
        GLES20.glGetProgramiv(handle, 35714, status, 0)
        if (status[0] != 1) {
            throw ShaderCompileException(
                String.format("Shader link error: '%s'", GLES20.glGetProgramInfoLog(handle))
            )
        }
        Debug.Printf("Shaders: Binding variables...")
        bindVariables()
        Debug.Printf("Shaders: Compiled, handle %d", handle)
        return handle
    }

    protected abstract fun bindVariables()

    open fun getHandle(): Int = handle
}
