package com.lumiyaviewer.lumiya.render.glres

import android.opengl.GLES30
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.RenderContext

class GLQuery(glResourceManager: GLResourceManager) : GLResource(glResourceManager) {
    private var isQueryRunningState = false
    private var queryResultState: OcclusionQueryResult = OcclusionQueryResult.NotReady
    private var queryStartedFrameCount = 0

    enum class OcclusionQueryResult {
        NotReady,
        Visible,
        Invisible
    }

    private class GLQueryReference(
        glResource: GLResource,
        handle: Int,
        glResourceManager: GLResourceManager
    ) : GLResourceManager.GLResourceReference(glResource, handle, glResourceManager) {
        @Suppress("FunctionName")
        override fun GLFree() {
            val ints = idQuery.get()
            ints[0] = handle
            Debug.Printf("GLBuffer: deleted buffer %d", ints[0])
            GLES30.glDeleteQueries(1, ints, 0)
        }
    }

    init {
        GLQueryReference(this, handle, glResourceManager)
    }

    @Suppress("FunctionName")
    override fun Allocate(manager: GLResourceManager): Int {
        val ints = idQuery.get()!!
        GLES30.glGenQueries(1, ints, 0)
        return ints[0]
    }

    @Suppress("FunctionName")
    fun BeginOcclusionQuery(renderContext: RenderContext) {
        GLES30.glBeginQuery(GL_ANY_SAMPLES_PASSED, handle)
        isQueryRunningState = true
        queryResultState = OcclusionQueryResult.NotReady
        queryStartedFrameCount = renderContext.frameCount
        renderContext.enqueueOcclusionQuery(this)
    }

    @Suppress("FunctionName")
    fun EndOcclusionQuery() {
        GLES30.glEndQuery(GL_ANY_SAMPLES_PASSED)
    }

    fun checkResult(): Boolean {
        if (!isQueryRunningState) {
            queryResultState = OcclusionQueryResult.NotReady
            return true
        }
        val ints = idQuery.get()!!
        GLES30.glGetQueryObjectuiv(handle, GLES30.GL_QUERY_RESULT_AVAILABLE, ints, 0)
        if (ints[0] == 0) {
            return false
        }
        isQueryRunningState = false
        GLES30.glGetQueryObjectuiv(handle, GLES30.GL_QUERY_RESULT, ints, 0)
        queryResultState = if (ints[0] != 0) OcclusionQueryResult.Visible else OcclusionQueryResult.Invisible
        return true
    }

    fun getOcclusionQueryResult(): OcclusionQueryResult = queryResultState

    fun isQueryRunning(): Boolean = isQueryRunningState

    companion object {
        private const val MIN_OCCLUSION_QUERY_FRAMES = 0
        private const val GL_ANY_SAMPLES_PASSED = 35887
        private val idQuery = object : ThreadLocal<IntArray>() {
            override fun initialValue(): IntArray = IntArray(1)
        }
    }
}
