package com.lumiyaviewer.lumiya.render.scene

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.sqrt

/** Vertex and index data for one mesh, ready to copy into GPU buffers. */
class MeshData(
    /** x, y, z per vertex. */
    val positions: FloatArray,
    /** Tangent frame quaternion (x, y, z, w) per vertex, or null for unlit meshes. */
    val tangents: FloatArray?,
    val indices: ShortArray,
) {
    val vertexCount: Int get() = positions.size / 3
}

/**
 * Renderer-independent geometry for the Filament world view. Kept free of
 * Filament classes so it can be unit tested on the JVM.
 */
object SceneGeometry {

    /**
     * A terrain patch as 17 x 17 vertices in region coordinates and 16 x 16
     * quads, counter-clockwise seen from above. Normals come from central
     * differences of the heights (one-sided on the patch edge).
     */
    @JvmStatic
    fun terrainPatch(patch: SceneDelta.TerrainPatch): MeshData {
        val n = SceneDelta.TerrainPatch.SAMPLES_PER_EDGE
        val h = patch.heights
        val positions = FloatArray(n * n * 3)
        val tangents = FloatArray(n * n * 4)
        val originX = patch.patchX * SceneDelta.TerrainPatch.PATCH_SIZE
        val originY = patch.patchY * SceneDelta.TerrainPatch.PATCH_SIZE
        val quat = FloatArray(4)
        for (row in 0 until n) {
            for (col in 0 until n) {
                val v = row * n + col
                positions[v * 3] = (originX + col).toFloat()
                positions[v * 3 + 1] = (originY + row).toFloat()
                positions[v * 3 + 2] = h[v]
                val left = h[row * n + maxOf(col - 1, 0)]
                val right = h[row * n + minOf(col + 1, n - 1)]
                val down = h[maxOf(row - 1, 0) * n + col]
                val up = h[minOf(row + 1, n - 1) * n + col]
                val dzdx = (right - left) / (minOf(col + 1, n - 1) - maxOf(col - 1, 0)).toFloat()
                val dzdy = (up - down) / (minOf(row + 1, n - 1) - maxOf(row - 1, 0)).toFloat()
                tangentFrame(-dzdx, -dzdy, 1f, quat)
                System.arraycopy(quat, 0, tangents, v * 4, 4)
            }
        }
        val quads = SceneDelta.TerrainPatch.PATCH_SIZE
        val indices = ShortArray(quads * quads * 6)
        var i = 0
        for (row in 0 until quads) {
            for (col in 0 until quads) {
                val v00 = row * n + col
                val v10 = v00 + 1
                val v01 = v00 + n
                val v11 = v01 + 1
                indices[i++] = v00.toShort(); indices[i++] = v10.toShort(); indices[i++] = v11.toShort()
                indices[i++] = v00.toShort(); indices[i++] = v11.toShort(); indices[i++] = v01.toShort()
            }
        }
        return MeshData(positions, tangents, indices)
    }

    /** Unit sphere for the sky dome: [rings] latitude bands, [segments] around. */
    @JvmStatic
    fun skyDome(rings: Int = 16, segments: Int = 32): MeshData {
        val positions = FloatArray((rings + 1) * (segments + 1) * 3)
        var p = 0
        for (r in 0..rings) {
            val theta = PI * r / rings // 0 at zenith
            for (s in 0..segments) {
                val phi = 2.0 * PI * s / segments
                positions[p++] = (sin(theta) * cos(phi)).toFloat()
                positions[p++] = (sin(theta) * sin(phi)).toFloat()
                positions[p++] = cos(theta).toFloat()
            }
        }
        val indices = ShortArray(rings * segments * 6)
        var i = 0
        for (r in 0 until rings) {
            for (s in 0 until segments) {
                val a = r * (segments + 1) + s
                val b = a + segments + 1
                indices[i++] = a.toShort(); indices[i++] = b.toShort(); indices[i++] = (a + 1).toShort()
                indices[i++] = (a + 1).toShort(); indices[i++] = b.toShort(); indices[i++] = (b + 1).toShort()
            }
        }
        return MeshData(positions, null, indices)
    }

    /**
     * The tangent frame quaternion Filament's TANGENTS attribute expects: the
     * rotation taking +X, +Y, +Z to tangent, bitangent and normal. The tangent
     * is +X made perpendicular to the normal. w is kept positive (a
     * right-handed frame), as SurfaceOrientation produces.
     */
    @JvmStatic
    fun tangentFrame(nx: Float, ny: Float, nz: Float, out: FloatArray) {
        var len = sqrt(nx * nx + ny * ny + nz * nz)
        val n0 = nx / len; val n1 = ny / len; val n2 = nz / len
        // t = normalize(X - n * (n . X)); fall back to Y when n is along X.
        var t0 = 1f - n0 * n0; var t1 = -n0 * n1; var t2 = -n0 * n2
        len = sqrt(t0 * t0 + t1 * t1 + t2 * t2)
        if (len < 1e-4f) {
            t0 = -n1 * n0; t1 = 1f - n1 * n1; t2 = -n1 * n2
            len = sqrt(t0 * t0 + t1 * t1 + t2 * t2)
        }
        t0 /= len; t1 /= len; t2 /= len
        // b = n x t
        val b0 = n1 * t2 - n2 * t1
        val b1 = n2 * t0 - n0 * t2
        val b2 = n0 * t1 - n1 * t0
        // Rotation matrix with columns t, b, n -> quaternion.
        val m00 = t0; val m01 = b0; val m02 = n0
        val m10 = t1; val m11 = b1; val m12 = n1
        val m20 = t2; val m21 = b2; val m22 = n2
        val trace = m00 + m11 + m22
        var x: Float; var y: Float; var z: Float; var w: Float
        if (trace > 0f) {
            val s = sqrt(trace + 1f) * 2f
            w = 0.25f * s; x = (m21 - m12) / s; y = (m02 - m20) / s; z = (m10 - m01) / s
        } else if (m00 > m11 && m00 > m22) {
            val s = sqrt(1f + m00 - m11 - m22) * 2f
            w = (m21 - m12) / s; x = 0.25f * s; y = (m01 + m10) / s; z = (m02 + m20) / s
        } else if (m11 > m22) {
            val s = sqrt(1f + m11 - m00 - m22) * 2f
            w = (m02 - m20) / s; x = (m01 + m10) / s; y = 0.25f * s; z = (m12 + m21) / s
        } else {
            val s = sqrt(1f + m22 - m00 - m11) * 2f
            w = (m10 - m01) / s; x = (m02 + m20) / s; y = (m12 + m21) / s; z = 0.25f * s
        }
        if (w < 0f) {
            x = -x; y = -y; z = -z; w = -w
        }
        out[0] = x; out[1] = y; out[2] = z; out[3] = w
    }
}
