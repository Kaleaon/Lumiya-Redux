package com.lumiyaviewer.lumiya.render.backend;

import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.drawable.DrawableGeometry;
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer;

public interface RenderBackend {
    void onContextInitialized(RenderContext renderContext);

    void beginFrame(RenderContext renderContext);

    void endFrame(RenderContext renderContext);

    void useProgram(int programHandle);

    void bindTexture2D(int textureHandle);

    void unbindTexture2D();

    void setTextureEnabled(RenderContext renderContext, boolean enabled);

    void setMaterialColor(RenderContext renderContext, int rgba, boolean selected);

    void setUniform1i(int uniformLocation, int value);

    void setUniform4f(int uniformLocation, float x, float y, float z, float w);

    void setUniformMatrix4fv(int uniformLocation, float[] values, int offset);

    void submitMeshDraw(RenderContext renderContext, DrawableGeometry drawableGeometry, int faceIndex, GLLoadableBuffer legacyFaceBuffer, float[] texMatrix, int texMatrixOffset);
}
