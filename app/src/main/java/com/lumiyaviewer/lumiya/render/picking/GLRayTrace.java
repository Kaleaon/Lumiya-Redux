package com.lumiyaviewer.lumiya.render.picking;

import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.types.LLVector4;

public class GLRayTrace {

    public static class RayIntersectInfo {
        public final LLVector4 intersectPoint;
        public final float s;
        public final float t;

        RayIntersectInfo(LLVector4 intersectPoint, float s, float t) {
            this.intersectPoint = intersectPoint;
            this.s = s;
            this.t = t;
        }

        public String toString() {
            return "RayIntersectInfo{intersectPoint=" + this.intersectPoint + ", s=" + this.s + ", t=" + this.t + '}';
        }
    }

    public static float getIntersectionDepth(RenderContext renderContext, LLVector4 vector4, float[] floats2) {
        float[] floats = new float[8];
        Matrix.multiplyMV(floats, 0, floats2, 0, new float[]{vector4.x, vector4.y, vector4.z, 1.0f}, 0);
        if (renderContext.hasGL20) {
            Matrix.multiplyMV(floats, 4, renderContext.modelViewMatrix.getMatrixData(), renderContext.modelViewMatrix.getMatrixDataOffset(), floats, 0);
        } else {
            Matrix.multiplyMV(floats, 4, renderContext.projectionMatrix.getMatrixData(), renderContext.projectionMatrix.getMatrixDataOffset(), floats, 0);
        }
        return floats[6];
    }

    public static RayIntersectInfo intersect_RayTriangle(LLVector3 vector35, LLVector3 vector36, LLVector3[] vector3s, int i) {
        LLVector3 sub = LLVector3.sub(vector3s[i + 1], vector3s[i + 0]);
        LLVector3 vector3 = LLVector3.sub(vector3s[i + 2], vector3s[i + 0]);
        LLVector3 cross = LLVector3.cross(sub, vector3);
        if (cross.isZero()) {
            return null;
        }
        LLVector3 vector37 = LLVector3.sub(vector36, vector35);
        float f = -cross.dot(LLVector3.sub(vector35, vector3s[i + 0]));
        float dot = cross.dot(vector37);
        if (Math.abs(dot) < 1.0E-7f) {
            return null;
        }
        float f2 = f / dot;
        if (f2 < 0.0d) {
            return null;
        }
        LLVector3 vector38 = new LLVector3(vector37);
        vector38.mul(f2);
        vector38.add(vector35);
        float dot2 = sub.dot(sub);
        float dot3 = sub.dot(vector3);
        float dot4 = vector3.dot(vector3);
        LLVector3 vector39 = LLVector3.sub(vector38, vector3s[i + 0]);
        float dot5 = vector39.dot(sub);
        float dot6 = vector39.dot(vector3);
        float f3 = (dot3 * dot3) - (dot2 * dot4);
        if (Math.abs(f3) < 1.0E-7f) {
            return null;
        }
        float f4 = ((dot3 * dot6) - (dot4 * dot5)) / f3;
        if (f4 < 0.0d || f4 > 1.0d) {
            return null;
        }
        float f5 = ((dot5 * dot3) - (dot6 * dot2)) / f3;
        if (f5 < 0.0d || f4 + f5 > 1.0d) {
            return null;
        }
        return new RayIntersectInfo(new LLVector4(vector38.x, vector38.y, vector38.z, f2), f4, f5);
    }
}
