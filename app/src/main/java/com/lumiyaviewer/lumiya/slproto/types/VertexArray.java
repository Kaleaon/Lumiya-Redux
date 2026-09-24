package com.lumiyaviewer.lumiya.slproto.types;

public class VertexArray {
    private Vector3Array normals;
    private Vector2Array texCoords;
    private VectorArray vertexAndNormalsData;
    private Vector3Array vertices;

    public VertexArray(int i) {
        this.vertexAndNormalsData = new VectorArray(6, i);
        this.vertices = new Vector3Array(this.vertexAndNormalsData, 0);
        this.normals = new Vector3Array(this.vertexAndNormalsData, 3);
        this.texCoords = new Vector2Array(i);
    }

    public void LerpPlanarVertex(int i, VertexArray vertexArray, int i2, VertexArray vertexArray2, int i3, VertexArray vertexArray3, int i4, float f, float f2, LLVector3 vector3, LLVector3 vector33, LLVector2 vector2, LLVector2 vector23) {
        vertexArray2.vertices.getSub(i3, vertexArray.vertices, i2, vector3);
        vector3.mul(f);
        vertexArray3.vertices.getSub(i4, vertexArray.vertices, i2, vector33);
        vector33.mul(f2);
        vector33.add(vector3);
        vertexArray.vertices.addToVector(i2, vector33);
        this.vertices.set(i, vector33);
        this.normals.set(i, vertexArray.normals, i2);
        vertexArray2.texCoords.getSub(i3, vertexArray.texCoords, i2, vector2);
        vector2.mul(f);
        vertexArray3.texCoords.getSub(i4, vertexArray.texCoords, i2, vector23);
        vector23.mul(f2);
        vector23.add(vector2);
        vertexArray.texCoords.addToVector(i2, vector23);
        this.texCoords.set(i, vector23.x, vector23.y);
    }

    public float[] getData() {
        return this.vertexAndNormalsData.getData();
    }

    public int getLength() {
        return this.vertexAndNormalsData.getLength();
    }

    public Vector3Array getNormals() {
        return this.normals;
    }

    public Vector2Array getTexCoords() {
        return this.texCoords;
    }

    public float[] getTexCoordsData() {
        return this.texCoords.getData();
    }

    public Vector3Array getVertices() {
        return this.vertices;
    }
}
