package com.lumiyaviewer.lumiya.render.shaders

open class ShaderCompileException(message: String) : Exception(message) {
    companion object { private const val serialVersionUID: Long = 1L }
}
