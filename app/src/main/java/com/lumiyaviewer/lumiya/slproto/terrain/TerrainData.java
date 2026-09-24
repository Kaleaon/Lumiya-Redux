package com.lumiyaviewer.lumiya.slproto.terrain;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex;
import com.lumiyaviewer.lumiya.slproto.messages.RegionHandshake;
import com.lumiyaviewer.lumiya.utils.BitBuffer;

public class TerrainData {
    /** Terrain vertices along one region edge: 256 one-metre cells + 1 (llsurface.cpp). */
    private static final int REGION_VERTICES_PER_SIDE = 257;
    public static final int PatchesPerEdge = 16;
    public static final int PatchesSize = 16;
    public static final int TerrainPerEdge = 256;
    private final Object vertexLock = new Object();
    private final float[] heightMap = new float[65536];
    private final boolean[] validMap = new boolean[65536];
    private final float[] vertexHeights = new float[66049];
    private final float[] vertexNormals = new float[132098];
    private final boolean[] vertexValids = new boolean[66049];
    private final boolean[] patchDirtyMap = new boolean[256];
    private float waterHeight = 0.0f;
    private boolean waterHeightValid = false;
    private int validCount = 0;
    private volatile TerrainTextures terrainTextures = new TerrainTextures();

    private synchronized void SetWaterHeight(float waterHeight) {
        if (this.waterHeight != waterHeight || (!this.waterHeightValid)) {
            this.waterHeight = waterHeight;
            this.waterHeightValid = true;
            updateEntireTerrain();
        }
    }

    private void markVerticesDirty(int i, int i2, int i3, int i4) {
        int i5 = i / 16;
        int i6 = i2 / 16;
        int i7 = i3 / 16;
        int i8 = i4 / 16;
        synchronized (this.vertexLock) {
            for (int j = i6; j <= i8; j++) {
                for (int k = i5; k <= i7; k++) {
                    if (k >= 0 && k < 16 && j >= 0 && j < 16) {
                        this.patchDirtyMap[(j * 16) + k] = true;
                    }
                }
            }
        }
        for (int m = i6; m <= i8; m++) {
            for (int n = i5; n <= i7; n++) {
                if (n >= 0 && n < 16 && m >= 0 && m < 16) {
                    SpatialIndex.getInstance().updateTerrainPatch(n, m, this);
                }
            }
        }
    }

    private void updateVerticesInRegion(int i, int i2, int i3, int i4) {
        while (i2 <= i4) {
            for (int j = i; j <= i3; j++) {
                int min = Math.min(Math.max(0, j - 1), 255);
                int min2 = Math.min(Math.max(0, i2 - 1), 255);
                int min3 = Math.min(Math.max(0, j), 255);
                int min4 = Math.min(Math.max(0, i2), 255);
                float f = 0.0f;
                int i6 = 0;
                if (min >= 0 && min < 256 && min2 >= 0 && min2 < 256 && this.validMap[(min2 * 256) + min]) {
                    f = 0.0f + this.heightMap[(min2 * 256) + min];
                    i6 = 1;
                }
                if (min3 >= 0 && min3 < 256 && min2 >= 0 && min2 < 256 && this.validMap[(min2 * 256) + min3]) {
                    f += this.heightMap[(min2 * 256) + min3];
                    i6++;
                }
                if (min >= 0 && min < 256 && min4 >= 0 && min4 < 256 && this.validMap[(min4 * 256) + min]) {
                    f += this.heightMap[(min4 * 256) + min];
                    i6++;
                }
                if (min3 >= 0 && min3 < 256 && min4 >= 0 && min4 < 256 && this.validMap[(min4 * 256) + min3]) {
                    f += this.heightMap[(min4 * 256) + min3];
                    i6++;
                }
                if (i6 == 4) {
                    this.vertexHeights[(i2 * REGION_VERTICES_PER_SIDE) + j] = f / i6;
                    float f2 = this.heightMap[(min4 * 256) + min3] - this.heightMap[min + (min4 * 256)];
                    float f3 = this.heightMap[(min4 * 256) + min3] - this.heightMap[(min2 * 256) + min3];
                    this.vertexNormals[((i2 * REGION_VERTICES_PER_SIDE) + j) * 2] = f2;
                    this.vertexNormals[(((i2 * REGION_VERTICES_PER_SIDE) + j) * 2) + 1] = f3;
                    this.vertexValids[(i2 * REGION_VERTICES_PER_SIDE) + j] = true;
                } else {
                    this.vertexValids[(i2 * REGION_VERTICES_PER_SIDE) + j] = false;
                }
            }
            i2++;
        }
    }

    public synchronized void ApplyRegionInfo(RegionHandshake.RegionInfo regionInfo) {
        SetWaterHeight(regionInfo.WaterHeight);
        TerrainTextures terrainTextures = new TerrainTextures(regionInfo);
        if (!terrainTextures.equals(this.terrainTextures)) {
            this.terrainTextures = terrainTextures;
            updateEntireTerrain();
        }
    }

    public void ProcessLayerData(byte[] bytes) {
        TerrainPatch DecompressPatch;
        BitBuffer bitBuffer = new BitBuffer(bytes);
        int bits = bitBuffer.getBits(16);
        int bits2 = bitBuffer.getBits(8);
        Debug.Log(String.format("Terrain: ProcessLayerData: stride 0x%x patchSize 0x%x type 0x%x", Integer.valueOf(bits), Integer.valueOf(bits2), Integer.valueOf(bitBuffer.getBits(8))));
        synchronized (this.vertexLock) {
            while (!bitBuffer.isEOF() && (DecompressPatch = TerrainPatch.DecompressPatch(bitBuffer, bits2)) != null) {
                int x = DecompressPatch.getX();
                int y = DecompressPatch.getY();
                if (x < 16 && y < 16) {
                    for (int i = 0; i < bits2; i++) {
                        int i2 = (y * 16) + i;
                        if (i2 >= 0 && i2 < 256) {
                            for (int j = 0; j < bits2; j++) {
                                int i4 = (x * 16) + j;
                                if (i4 >= 0 && i4 < 256) {
                                    this.heightMap[(i2 * 256) + i4] = DecompressPatch.heightMap[(i * bits2) + j];
                                    if (!this.validMap[(i2 * 256) + i4]) {
                                        this.validCount++;
                                        this.validMap[i4 + (i2 * 256)] = true;
                                    }
                                }
                            }
                        }
                    }
                    markVerticesDirty(x * 16, y * 16, ((x + 1) * 16) + 1, ((y + 1) * 16) + 1);
                }
            }
        }
        Debug.Printf("Terrain: LayerData received, valid count is now %d", Integer.valueOf(this.validCount));
    }

    public TerrainPatchInfo getPatchInfo(int i, int i2) {
        synchronized (this.vertexLock) {
            if (this.patchDirtyMap[(i2 * 16) + i]) {
                this.patchDirtyMap[(i2 * 16) + i] = false;
                updateVerticesInRegion(i * 16, i2 * 16, (i + 1) * 16, (i2 + 1) * 16);
            }
        }
        boolean z = true;
        for (int j = 0; j < 17; j++) {
            int i4 = ((i2 * 16) + j) * REGION_VERTICES_PER_SIDE;
            int i5 = 0;
            while (true) {
                if (i5 >= 17) {
                    break;
                }
                if (!this.vertexValids[i4 + i5 + (i * 16)]) {
                    z = false;
                    break;
                }
                i5++;
            }
        }
        if (!z) {
            return null;
        }
        float[] floats = new float[289];
        float[] floats2 = new float[578];
        int i6 = 0;
        while (true) {
            int i7 = i6;
            if (i7 >= 17) {
                return new TerrainPatchInfo(new TerrainPatchHeightMap(this.waterHeight, floats, floats2, 17, 17), this.terrainTextures, i / 16.0f, i / 16.0f, 0.0625f, 0.0625f);
            }
            int i8 = ((i2 * 16) + i7) * REGION_VERTICES_PER_SIDE;
            for (int k = 0; k < 17; k++) {
                float f = this.vertexHeights[i8 + k + (i * 16)];
                float f2 = this.vertexNormals[(i8 + k + (i * 16)) * 2];
                float f3 = this.vertexNormals[((i8 + k + (i * 16)) * 2) + 1];
                floats[(i7 * 17) + k] = f;
                floats2[((i7 * 17) + k) * 2] = f2;
                floats2[(((i7 * 17) + k) * 2) + 1] = f3;
            }
            i6 = i7 + 1;
        }
    }

    public final boolean isUnderWater(float f) {
        return this.waterHeightValid && f < this.waterHeight;
    }

    public void reset() {
        synchronized (this.vertexLock) {
            this.waterHeightValid = false;
            this.validCount = 0;
            for (int i = 0; i < 65536; i++) {
                this.validMap[i] = false;
            }
            for (int j = 0; j < 66049; j++) {
                this.vertexValids[j] = false;
            }
            for (int k = 0; k < 256; k++) {
                this.patchDirtyMap[k] = false;
            }
        }
    }

    public void updateEntireTerrain() {
        markVerticesDirty(0, 0, 256, 256);
    }
}
