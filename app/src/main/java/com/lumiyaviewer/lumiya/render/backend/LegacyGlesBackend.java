package com.lumiyaviewer.lumiya.render.backend;

import android.opengl.GLES10;
import android.opengl.GLES11;
import android.opengl.GLES20;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.drawable.DrawableGeometry;
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer;

public class LegacyGlesBackend implements RenderBackend {
    @Override
    public void onContextInitialized(RenderContext renderContext) {
    }

    @Override
    public void beginFrame(RenderContext renderContext) {
    }

    @Override
    public void endFrame(RenderContext renderContext) {
    }

    @Override
    public void useProgram(int programHandle) {
        GLES20.glUseProgram(programHandle);
    }

    @Override
    public void bindTexture2D(int textureHandle) {
        GLES20.glBindTexture(3553, textureHandle);
    }

    @Override
    public void unbindTexture2D() {
        bindTexture2D(0);
    }

    @Override
    public void setTextureEnabled(RenderContext renderContext, boolean enabled) {
        if (renderContext.hasGL20) {
            if (!enabled && renderContext.curPrimProgram != null) {
                unbindTexture2D();
            }
            if (renderContext.curPrimProgram != null) {
                renderContext.curPrimProgram.setTextureEnabled(enabled);
            }
            return;
        }
        if (enabled) {
            GLES10.glEnable(3553);
            GLES10.glEnableClientState(32888);
            return;
        }
        GLES10.glDisable(3553);
        GLES10.glDisableClientState(32888);
    }

    @Override
    public void setMaterialColor(RenderContext renderContext, int rgba, boolean selected) {
        float r = selected ? 1.0f : (255 - ((rgba >> 0) & 255)) / 255.0f;
        float g = selected ? 0.0f : (255 - ((rgba >> 8) & 255)) / 255.0f;
        float b = selected ? 0.0f : (255 - ((rgba >> 16) & 255)) / 255.0f;
        float a = selected ? 0.6f : (255 - ((rgba >> 24) & 255)) / 255.0f;
        if (renderContext.hasGL20) {
            setUniform4f(renderContext.curPrimProgram.vColor, r, g, b, a);
        } else {
            GLES10.glColor4f(r, g, b, a);
        }
    }

    @Override
    public void setUniform1i(int uniformLocation, int value) {
        GLES20.glUniform1i(uniformLocation, value);
    }

    @Override
    public void setUniform4f(int uniformLocation, float x, float y, float z, float w) {
        GLES20.glUniform4f(uniformLocation, x, y, z, w);
    }

    @Override
    public void setUniformMatrix4fv(int uniformLocation, float[] values, int offset) {
        GLES20.glUniformMatrix4fv(uniformLocation, 1, false, values, offset);
    }

    @Override
    public void submitMeshDraw(RenderContext renderContext, DrawableGeometry drawableGeometry, int faceIndex, GLLoadableBuffer legacyFaceBuffer, float[] texMatrix, int texMatrixOffset) {
        if (renderContext.hasGL20) {
            setUniformMatrix4fv(renderContext.curPrimProgram.uTexMatrix, texMatrix, texMatrixOffset);
            if (faceIndex == -1) {
                drawableGeometry.GLDrawAll20(renderContext);
                return;
            }
            drawableGeometry.GLDrawFace20(renderContext, faceIndex);
            return;
        }
        GLES11.glMatrixMode(5890);
        GLES11.glPushMatrix();
        GLES11.glLoadMatrixf(texMatrix, texMatrixOffset);
        if (faceIndex == -1) {
            drawableGeometry.GLDrawAll10(renderContext);
        } else {
            drawableGeometry.GLDrawFace10(renderContext, faceIndex, legacyFaceBuffer);
        }
        GLES11.glPopMatrix();
        GLES11.glMatrixMode(5888);
    }
}
