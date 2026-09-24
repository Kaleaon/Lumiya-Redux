package com.lumiyaviewer.lumiya.render.avatar;

import android.opengl.GLES10;
import android.opengl.GLES20;
import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.render.MatrixStack;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.glres.GLCleanable;
import com.lumiyaviewer.lumiya.render.glres.textures.GLLoadedTextTexture;
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextTextureCache;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.res.text.DrawableTextParams;

public class DrawableHoverText implements ResourceConsumer, GLCleanable {
    private final int backgroundColor;
    private final String hoverText;
    private volatile GLLoadedTextTexture hoverTextTexture;
    private final GLTextTextureCache textTextureCache;
    private boolean textureRequested = false;

    public DrawableHoverText(GLTextTextureCache glTextTextureCache, String hoverText, int backgroundColor) {
        this.textTextureCache = glTextTextureCache;
        this.hoverText = hoverText;
        this.backgroundColor = backgroundColor;
    }

    public final void DrawAtWorld(RenderContext renderContext, float f, float f2, float f3, float f4, MatrixStack matrixStack, boolean z, int i) {
        float[] floats = new float[8];
        float[] matrixData = renderContext.modelViewMatrix.getMatrixData();
        int matrixDataOffset = renderContext.modelViewMatrix.getMatrixDataOffset();
        float[] matrixData2 = matrixStack.getMatrixData();
        int matrixDataOffset2 = matrixStack.getMatrixDataOffset();
        floats[0] = f;
        floats[1] = f2;
        floats[2] = f3;
        floats[3] = 1.0f;
        Matrix.multiplyMV(floats, 4, matrixData, matrixDataOffset, floats, 0);
        floats[5] = floats[5] + f4;
        if (renderContext.hasGL20) {
            System.arraycopy(floats, 4, floats, 0, 4);
        } else {
            Matrix.multiplyMV(floats, 0, matrixData2, matrixDataOffset2, floats, 4);
        }
        if (floats[3] != 0.0f) {
            float f5 = floats[0] / floats[3];
            float f6 = floats[1] / floats[3];
            if (floats[3] != 0.0f) {
                GLDraw(renderContext, f5, f6, floats[2] / floats[3], z, i);
            }
        }
    }

    @Override
    public void GLCleanup() {
        if (this.textTextureCache != null) {
            this.textTextureCache.CancelRequest(this);
        }
        this.textureRequested = false;
        this.hoverTextTexture = null;
    }

    public final void GLDraw(RenderContext renderContext, float f, float f2, float f3, boolean z, int i) {
        if (!this.textureRequested) {
            this.textureRequested = true;
            this.textTextureCache.RequestResource(DrawableTextParams.create(this.hoverText, this.backgroundColor), this);
        }
        GLLoadedTextTexture hoverTextTexture = this.hoverTextTexture;
        if (hoverTextTexture != null) {
            float width = (hoverTextTexture.getWidth() * 2.0f) / renderContext.viewportRect[2];
            float height = (hoverTextTexture.getHeight() * 2.0f) / renderContext.viewportRect[3];
            if (renderContext.hasGL20) {
                GLES20.glUniform3f(renderContext.quadProgram.uPreTranslate, f, f2, f3);
                GLES20.glUniform3f(renderContext.quadProgram.uScale, width, height, 1.0f);
                GLES20.glUniform3f(renderContext.quadProgram.uPostTranslate, 0.0f, hoverTextTexture.baselineOffset, 0.0f);
                hoverTextTexture.GLDraw();
                if (z) {
                    GLES20.glUniform4f(renderContext.quadProgram.uColor, ((i >> 0) & 255) / 255.0f, ((i >> 8) & 255) / 255.0f, ((i >> 16) & 255) / 255.0f, (255 - ((i >> 24) & 255)) / 255.0f);
                    GLES20.glUniform1i(renderContext.quadProgram.uColorize, 1);
                } else {
                    GLES20.glUniform4f(renderContext.quadProgram.uColor, 1.0f, 1.0f, 1.0f, 1.0f);
                    GLES20.glUniform1i(renderContext.quadProgram.uColorize, 0);
                }
            } else {
                GLES10.glLoadIdentity();
                GLES10.glTranslatef(f, f2, f3);
                GLES10.glScalef(width, height, 1.0f);
                GLES10.glTranslatef(0.0f, hoverTextTexture.baselineOffset, 0.0f);
                if (z) {
                    GLES10.glColor4f(((i >> 0) & 255) / 255.0f, ((i >> 8) & 255) / 255.0f, ((i >> 16) & 255) / 255.0f, 1.0f - (((i >> 24) & 255) / 255.0f));
                } else {
                    GLES10.glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
                }
                hoverTextTexture.GLDraw();
            }
            renderContext.quad.DrawQuad(renderContext);
        }
    }

    @Override
    public void OnResourceReady(Object obj, boolean z) {
        if (obj instanceof GLLoadedTextTexture) {
            this.hoverTextTexture = (GLLoadedTextTexture) obj;
        } else if (obj == null) {
            this.hoverTextTexture = null;
        }
    }
}
