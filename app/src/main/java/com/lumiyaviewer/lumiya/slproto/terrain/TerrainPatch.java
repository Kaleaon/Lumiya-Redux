package com.lumiyaviewer.lumiya.slproto.terrain;

import com.lumiyaviewer.lumiya.utils.BitBuffer;

public class TerrainPatch {
    public static final int END_OF_PATCHES = 97;
    float DCOffset;
    int PatchIDs;
    int QuantWBits;
    int Range;
    int WordBits;
    public float[] heightMap;
    int[] patches;
    private static float[] DequantizeTable16 = new float[256];
    private static float[] DequantizeTable32 = new float[256];
    private static float[] CosineTable16 = new float[256];
    private static int[] CopyMatrix16 = new int[256];
    private static int[] CopyMatrix32 = new int[256];
    private static float[] QuantizeTable16 = new float[256];
    private static float OO_SQRT2 = 0.70710677f;

    static {
        BuildDequantizeTable16();
        SetupCosines16();
        BuildCopyMatrix16();
        BuildQuantizeTable16();
    }

    private static void BuildCopyMatrix16() {
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        boolean z = true;
        boolean z2 = false;
        while (i3 < 16 && i2 < 16) {
            int i4 = i + 1;
            CopyMatrix16[(i2 * 16) + i3] = i;
            if (z2) {
                if (z) {
                    i3++;
                    i2--;
                    if (i3 == 15 || i2 == 0) {
                        z2 = false;
                    }
                } else {
                    i3--;
                    i2++;
                    if (i2 == 15 || i3 == 0) {
                        z2 = false;
                    }
                }
            } else if (z) {
                if (i3 < 15) {
                    i3++;
                } else {
                    i2++;
                }
                z = false;
                z2 = true;
            } else {
                if (i2 < 15) {
                    i2++;
                } else {
                    i3++;
                }
                z = true;
                z2 = true;
            }
            i = i4;
        }
    }

    private static void BuildDequantizeTable16() {
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                DequantizeTable16[(i * 16) + j] = ((j + i) * 2.0f) + 1.0f;
            }
        }
    }

    private static void BuildQuantizeTable16() {
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                QuantizeTable16[(i * 16) + j] = 1.0f / (((j + i) * 2.0f) + 1.0f);
            }
        }
    }

    public static TerrainPatch DecompressPatch(BitBuffer bitBuffer, int i) {
        int bits = bitBuffer.getBits(8);
        if (bits == 97) {
            return null;
        }
        TerrainPatch terrainPatch = new TerrainPatch();
        terrainPatch.QuantWBits = bits;
        terrainPatch.DCOffset = bitBuffer.getFloat();
        terrainPatch.Range = bitBuffer.getBits(16);
        terrainPatch.PatchIDs = bitBuffer.getBits(10);
        terrainPatch.WordBits = (bits & 15) + 2;
        terrainPatch.patches = new int[i * i];
        int i2 = 0;
        while (true) {
            if (i2 >= i * i) {
                break;
            }
            if (bitBuffer.getBits(1) == 0) {
                terrainPatch.patches[i2] = 0;
            } else if (bitBuffer.getBits(1) == 0) {
                while (i2 < i * i) {
                    terrainPatch.patches[i2] = 0;
                    i2++;
                }
            } else if (bitBuffer.getBits(1) != 0) {
                terrainPatch.patches[i2] = bitBuffer.getBits(terrainPatch.WordBits) * (-1);
            } else {
                terrainPatch.patches[i2] = bitBuffer.getBits(terrainPatch.WordBits);
            }
            i2++;
        }
        float[] floats = new float[i * i];
        float[] floats2 = new float[i * i];
        int i3 = (terrainPatch.QuantWBits >> 4) + 2;
        float f = (1.0f / (1 << i3)) * terrainPatch.Range;
        float f2 = terrainPatch.DCOffset + ((1 << (i3 - 1)) * f);
        if (i == 16) {
            for (int j = 0; j < 256; j++) {
                floats[j] = terrainPatch.patches[CopyMatrix16[j]] * DequantizeTable16[j];
            }
            float[] floats3 = new float[256];
            for (int k = 0; k < 16; k++) {
                IDCTColumn16(floats, floats3, k);
            }
            for (int m = 0; m < 16; m++) {
                IDCTLine16(floats3, floats, m);
            }
        } else {
            for (int n = 0; n < 1024; n++) {
                floats[n] = terrainPatch.patches[CopyMatrix32[n]] * DequantizeTable32[n];
            }
        }
        for (int i8 = 0; i8 < floats.length; i8++) {
            floats2[i8] = (floats[i8] * f) + f2;
        }
        terrainPatch.heightMap = floats2;
        return terrainPatch;
    }

    private static void IDCTColumn16(float[] floats, float[] floats2, int i) {
        for (int j = 0; j < 16; j++) {
            float f = floats[i] * OO_SQRT2;
            for (int k = 1; k < 16; k++) {
                int i4 = k * 16;
                f += CosineTable16[i4 + j] * floats[i4 + i];
            }
            floats2[(j * 16) + i] = f;
        }
    }

    private static void IDCTLine16(float[] floats, float[] floats2, int i) {
        int i2 = i * 16;
        for (int j = 0; j < 16; j++) {
            float f = floats[i2] * OO_SQRT2;
            for (int k = 1; k < 16; k++) {
                f += floats[i2 + k] * CosineTable16[(k * 16) + j];
            }
            floats2[i2 + j] = f * 0.125f;
        }
    }

    private static void SetupCosines16() {
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                CosineTable16[(i * 16) + j] = (float) Math.cos(((j * 2.0f) + 1.0f) * i * 0.09817477f);
            }
        }
    }

    public int getX() {
        return this.PatchIDs >> 5;
    }

    public int getY() {
        return this.PatchIDs & 31;
    }
}
