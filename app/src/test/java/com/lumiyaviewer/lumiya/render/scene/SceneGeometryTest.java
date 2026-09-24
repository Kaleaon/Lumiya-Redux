package com.lumiyaviewer.lumiya.render.scene;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.List;
import org.junit.Test;

/** Renderer-independent parts of the Filament world view (stage F0). */
public class SceneGeometryTest {
    private static final float EPS = 1e-4f;

    /** Rotates v by unit quaternion q = (x, y, z, w). */
    private static float[] rotate(float[] q, float vx, float vy, float vz) {
        float x = q[0], y = q[1], z = q[2], w = q[3];
        // v' = v + 2w (q x v) + 2 q x (q x v)
        float cx = y * vz - z * vy, cy = z * vx - x * vz, cz = x * vy - y * vx;
        float ccx = y * cz - z * cy, ccy = z * cx - x * cz, ccz = x * cy - y * cx;
        return new float[]{vx + 2 * (w * cx + ccx), vy + 2 * (w * cy + ccy), vz + 2 * (w * cz + ccz)};
    }

    private static void assertFrame(float nx, float ny, float nz) {
        float[] q = new float[4];
        SceneGeometry.tangentFrame(nx, ny, nz, q);
        float len = (float) Math.sqrt(nx * nx + ny * ny + nz * nz);
        float[] n = rotate(q, 0, 0, 1);
        assertEquals(nx / len, n[0], EPS);
        assertEquals(ny / len, n[1], EPS);
        assertEquals(nz / len, n[2], EPS);
        float[] t = rotate(q, 1, 0, 0);
        assertEquals("tangent perpendicular to normal", 0f, t[0] * n[0] + t[1] * n[1] + t[2] * n[2], EPS);
        assertEquals(1f, q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3], EPS);
        assertTrue("w >= 0", q[3] >= 0f);
    }

    @Test
    public void tangentFrameMapsZToNormal() {
        assertFrame(0, 0, 1);
        assertFrame(0.3f, -0.2f, 0.9f);
        assertFrame(-1f, 0f, 0.01f);
        assertFrame(1f, 0f, 0f);
        assertFrame(0f, 0f, -1f);
        assertFrame(0.5f, 0.5f, -0.5f);
    }

    private static SceneDelta.TerrainPatch slope(int px, int py) {
        float[] heights = new float[17 * 17];
        for (int row = 0; row < 17; row++) {
            for (int col = 0; col < 17; col++) {
                heights[row * 17 + col] = 10f + 0.5f * (px * 16 + col); // rises 0.5 m per metre east
            }
        }
        return new SceneDelta.TerrainPatch(px, py, heights, 20f);
    }

    @Test
    public void terrainPatchVerticesAndNormals() {
        MeshData mesh = SceneGeometry.terrainPatch(slope(2, 3));
        assertEquals(289, mesh.getVertexCount());
        assertEquals(16 * 16 * 6, mesh.getIndices().length);
        // Vertex (col 4, row 5) sits at region (36, 53).
        int v = 5 * 17 + 4;
        assertEquals(36f, mesh.getPositions()[v * 3], EPS);
        assertEquals(53f, mesh.getPositions()[v * 3 + 1], EPS);
        assertEquals(10f + 0.5f * 36, mesh.getPositions()[v * 3 + 2], EPS);
        // A slope rising east has a normal tilted west: (-0.5, 0, 1) normalised.
        float[] q = new float[4];
        System.arraycopy(mesh.getTangents(), v * 4, q, 0, 4);
        float[] n = rotate(q, 0, 0, 1);
        float len = (float) Math.sqrt(1.25);
        assertEquals(-0.5f / len, n[0], EPS);
        assertEquals(0f, n[1], EPS);
        assertEquals(1f / len, n[2], EPS);
    }

    @Test
    public void terrainTrianglesFaceUp() {
        MeshData mesh = SceneGeometry.terrainPatch(slope(0, 0));
        float[] p = mesh.getPositions();
        short[] idx = mesh.getIndices();
        for (int i = 0; i < idx.length; i += 3) {
            int a = idx[i] * 3, b = idx[i + 1] * 3, c = idx[i + 2] * 3;
            float ux = p[b] - p[a], uy = p[b + 1] - p[a + 1];
            float vx = p[c] - p[a], vy = p[c + 1] - p[a + 1];
            assertTrue("counter-clockwise from above", ux * vy - uy * vx > 0);
        }
    }

    @Test
    public void skyDomeIsUnitSphere() {
        MeshData sky = SceneGeometry.skyDome(8, 16);
        float[] p = sky.getPositions();
        for (int i = 0; i < p.length; i += 3) {
            assertEquals(1f, (float) Math.sqrt(p[i] * p[i] + p[i + 1] * p[i + 1] + p[i + 2] * p[i + 2]), EPS);
        }
        assertEquals(1f, p[2], EPS); // first ring is the zenith
        for (short index : sky.getIndices()) {
            assertTrue(index >= 0 && index < sky.getVertexCount());
        }
    }

    @Test
    public void queueCoalescesPerPatch() {
        SceneDeltaQueue queue = new SceneDeltaQueue();
        List<SceneDelta.TerrainPatch> demo = RegionSceneSource.demoTerrain();
        assertEquals(256, demo.size());
        queue.offerAll(demo);
        queue.offerAll(demo);
        SceneDelta.TerrainPatch newer = slope(0, 0);
        queue.offer(newer);
        assertEquals(256, queue.getSize());
        List<SceneDelta> drained = queue.drain();
        assertEquals(256, drained.size());
        assertSame(newer, drained.get(drained.size() - 1));
        assertEquals(0, queue.getSize());
    }
}
