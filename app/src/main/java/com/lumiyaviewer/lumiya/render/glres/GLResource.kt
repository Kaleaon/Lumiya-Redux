package com.lumiyaviewer.lumiya.render.glres

abstract class GLResource(manager: GLResourceManager) : GLGenericResource {
    @JvmField val handle: Int = Allocate(manager)

    @Suppress("FunctionName")
    protected abstract fun Allocate(manager: GLResourceManager): Int
}
