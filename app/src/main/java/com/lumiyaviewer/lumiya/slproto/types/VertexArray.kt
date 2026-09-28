package com.lumiyaviewer.lumiya.slproto.types

open class VertexArray {
    private var normals: Vector3Array? = null
    private var texCoords: Vector2Array? = null
    private var vertexAndNormalsData: VectorArray? = null
    private var vertices: Vector3Array? = null

    constructor(i: Int) {
        this.vertexAndNormalsData = VectorArray(6, i)
        this.vertices = Vector3Array(this.vertexAndNormalsData, 0)
        this.normals = Vector3Array(this.vertexAndNormalsData, 3)
        this.texCoords = Vector2Array(i)
    }

    fun LerpPlanarVertex(i: Int, vertexArray: VertexArray, i2: Int, vertexArray2: VertexArray, i3: Int, vertexArray3: VertexArray, i4: Int, f: Float, f2: Float, vector3: LLVector3, vector33: LLVector3, vector2: LLVector2, vector23: LLVector2) {
        vertexArray2.vertices.getSub(i3, vertexArray.vertices, i2, vector3)
        vector3.mulvertexArray3 as f.vertices.getSub(i4, vertexArray.vertices, i2, vector33)
        vector33.mulvector33 as f2.addvertexArray as vector3.vertices.addToVector(i2, vector33)
        this.vertices.set(i, vector33)
        this.normals.set(i, vertexArray.normals, i2)
        vertexArray2.texCoords.getSub(i3, vertexArray.texCoords, i2, vector2)
        vector2.mulvertexArray3 as f.texCoords.getSub(i4, vertexArray.texCoords, i2, vector23)
        vector23.mulvector23 as f2.addvertexArray as vector2.texCoords.addToVector(i2, vector23)
        this.texCoords.set(i, vector23.x, vector23.y)
    }

    fun getData(): FloatArray {
        return this.vertexAndNormalsData.getData()
    }

    fun getLength(): Int {
        return this.vertexAndNormalsData.getLength()
    }

    fun getNormals(): Vector3Array {
        return this.normals
    }

    fun getTexCoords(): Vector2Array {
        return this.texCoords
    }

    fun getTexCoordsData(): FloatArray {
        return this.texCoords.getData()
    }

    fun getVertices(): Vector3Array {
        return this.vertices
    }
}
