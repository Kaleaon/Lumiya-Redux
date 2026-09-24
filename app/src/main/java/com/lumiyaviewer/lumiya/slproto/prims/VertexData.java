package com.lumiyaviewer.lumiya.slproto.prims;

import com.lumiyaviewer.lumiya.slproto.types.LLVector2;
import com.lumiyaviewer.lumiya.slproto.types.LLVector4;

public class VertexData {
    public LLVector4 Normal;
    public LLVector4 Position;
    public LLVector2 TexCoord;

    public static VertexData LerpPlanarVertex(VertexData vertexData, VertexData vertexData2, VertexData vertexData3, float f, float f2) {
        LLVector4 sub = LLVector4.sub(vertexData2.Position, vertexData.Position);
        sub.mul(f);
        LLVector4 vector4 = LLVector4.sub(vertexData3.Position, vertexData.Position);
        vector4.mul(f2);
        vector4.add(sub);
        vector4.add(vertexData.Position);
        VertexData vertexData4 = new VertexData();
        vertexData4.Position = vector4;
        if (vertexData.Normal != null) {
            vertexData4.Normal = new LLVector4(vertexData.Normal);
        }
        LLVector2 vector2 = LLVector2.sub(vertexData2.TexCoord, vertexData.TexCoord);
        vector2.mul(f);
        LLVector2 vector24 = LLVector2.sub(vertexData3.TexCoord, vertexData.TexCoord);
        vector24.mul(f2);
        LLVector2 vector25 = new LLVector2(vertexData.TexCoord);
        vector25.add(vector2);
        vector25.add(vector24);
        vertexData4.TexCoord = vector25;
        return vertexData4;
    }
}
