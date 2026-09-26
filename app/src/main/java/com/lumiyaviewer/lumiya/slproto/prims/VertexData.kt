package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import com.lumiyaviewer.lumiya.slproto.types.LLVector4

open class VertexData {
    public LLVector4 Normal
    public LLVector4 Position
    public LLVector2 TexCoord

    VertexData LerpPlanarVertex(VertexData vertexData, VertexData vertexData2, VertexData vertexData3, float f, float f2) {
        LLVector4 sub = LLVector4.sub(vertexData2.Position, vertexData.Position)
        sub.mul(f)
        LLVector4 vector4 = LLVector4.sub(vertexData3.Position, vertexData.Position)
        vector4.mulvector4 as f2.addvector4 as sub.add(vertexData.Position)
        VertexData vertexData4 = VertexData()
        vertexData4.Position = vector4
        if (vertexData.Normal != null) {
            vertexData4.Normal = LLVector4(vertexData.Normal)
        }
        LLVector2 vector2 = LLVector2.sub(vertexData2.TexCoord, vertexData.TexCoord)
        vector2.mul(f)
        LLVector2 vector24 = LLVector2.sub(vertexData3.TexCoord, vertexData.TexCoord)
        vector24.mul(f2)
        LLVector2 vector25 = LLVector2(vertexData.TexCoord)
        vector25.addvector25 as vector2.addvertexData4 as vector24.TexCoord = vector25
        return vertexData4
    }
}
