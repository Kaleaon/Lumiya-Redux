package com.lumiyaviewer.lumiya.slproto.mesh

import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDArray
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDouble
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.ByteArrayOutputStream
import java.io.DataOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.util.zip.DeflaterOutputStream

class MeshDataTest {

    @get:Rule
    @JvmField
    val tempFolder = TemporaryFolder()

    private fun llsdToBinaryBytes(node: LLSDNode): ByteArray {
        val baos = ByteArrayOutputStream()
        val dos = DataOutputStream(baos)
        node.toBinary(dos)
        dos.flush()
        return baos.toByteArray()
    }

    private fun compressZlib(data: ByteArray): ByteArray {
        val baos = ByteArrayOutputStream()
        val deflater = DeflaterOutputStream(baos)
        deflater.write(data)
        deflater.finish()
        deflater.close()
        return baos.toByteArray()
    }

    @Test
    fun testLLSDNodeFromBinaryFileBuffered() {
        val testMap = LLSDMap(
            mapOf(
                "key1" to LLSDString("value1"),
                "key2" to LLSDInt(42)
            )
        )
        val file = tempFolder.newFile("test_llsd.bin")
        FileOutputStream(file).use { fos ->
            fos.write(llsdToBinaryBytes(testMap))
        }

        val loaded = LLSDNode.fromBinaryFile(file)
        assertNotNull(loaded)
        assertTrue(loaded.keyExists("key1"))
        assertEquals("value1", loaded.byKey("key1").asString())
        assertEquals(42, loaded.byKey("key2").asInt())
    }

    @Test(expected = LLSDXMLException::class)
    fun testLLSDNodeFromBinaryFileCorruptThrowsException() {
        val file = tempFolder.newFile("corrupt_llsd.bin")
        FileOutputStream(file).use { fos ->
            fos.write(byteArrayOf(0xFF.toByte(), 0x00.toByte(), 0x12.toByte()))
        }

        LLSDNode.fromBinaryFile(file)
    }

    @Test
    fun testMeshDataInMemoryLoadingFacesAndSkin() {
        GlobalOptions.getInstance().meshRendering = GlobalOptions.MeshRendering.medium

        // 1. Build faces LLSD array (1 face)
        val faceMap = LLSDMap(
            mapOf(
                "Position" to LLSDString("dummy_pos")
            )
        )
        val facesArray = LLSDArray()
        facesArray.add(faceMap)
        val facesBinary = llsdToBinaryBytes(facesArray)
        val facesZlib = compressZlib(facesBinary)

        // 2. Build skin LLSD map
        val bsmArray = LLSDArray()
        for (i in 0 until 16) {
            bsmArray.add(LLSDDouble(if (i % 5 == 0) 1.0 else 0.0))
        }
        val jointNamesArray = LLSDArray()
        jointNamesArray.add(LLSDString("mPelvis"))

        val ibmMatrixArray = LLSDArray()
        for (i in 0 until 16) {
            ibmMatrixArray.add(LLSDDouble(if (i % 5 == 0) 1.0 else 0.0))
        }
        val ibmArray = LLSDArray()
        ibmArray.add(ibmMatrixArray)

        val skinMap = LLSDMap(
            mapOf(
                "bind_shape_matrix" to bsmArray,
                "joint_names" to jointNamesArray,
                "inverse_bind_matrix" to ibmArray,
                "pelvis_offset" to LLSDDouble(0.25)
            )
        )
        val skinBinary = llsdToBinaryBytes(skinMap)
        val skinZlib = compressZlib(skinBinary)

        // 3. Build Header map
        val lodOffset = 0
        val skinOffset = facesZlib.size

        val lodHeaderMap = LLSDMap(
            mapOf(
                "offset" to LLSDInt(lodOffset),
                "size" to LLSDInt(facesZlib.size)
            )
        )
        val skinHeaderMap = LLSDMap(
            mapOf(
                "offset" to LLSDInt(skinOffset),
                "size" to LLSDInt(skinZlib.size)
            )
        )

        val headerMap = LLSDMap(
            mapOf(
                "medium_lod" to lodHeaderMap,
                "skin" to skinHeaderMap
            )
        )

        val headerBinary = llsdToBinaryBytes(headerMap)

        // Assembly
        val fullMeshBytes = ByteArrayOutputStream()
        fullMeshBytes.write(headerBinary)
        fullMeshBytes.write(facesZlib)
        fullMeshBytes.write(skinZlib)

        val meshFile = tempFolder.newFile("test_mesh.slm")
        FileOutputStream(meshFile).use { fos ->
            fos.write(fullMeshBytes.toByteArray())
        }

        // Test MeshData loading from in-memory stream
        val meshData = MeshData(meshFile)
        assertEquals(1, meshData.getFaceCount())
        assertTrue(meshData.isRiggedMesh())
    }

    @Test
    fun testMeshDataMissingLODThrowsIOException() {
        GlobalOptions.getInstance().meshRendering = GlobalOptions.MeshRendering.medium

        // Header map with no valid LOD key
        val headerMap = LLSDMap(mapOf("invalid_lod" to LLSDInt(0)))
        val headerBinary = llsdToBinaryBytes(headerMap)

        val meshFile = tempFolder.newFile("missing_lod.slm")
        FileOutputStream(meshFile).use { fos ->
            fos.write(headerBinary)
        }

        try {
            MeshData(meshFile)
            fail("Expected IOException when mesh LOD is missing")
        } catch (e: IOException) {
            assertTrue(e.message?.contains("Mesh LOD not found") == true)
        }
    }

    @Test
    fun testMeshDataDisabledMeshRenderingThrowsIOException() {
        GlobalOptions.getInstance().meshRendering = GlobalOptions.MeshRendering.disabled

        val meshFile = tempFolder.newFile("disabled.slm")
        try {
            MeshData(meshFile)
            fail("Expected IOException when mesh rendering is disabled")
        } catch (e: IOException) {
            assertTrue(e.message?.contains("Mesh rendering is disabled") == true)
        } finally {
            GlobalOptions.getInstance().meshRendering = GlobalOptions.MeshRendering.medium
        }
    }
}
