package com.lumiyaviewer.lumiya.inventory

import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import java.util.UUID

class OutfitManagerTest {

    @Test
    fun testCategoryFilterEnum() {
        assertEquals("All Items", OutfitManager.CategoryFilter.ALL.displayName)
        assertEquals("Clothing", OutfitManager.CategoryFilter.CLOTHING.displayName)
        assertEquals("Attachments", OutfitManager.CategoryFilter.ATTACHMENTS.displayName)
        assertEquals("Body Parts", OutfitManager.CategoryFilter.BODY_PARTS.displayName)
        assertEquals("HUDs", OutfitManager.CategoryFilter.HUDS.displayName)
    }

    @Test
    fun testAttachmentPointsMap() {
        val points = OutfitManager.ATTACHMENT_POINTS
        assertEquals("Chest", points[1])
        assertEquals("Skull", points[2])
        assertEquals("HUD Center", points[34])
        assertEquals("Neck", points[38])
    }

    @Test
    fun testFilterWornItems() {
        val clothingWornItem = SLAvatarAppearance.WornItem(
            SLWearableType.WT_SHIRT,
            0,
            UUID.randomUUID(),
            "Test Shirt",
            0,
            false
        )

        val bodyPartWornItem = SLAvatarAppearance.WornItem(
            SLWearableType.WT_SKIN,
            0,
            UUID.randomUUID(),
            "Test Skin",
            0,
            false
        )

        val attachmentWornItem = SLAvatarAppearance.WornItem(
            null,
            1, // Chest
            UUID.randomUUID(),
            "Test Chest Attachment",
            100,
            true
        )

        val hudWornItem = SLAvatarAppearance.WornItem(
            null,
            34, // HUD Center
            UUID.randomUUID(),
            "Test HUD",
            101,
            true
        )

        val items = listOf(clothingWornItem, bodyPartWornItem, attachmentWornItem, hudWornItem)

        val manager = OutfitManager.getInstance(dummyUserManager())

        val clothingFiltered = manager.filterWornItems(items, OutfitManager.CategoryFilter.CLOTHING)
        assertEquals(1, clothingFiltered.size)
        assertEquals("Test Shirt", clothingFiltered[0].getName())

        val bodyPartsFiltered = manager.filterWornItems(items, OutfitManager.CategoryFilter.BODY_PARTS)
        assertEquals(1, bodyPartsFiltered.size)
        assertEquals("Test Skin", bodyPartsFiltered[0].getName())

        val attachmentsFiltered = manager.filterWornItems(items, OutfitManager.CategoryFilter.ATTACHMENTS)
        assertEquals(1, attachmentsFiltered.size)
        assertEquals("Test Chest Attachment", attachmentsFiltered[0].getName())

        val hudsFiltered = manager.filterWornItems(items, OutfitManager.CategoryFilter.HUDS)
        assertEquals(1, hudsFiltered.size)
        assertEquals("Test HUD", hudsFiltered[0].getName())

        val allFiltered = manager.filterWornItems(items, OutfitManager.CategoryFilter.ALL)
        assertEquals(4, allFiltered.size)
    }

    private fun dummyUserManager(): com.lumiyaviewer.lumiya.slproto.users.manager.UserManager {
        return object : com.lumiyaviewer.lumiya.slproto.users.manager.UserManager() {
            override fun getUserID(): UUID {
                return UUID.fromString("00000000-0000-0000-0000-000000000001")
            }
        }
    }
}
