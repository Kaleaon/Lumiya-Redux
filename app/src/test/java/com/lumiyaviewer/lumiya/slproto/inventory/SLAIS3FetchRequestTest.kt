package com.lumiyaviewer.lumiya.slproto.inventory

import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.util.UUID

class SLAIS3FetchRequestTest {

    @Test
    fun testFolderValueKeyByTag() {
        assertEquals(SLAIS3FetchRequest.FolderValueKey.category_id, SLAIS3FetchRequest.FolderValueKey.byTag("category_id"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.folder_id, SLAIS3FetchRequest.FolderValueKey.byTag("folder_id"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.agent_id, SLAIS3FetchRequest.FolderValueKey.byTag("agent_id"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.name, SLAIS3FetchRequest.FolderValueKey.byTag("name"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.type_default, SLAIS3FetchRequest.FolderValueKey.byTag("type_default"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.type, SLAIS3FetchRequest.FolderValueKey.byTag("type"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.version, SLAIS3FetchRequest.FolderValueKey.byTag("version"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.parent_id, SLAIS3FetchRequest.FolderValueKey.byTag("parent_id"))
        assertEquals(SLAIS3FetchRequest.FolderValueKey.preferred_type, SLAIS3FetchRequest.FolderValueKey.byTag("preferred_type"))
        assertNull(SLAIS3FetchRequest.FolderValueKey.byTag("unknown_key"))
    }

    @Test
    fun testItemValueKeyByTag() {
        assertEquals(SLAIS3FetchRequest.ItemValueKey.item_id, SLAIS3FetchRequest.ItemValueKey.byTag("item_id"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.name, SLAIS3FetchRequest.ItemValueKey.byTag("name"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.parent_id, SLAIS3FetchRequest.ItemValueKey.byTag("parent_id"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.agent_id, SLAIS3FetchRequest.ItemValueKey.byTag("agent_id"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.type, SLAIS3FetchRequest.ItemValueKey.byTag("type"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.inv_type, SLAIS3FetchRequest.ItemValueKey.byTag("inv_type"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.desc, SLAIS3FetchRequest.ItemValueKey.byTag("desc"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.flags, SLAIS3FetchRequest.ItemValueKey.byTag("flags"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.created_at, SLAIS3FetchRequest.ItemValueKey.byTag("created_at"))
        assertEquals(SLAIS3FetchRequest.ItemValueKey.asset_id, SLAIS3FetchRequest.ItemValueKey.byTag("asset_id"))
        assertNull(SLAIS3FetchRequest.ItemValueKey.byTag("unknown_item_key"))
    }

    @Test
    fun testPermissionsValueKeyByTag() {
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.creator_id, SLAIS3FetchRequest.PermissionsValueKey.byTag("creator_id"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.group_id, SLAIS3FetchRequest.PermissionsValueKey.byTag("group_id"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.owner_id, SLAIS3FetchRequest.PermissionsValueKey.byTag("owner_id"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.last_owner_id, SLAIS3FetchRequest.PermissionsValueKey.byTag("last_owner_id"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.is_owner_group, SLAIS3FetchRequest.PermissionsValueKey.byTag("is_owner_group"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.base_mask, SLAIS3FetchRequest.PermissionsValueKey.byTag("base_mask"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.owner_mask, SLAIS3FetchRequest.PermissionsValueKey.byTag("owner_mask"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.next_owner_mask, SLAIS3FetchRequest.PermissionsValueKey.byTag("next_owner_mask"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.group_mask, SLAIS3FetchRequest.PermissionsValueKey.byTag("group_mask"))
        assertEquals(SLAIS3FetchRequest.PermissionsValueKey.everyone_mask, SLAIS3FetchRequest.PermissionsValueKey.byTag("everyone_mask"))
        assertNull(SLAIS3FetchRequest.PermissionsValueKey.byTag("unknown_permission_key"))
    }

    @Test
    fun testEndpointUrlConstruction() {
        val folderUUID = UUID.randomUUID()
        val capURLNoSlash = "https://sim.example.com/cap/InventoryAPIv3"
        val capURLWithSlash = "https://sim.example.com/cap/InventoryAPIv3/"

        val constructedNoSlash = if (capURLNoSlash.endsWith("/")) "${capURLNoSlash}category/$folderUUID" else "$capURLNoSlash/category/$folderUUID"
        val constructedWithSlash = if (capURLWithSlash.endsWith("/")) "${capURLWithSlash}category/$folderUUID" else "$capURLWithSlash/category/$folderUUID"

        assertEquals("https://sim.example.com/cap/InventoryAPIv3/category/$folderUUID", constructedNoSlash)
        assertEquals("https://sim.example.com/cap/InventoryAPIv3/category/$folderUUID", constructedWithSlash)
    }

    @Test
    fun testSLCapabilityEnumForAISv3() {
        val invCap = SLCaps.SLCapability.valueOf("InventoryAPIv3")
        val libCap = SLCaps.SLCapability.valueOf("LibraryAPIv3")
        assertNotNull(invCap)
        assertNotNull(libCap)
    }
}
