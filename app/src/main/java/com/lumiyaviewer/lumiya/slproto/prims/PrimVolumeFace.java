package com.lumiyaviewer.lumiya.slproto.prims;

import com.lumiyaviewer.lumiya.slproto.prims.PrimPath;
import com.lumiyaviewer.lumiya.slproto.types.LLVector2;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.types.Vector2Array;
import com.lumiyaviewer.lumiya.slproto.types.Vector3Array;
import com.lumiyaviewer.lumiya.slproto.types.VertexArray;
import java.util.ArrayList;

public class PrimVolumeFace {
    public static final int BOTTOM_MASK = 1024;
    public static final int CAP_MASK = 2;
    public static final int END_MASK = 4;
    public static final int FLAT_MASK = 256;
    public static final int HOLLOW_MASK = 64;
    public static final int INNER_MASK = 16;
    public static final int OPEN_MASK = 128;
    public static final int OUTER_MASK = 32;
    public static final int SIDE_MASK = 8;
    public static final int SINGLE_MASK = 1;
    public static final int TOP_MASK = 512;
    public int BeginS;
    public int BeginT;
    public LLVector3 Center;
    public int[] Edge;
    public int ID;
    public short[] Indices;
    public Vector3Array Normals;
    public int NumIndices;
    public int NumS;
    public int NumT;
    public int NumVertices;
    public Vector3Array Positions;
    public Vector2Array TexCoords;
    public int TypeMask;
    public VertexArray vertexArray;
    public LLVector2[] TexCoordExtents = {new LLVector2(), new LLVector2()};
    public LLVector3[] Extents = {new LLVector3(), new LLVector3()};

    private boolean createCap(PrimVolume primVolume) {
        int i;
        boolean z;
        boolean z2;
        if ((this.TypeMask & 64) == 0 && (this.TypeMask & 128) == 0 && primVolume.volumeParams.PathParams.Begin == 0.0f && primVolume.volumeParams.PathParams.End == 1.0f && primVolume.getProfileType() == 1 && primVolume.getPathType() == 16) {
            return createUnCutCubeCap(primVolume);
        }
        Vector3Array vector3Array = primVolume.Mesh;
        ArrayList<LLVector3> arrayList = primVolume.Profile.Profile;
        int size = arrayList.size();
        int size2 = (arrayList.size() - 2) * 3;
        if ((this.TypeMask & 64) == 0 && (this.TypeMask & 128) == 0) {
            resizeVertices(size + 1);
            resizeIndices(size2 + 3);
        } else {
            resizeVertices(size);
            resizeIndices(size2);
        }
        int size3 = (this.TypeMask & 512) != 0 ? primVolume.Profile.Total * (primVolume.Path.Path.size() - 1) : this.BeginS;
        LLVector2 vector2 = new LLVector2();
        LLVector2 vector23 = new LLVector2();
        LLVector3 vector3 = this.Extents[0];
        LLVector3 vector32 = this.Extents[1];
        Vector2Array vector2Array = this.TexCoords;
        Vector3Array vector3Array2 = this.Positions;
        Vector3Array vector3Array3 = this.Normals;
        for (int j = 0; j < size; j++) {
            if ((this.TypeMask & 512) != 0) {
                vector2Array.set(j, 0.5f + arrayList.get(j).x, arrayList.get(j).y + 0.5f);
            } else {
                vector2Array.set(j, 0.5f + arrayList.get(j).x, 0.5f - arrayList.get(j).y);
            }
            vector3Array2.set(j, vector3Array, j + size3);
            if (j == 0) {
                vector3Array2.get(j, vector3);
                vector3Array2.get(j, vector32);
                vector2Array.get(j, vector2);
                vector2Array.get(j, vector23);
            } else {
                vector3Array2.minMaxVector(j, vector3, vector32);
                vector2Array.minMaxVector(j, vector2, vector23);
            }
        }
        this.Center = new LLVector3(vector3);
        this.Center.add(vector32);
        this.Center.mul(0.5f);
        LLVector2 sum = LLVector2.sum(vector2, vector23);
        sum.mul(0.5f);
        LLVector3 vector33 = new LLVector3(this.Center);
        LLVector3 vector34 = new LLVector3(this.Center);
        vector3Array2.subFromVector(vector33, 0);
        vector3Array2.subFromVector(vector34, 1);
        LLVector3 cross = (this.TypeMask & 512) != 0 ? LLVector3.cross(vector33, vector34) : LLVector3.cross(vector34, vector33);
        cross.normVec();
        if ((this.TypeMask & 64) == 0 && (this.TypeMask & 128) == 0) {
            vector3Array2.set(size, this.Center);
            vector2Array.set(size, sum.x, sum.y);
            i = size + 1;
        } else {
            i = size;
        }
        vector3Array3.fill(0, i, cross);
        if ((this.TypeMask & 64) == 0) {
            int i3 = 2;
            int i4 = 1;
            if ((this.TypeMask & 512) != 0) {
                i3 = 1;
                i4 = 2;
            }
            for (int k = 0; k < i - 2; k++) {
                this.Indices[k * 3] = (short) (i - 1);
                this.Indices[(k * 3) + i3] = (short) k;
                this.Indices[(k * 3) + i4] = (short) (k + 1);
            }
            return true;
        }
        if ((this.TypeMask & 512) != 0) {
            int i6 = 0;
            int i7 = i - 1;
            int i8 = 0;
            while (true) {
                int i9 = i8;
                if (i7 - i6 <= 1) {
                    return true;
                }
                LLVector3 vector35 = new LLVector3(arrayList.get(i6));
                LLVector3 vector36 = new LLVector3(arrayList.get(i7));
                LLVector3 vector37 = new LLVector3(arrayList.get(i6 + 1));
                LLVector3 vector38 = new LLVector3(arrayList.get(i7 - 1));
                vector35.z = 0.0f;
                vector36.z = 0.0f;
                vector37.z = 0.0f;
                vector38.z = 0.0f;
                float f = ((vector35.x * vector37.y) - (vector37.x * vector35.y)) + ((vector37.x * vector36.y) - (vector36.x * vector37.y)) + ((vector36.x * vector35.y) - (vector35.x * vector36.y));
                float f2 = ((vector35.x * vector38.y) - (vector38.x * vector35.y)) + ((vector38.x * vector37.y) - (vector37.x * vector38.y)) + ((vector37.x * vector35.y) - (vector35.x * vector37.y));
                float f3 = ((vector36.x * vector35.y) - (vector35.x * vector36.y)) + ((vector35.x * vector38.y) - (vector38.x * vector35.y)) + ((vector38.x * vector36.y) - (vector36.x * vector38.y));
                float f4 = ((vector36.x * vector37.y) - (vector37.x * vector36.y)) + ((vector37.x * vector38.y) - (vector38.x * vector37.y)) + ((vector38.x * vector36.y) - (vector36.x * vector38.y));
                boolean z3 = f >= 0.0f;
                if (f4 < 0.0f) {
                    z3 = false;
                }
                boolean z4 = f3 >= 0.0f;
                if (f2 < 0.0f) {
                    z4 = false;
                }
                if (!z3) {
                    z2 = false;
                } else if (z4) {
                    z2 = LLVector3.sub(vector35, vector37).magVecSquared() < LLVector3.sub(vector36, vector38).magVecSquared();
                } else {
                    z2 = true;
                }
                if (z2) {
                    int i10 = i9 + 1;
                    this.Indices[i9] = (short) i6;
                    int i11 = i10 + 1;
                    this.Indices[i10] = (short) (i6 + 1);
                    i8 = i11 + 1;
                    this.Indices[i11] = (short) i7;
                    i6++;
                } else {
                    int i12 = i9 + 1;
                    this.Indices[i9] = (short) i6;
                    int i13 = i12 + 1;
                    this.Indices[i12] = (short) (i7 - 1);
                    i8 = i13 + 1;
                    this.Indices[i13] = (short) i7;
                    i7--;
                }
            }
        } else {
            int i14 = 0;
            int i15 = i - 1;
            int i16 = 0;
            while (true) {
                int i17 = i16;
                if (i15 - i14 <= 1) {
                    return true;
                }
                LLVector3 vector39 = new LLVector3(arrayList.get(i14));
                LLVector3 lLVector310 = new LLVector3(arrayList.get(i15));
                LLVector3 lLVector311 = new LLVector3(arrayList.get(i14 + 1));
                LLVector3 lLVector312 = new LLVector3(arrayList.get(i15 - 1));
                vector39.z = 0.0f;
                lLVector310.z = 0.0f;
                lLVector311.z = 0.0f;
                lLVector312.z = 0.0f;
                float f5 = ((vector39.x * lLVector311.y) - (lLVector311.x * vector39.y)) + ((lLVector311.x * lLVector310.y) - (lLVector310.x * lLVector311.y)) + ((lLVector310.x * vector39.y) - (vector39.x * lLVector310.y));
                float f6 = ((vector39.x * lLVector312.y) - (lLVector312.x * vector39.y)) + ((lLVector312.x * lLVector311.y) - (lLVector311.x * lLVector312.y)) + ((lLVector311.x * vector39.y) - (vector39.x * lLVector311.y));
                float f7 = ((lLVector310.x * vector39.y) - (vector39.x * lLVector310.y)) + ((vector39.x * lLVector312.y) - (lLVector312.x * vector39.y)) + ((lLVector312.x * lLVector310.y) - (lLVector310.x * lLVector312.y));
                float f8 = ((lLVector310.x * lLVector311.y) - (lLVector311.x * lLVector310.y)) + ((lLVector311.x * lLVector312.y) - (lLVector312.x * lLVector311.y)) + ((lLVector312.x * lLVector310.y) - (lLVector310.x * lLVector312.y));
                boolean z5 = f5 >= 0.0f;
                if (f8 < 0.0f) {
                    z5 = false;
                }
                boolean z6 = f7 >= 0.0f;
                if (f6 < 0.0f) {
                    z6 = false;
                }
                if (!z5) {
                    z = false;
                } else if (z6) {
                    z = LLVector3.sub(vector39, lLVector311).magVecSquared() < LLVector3.sub(lLVector310, lLVector312).magVecSquared();
                } else {
                    z = true;
                }
                if (z) {
                    int i18 = i17 + 1;
                    this.Indices[i17] = (short) i14;
                    int i19 = i18 + 1;
                    this.Indices[i18] = (short) i15;
                    i16 = i19 + 1;
                    this.Indices[i19] = (short) (i14 + 1);
                    i14++;
                } else {
                    int i20 = i17 + 1;
                    this.Indices[i17] = (short) i14;
                    int i21 = i20 + 1;
                    this.Indices[i20] = (short) i15;
                    i16 = i21 + 1;
                    this.Indices[i21] = (short) (i15 - 1);
                    i15--;
                }
            }
        }
    }

    private boolean createSide(PrimVolume primVolume) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        boolean z = (this.TypeMask & 256) != 0;
        byte b = primVolume.volumeParams.SculptType;
        byte b2 = (byte) (b & 7);
        boolean z2 = (b & 64) != 0;
        boolean z3 = (b & Byte.MIN_VALUE) != 0;
        boolean z4 = z2 ? !z3 : z3;
        Vector3Array vector3Array = primVolume.Mesh;
        ArrayList<LLVector3> arrayList = primVolume.Profile.Profile;
        ArrayList<PrimPath.PathPoint> arrayList2 = primVolume.Path.Path;
        int i6 = primVolume.Profile.Total;
        int i7 = (this.NumS - 1) * (this.NumT - 1) * 6;
        resizeVertices(this.NumS * this.NumT);
        resizeIndices(i7);
        this.Edge = new int[i7];
        Vector3Array vector3Array2 = this.Positions;
        Vector3Array vector3Array3 = this.Normals;
        Vector2Array vector2Array = this.TexCoords;
        int floor = (int) Math.floor(arrayList.get(this.BeginS).z);
        int i8 = ((this.TypeMask & 16) == 0 || (this.TypeMask & 256) == 0 || this.NumS <= 2) ? this.NumS : this.NumS / 2;
        int i9 = this.BeginT;
        int i10 = 0;
        while (true) {
            int i11 = i9;
            if (i11 >= this.BeginT + this.NumT) {
                break;
            }
            float f = arrayList2.get(i11).TexT;
            int i12 = 0;
            int i13 = i10;
            while (i12 < i8) {
                float f2 = ((this.TypeMask & 4) != 0 || this.BeginS + i12 >= arrayList.size()) ? i12 != 0 ? 1.0f : 0.0f : !z ? arrayList.get(this.BeginS + i12).z : arrayList.get(this.BeginS + i12).z - floor;
                if (z4) {
                    f2 = 1.0f - f2;
                }
                int i14 = this.BeginS + i12 >= i6 ? this.BeginS + i12 + ((i11 - 1) * i6) : this.BeginS + i12 + (i6 * i11);
                vector3Array2.set(i13, vector3Array, i14);
                vector2Array.set(i13, f2, f);
                int i15 = i13 + 1;
                if ((this.TypeMask & 16) == 0 || (this.TypeMask & 256) == 0 || this.NumS <= 2 || i12 <= 0) {
                    i5 = i15;
                } else {
                    vector3Array2.set(i15, vector3Array, i14);
                    vector2Array.set(i15, f2, f);
                    i5 = i15 + 1;
                }
                i12++;
                i13 = i5;
            }
            if ((this.TypeMask & 16) == 0 || (this.TypeMask & 256) == 0 || this.NumS <= 2) {
                i10 = i13;
            } else {
                int i16 = (this.TypeMask & 128) != 0 ? i8 - 1 : 0;
                int i17 = this.BeginS + i16 + (i6 * i11);
                float f3 = this.BeginS + i16 < arrayList.size() ? arrayList.get(i16 + this.BeginS).z - floor : i16 != 0 ? 1.0f : 0.0f;
                vector3Array2.set(i13, vector3Array, i17);
                vector2Array.set(i13, f3, f);
                i10 = i13 + 1;
            }
            i9 = i11 + 1;
        }
        LLVector3 vector3 = this.Extents[0];
        LLVector3 vector39 = this.Extents[1];
        vector3Array2.get(0, vector3);
        vector3Array2.get(0, vector39);
        vector3Array2.minMaxVector(vector3, vector39);
        this.Center = new LLVector3(vector3);
        this.Center.add(vector39);
        this.Center.mul(0.5f);
        int i18 = 0;
        int i19 = 0;
        boolean z5 = (this.TypeMask & 256) != 0;
        for (int j = 0; j < this.NumT - 1; j++) {
            for (int k = 0; k < this.NumS - 1; k++) {
                int i22 = i18 + 1;
                this.Indices[i18] = (short) ((this.NumS * j) + k);
                int i23 = i22 + 1;
                this.Indices[i22] = (short) (k + 1 + (this.NumS * (j + 1)));
                int i24 = i23 + 1;
                this.Indices[i23] = (short) ((this.NumS * (j + 1)) + k);
                int i25 = i24 + 1;
                this.Indices[i24] = (short) ((this.NumS * j) + k);
                int i26 = i25 + 1;
                this.Indices[i25] = (short) (k + 1 + (this.NumS * j));
                i18 = i26 + 1;
                this.Indices[i26] = (short) (k + 1 + (this.NumS * (j + 1)));
                int i27 = i19 + 1;
                this.Edge[i19] = ((this.NumS - 1) * 2 * j) + (k * 2) + 1;
                if (j < this.NumT - 2) {
                    this.Edge[i27] = ((this.NumS - 1) * 2 * (j + 1)) + (k * 2) + 1;
                    i = i27 + 1;
                } else if (this.NumT <= 3 || primVolume.Path.Open) {
                    this.Edge[i27] = -1;
                    i = i27 + 1;
                } else {
                    this.Edge[i27] = (k * 2) + 1;
                    i = i27 + 1;
                }
                if (k > 0) {
                    this.Edge[i] = ((((this.NumS - 1) * 2) * j) + (k * 2)) - 1;
                    i2 = i + 1;
                } else if (z5 || primVolume.Path.Open) {
                    this.Edge[i] = -1;
                    i2 = i + 1;
                } else {
                    this.Edge[i] = ((this.NumS - 1) * 2 * j) + ((this.NumS - 2) * 2) + 1;
                    i2 = i + 1;
                }
                if (j > 0) {
                    i3 = i2 + 1;
                    this.Edge[i2] = ((this.NumS - 1) * 2 * (j - 1)) + (k * 2);
                } else if (this.NumT <= 3 || primVolume.Path.Open) {
                    i3 = i2 + 1;
                    this.Edge[i2] = -1;
                } else {
                    i3 = i2 + 1;
                    this.Edge[i2] = ((this.NumS - 1) * 2 * (this.NumT - 2)) + (k * 2);
                }
                if (k < this.NumS - 2) {
                    i4 = i3 + 1;
                    this.Edge[i3] = ((this.NumS - 1) * 2 * j) + ((k + 1) * 2);
                } else if (z5 || primVolume.Path.Open) {
                    i4 = i3 + 1;
                    this.Edge[i3] = -1;
                } else {
                    i4 = i3 + 1;
                    this.Edge[i3] = (this.NumS - 1) * 2 * j;
                }
                i19 = i4 + 1;
                this.Edge[i4] = ((this.NumS - 1) * 2 * j) + (k * 2);
            }
        }
        this.Normals.clear();
        LLVector3[] vector3s = new LLVector3[3];
        short[] sArr = new short[3];
        for (int m = 0; m < 3; m++) {
            vector3s[m] = new LLVector3();
        }
        LLVector3 vector33 = new LLVector3();
        LLVector3 vector34 = new LLVector3();
        for (int n = 0; n < this.NumIndices / 3; n++) {
            for (int i30 = 0; i30 < 3; i30++) {
                sArr[i30] = this.Indices[(n * 3) + i30];
                vector3Array2.get(sArr[i30], vector3s[i30]);
            }
            vector33.setSub(vector3s[0], vector3s[1]);
            vector34.setSub(vector3s[0], vector3s[2]);
            vector33.setCross(vector34);
            for (int i31 = 0; i31 < 3; i31++) {
                this.Normals.add(sArr[i31], vector33);
            }
            this.Normals.add(sArr[(n & 1) + 1], vector33);
        }
        LLVector3 vector35 = new LLVector3();
        LLVector3 vector36 = new LLVector3();
        LLVector3 vector37 = new LLVector3();
        vector3Array2.get(0, vector36);
        vector3Array2.get(this.NumS * (this.NumT - 2), vector37);
        vector35.setSub(vector36, vector37);
        boolean z6 = vector35.dot(vector35) < 1.0E-6f;
        vector3Array2.get(this.NumS - 1, vector36);
        vector3Array2.get(((this.NumS * (this.NumT - 2)) + this.NumS) - 1, vector37);
        vector35.setSub(vector36, vector37);
        boolean z7 = vector35.dot(vector35) < 1.0E-6f;
        if (b2 == 0) {
            if (!primVolume.Path.Open) {
                for (int i32 = 0; i32 < this.NumS; i32++) {
                    vector3Array3.setAdd(i32, (this.NumS * (this.NumT - 1)) + i32);
                }
            }
            if (!primVolume.Path.Open && (!z6)) {
                for (int i33 = 0; i33 < this.NumT; i33++) {
                    vector3Array3.setAdd(this.NumS * i33, ((this.NumS * i33) + this.NumS) - 1);
                }
            }
            if (primVolume.getPathType() != 32 || (primVolume.getProfileType() & 15) != 5) {
                return true;
            }
            if (z6) {
                for (int i34 = 0; i34 < this.NumT; i34++) {
                    vector3Array3.set(this.NumS * i34, 1.0f, 0.0f, 0.0f);
                }
            }
            if (!z7) {
                return true;
            }
            for (int i35 = 0; i35 < this.NumT; i35++) {
                vector3Array3.set(((this.NumS * i35) + this.NumS) - 1, -1.0f, 0.0f, 0.0f);
            }
            return true;
        }
        boolean z8 = b2 == 1;
        boolean z9 = b2 == 1 || b2 == 2 || b2 == 4;
        boolean z10 = b2 == 2;
        if (z8) {
            LLVector3 vector38 = new LLVector3();
            for (int i36 = 0; i36 < this.NumS; i36++) {
                vector3Array3.addToVector(i36, vector38);
            }
            for (int i37 = 0; i37 < this.NumS; i37++) {
                vector3Array3.set(i37, vector38);
            }
            vector38.set(0.0f, 0.0f, 0.0f);
            for (int i38 = 0; i38 < this.NumS; i38++) {
                vector3Array3.addToVector((this.NumS * (this.NumT - 1)) + i38, vector38);
            }
            for (int i39 = 0; i39 < this.NumS; i39++) {
                vector3Array3.set((this.NumS * (this.NumT - 1)) + i39, vector38);
            }
        }
        if (z9) {
            for (int i40 = 0; i40 < this.NumT; i40++) {
                vector3Array3.setAdd(this.NumS * i40, ((this.NumS * i40) + this.NumS) - 1);
            }
        }
        if (!z10) {
            return true;
        }
        for (int i41 = 0; i41 < this.NumS; i41++) {
            vector3Array3.setAdd(i41, (this.NumS * (this.NumT - 1)) + i41);
        }
        return true;
    }

    private boolean createUnCutCubeCap(PrimVolume primVolume) {
        int i;
        Vector3Array vector3Array = primVolume.Mesh;
        ArrayList<LLVector3> arrayList = primVolume.Profile.Profile;
        int i2 = primVolume.Profile.Total;
        int size = primVolume.Path.Path.size();
        int size2 = (arrayList.size() - 1) / 4;
        LLVector3 vector3 = this.Extents[0];
        LLVector3 vector37 = this.Extents[1];
        int i3 = (this.TypeMask & 512) != 0 ? i2 * (size - 1) : this.BeginS;
        VertexArray vertexArray = new VertexArray(4);
        LLVector3 vector38 = new LLVector3();
        Vector3Array vertices = vertexArray.getVertices();
        Vector2Array texCoords = vertexArray.getTexCoords();
        int i4 = 0;
        while (true) {
            int i5 = i4;
            if (i5 >= 4) {
                break;
            }
            vertices.set(i5, vector3Array, (size2 * i5) + i3);
            texCoords.set(i5, 0.5f + arrayList.get(size2 * i5).x, 0.5f - arrayList.get(size2 * i5).y);
            i4 = i5 + 1;
        }
        LLVector3 vector39 = new LLVector3();
        vertices.getSub(1, 0, vector38);
        vertices.getSub(2, 1, vector39);
        vector38.setCross(vector39);
        vector38.normVec();
        if ((this.TypeMask & 512) == 0) {
            vector38.mul(-1.0f);
        } else {
            texCoords.swap(0, 3);
            texCoords.swap(1, 2);
        }
        resizeVertices((size2 + 1) * (size2 + 1));
        Vector3Array vector3Array2 = this.Positions;
        int i6 = 0;
        LLVector3 vector35 = new LLVector3();
        LLVector3 vector36 = new LLVector3();
        LLVector2 vector2 = new LLVector2();
        LLVector2 vector23 = new LLVector2();
        for (int j = 0; j < size2 + 1; j++) {
            for (int k = 0; k < size2 + 1; k++) {
                    this.vertexArray.LerpPlanarVertex(i6, vertexArray, 0, vertexArray, 1, vertexArray, 3, j / size2, k / size2, vector35, vector36, vector2, vector23);
                    this.vertexArray.getNormals().set(i6, vector38);
                    if (j == 0 && k == 0) {
                        vector3Array2.get(i6, vector3);
                        vector3Array2.get(i6, vector37);
                    } else {
                        vector3Array2.minMaxVector(i6, vector3, vector37);
                    }
                    i6++;
            }
        }
        this.Center = new LLVector3(vector3);
        this.Center.add(vector37);
        this.Center.mul(0.5f);
        resizeIndices(size2 * size2 * 6);
        short[] sArr = this.Indices;
        short[] sArr2 = {0, 1, (short) (size2 + 1 + 1), (short) (size2 + 1 + 1), (short) (size2 + 1), 0};
        int i11 = 0;
        int i12 = 0;
        while (true) {
            int i13 = i12;
            if (i13 >= size2) {
                return true;
            }
            int i14 = 0;
            while (i14 < size2) {
                if ((this.TypeMask & 512) != 0) {
                    i = i11;
                    int i15 = 5;
                    while (i15 >= 0) {
                        sArr[i] = (short) (((size2 + 1) * i14) + i13 + sArr2[i15]);
                        i15--;
                        i++;
                    }
                } else {
                    i = i11;
                    int i16 = 0;
                    while (i16 < 6) {
                        sArr[i] = (short) (((size2 + 1) * i14) + i13 + sArr2[i16]);
                        i16++;
                        i++;
                    }
                }
                i14++;
                i11 = i;
            }
            i12 = i13 + 1;
        }
    }

    private void resizeIndices(int i) {
        if (i != this.NumIndices) {
            if (i != 0) {
                this.Indices = new short[i];
            } else {
                this.Indices = null;
            }
            this.NumIndices = i;
        }
    }

    private void resizeVertices(int i) {
        if (this.NumVertices != i) {
            if (i != 0) {
                this.vertexArray = new VertexArray(i);
                this.Positions = this.vertexArray.getVertices();
                this.Normals = this.vertexArray.getNormals();
                this.TexCoords = this.vertexArray.getTexCoords();
            } else {
                this.Positions = null;
                this.Normals = null;
                this.TexCoords = null;
                this.vertexArray = null;
            }
            this.NumVertices = i;
        }
    }

    public boolean create(PrimVolume primVolume) {
        boolean createCap = (this.TypeMask & 2) != 0 ? createCap(primVolume) : ((this.TypeMask & 4) == 0 && (this.TypeMask & 8) == 0) ? false : createSide(primVolume);
        if (createCap) {
            this.TexCoordExtents[0] = new LLVector2(1.0f, 1.0f);
            this.TexCoordExtents[1] = new LLVector2(0.0f, 0.0f);
            this.TexCoords.minMaxVector(this.TexCoordExtents[0], this.TexCoordExtents[1]);
            this.TexCoordExtents[0].x = Math.max(0.0f, this.TexCoordExtents[0].x);
            this.TexCoordExtents[0].y = Math.max(0.0f, this.TexCoordExtents[0].y);
            this.TexCoordExtents[1].x = Math.min(1.0f, this.TexCoordExtents[1].x);
            this.TexCoordExtents[1].y = Math.min(1.0f, this.TexCoordExtents[1].y);
        }
        return createCap;
    }
}
