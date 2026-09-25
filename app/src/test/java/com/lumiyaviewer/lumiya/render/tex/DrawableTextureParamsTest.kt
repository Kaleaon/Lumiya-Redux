package com.lumiyaviewer.lumiya.render.tex

import java.io.File
import java.util.UUID
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class DrawableTextureParamsTest {
    private val textureId = UUID.fromString("00112233-4455-6677-8899-aabbccddeeff")

    @Test
    fun valueContractAndJavaStyleFactoriesArePreserved() {
        val first = DrawableTextureParams.create(textureId, TextureClass.Prim)
        val second = DrawableTextureParams.create(textureId, TextureClass.Prim)
        val different = DrawableTextureParams.create(textureId, TextureClass.Asset)

        assertEquals(first, second)
        assertEquals(first.hashCode(), second.hashCode())
        assertNotEquals(first, different)
        assertTrue(first.toString().startsWith("DrawableTextureParams{"))
    }

    @Test
    fun rawPathRetainsBucketAndQualityLayout() {
        val root = File("cache")
        val standard = DrawableTextureParams.create(textureId, TextureClass.Prim)

        assertEquals("cache/textures-raw/00/$textureId.raw", standard.getTextureRawPath(root, false).path)
        assertEquals("cache/textures-hq-raw/00/$textureId.raw", standard.getTextureRawPath(root, true).path)
    }

    @Test
    fun enumCompatibilityHelpersReturnAllValues() {
        assertEquals(TextureClass.entries.toTypedArray().toList(), TextureClass.valuesCustom().toList())
        assertEquals(TexturePriority.entries.toTypedArray().toList(), TexturePriority.valuesCustom().toList())
    }
}
