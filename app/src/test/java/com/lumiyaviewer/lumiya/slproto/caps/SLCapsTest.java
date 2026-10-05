package com.lumiyaviewer.lumiya.slproto.caps;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import com.lumiyaviewer.lumiya.slproto.caps.SLCaps.SLCapability;
import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.junit.Test;

/** Tests for SLCaps capability negotiation, enum coverage, and URL fallback behavior. */
public class SLCapsTest {
    private static final String VIEWER_ASSET = "https://sim.example/cap/viewer-asset";
    private static final String GET_TEXTURE = "https://sim.example/cap/get-texture";
    private static final String GET_MESH = "https://sim.example/cap/get-mesh";
    private static final String GET_MESH2 = "https://sim.example/cap/get-mesh2";

    @SuppressWarnings("unchecked")
    private static SLCaps capsWith(Object... capabilityUrlPairs) throws Exception {
        SLCaps caps = new SLCaps();
        Field field = SLCaps.class.getDeclaredField("caps");
        field.setAccessible(true);
        Map<SLCapability, String> map = (Map<SLCapability, String>) field.get(caps);
        for (int i = 0; i < capabilityUrlPairs.length; i += 2) {
            map.put((SLCapability) capabilityUrlPairs[i], (String) capabilityUrlPairs[i + 1]);
        }
        return caps;
    }

    @Test
    public void capabilityEnumIncludesUpstreamCanonicalSet() {
        SLCapability[] values = SLCapability.values();
        assertTrue("SLCapability should contain at least 96 canonical capabilities", values.length >= 96);

        Set<String> capNames = new HashSet<>();
        for (SLCapability cap : values) {
            capNames.add(cap.name());
        }

        // Verify key canonical capabilities from Second Life 2026, AIS v3, and OpenSim
        assertTrue("Missing InventoryAPIv3", capNames.contains("InventoryAPIv3"));
        assertTrue("Missing LibraryAPIv3", capNames.contains("LibraryAPIv3"));
        assertTrue("Missing ViewerAsset", capNames.contains("ViewerAsset"));
        assertTrue("Missing AgentPreferences", capNames.contains("AgentPreferences"));
        assertTrue("Missing SimulatorFeatures", capNames.contains("SimulatorFeatures"));
        assertTrue("Missing UpdateAvatarAppearance", capNames.contains("UpdateAvatarAppearance"));
        assertTrue("Missing DispatchOpenRegionSettings", capNames.contains("DispatchOpenRegionSettings"));
        assertTrue("Missing EventQueueGet", capNames.contains("EventQueueGet"));
        assertTrue("Missing RenderMaterials", capNames.contains("RenderMaterials"));
    }

    @Test
    public void unsupportedCapabilityReturnsNullWithoutException() throws Exception {
        SLCaps caps = capsWith(SLCapability.GetTexture, GET_TEXTURE);
        assertNull(caps.getCapability(SLCapability.AgentPreferences));
        assertNull(caps.getCapability(SLCapability.SimulatorFeatures));
        assertNull(caps.getCapability(SLCapability.InventoryAPIv3));
    }

    @Test
    public void getCapabilityOrThrowBehavior() throws Exception {
        SLCaps caps = capsWith(SLCapability.GetTexture, GET_TEXTURE);
        assertEquals(GET_TEXTURE, caps.getCapabilityOrThrow(SLCapability.GetTexture));

        try {
            caps.getCapabilityOrThrow(SLCapability.AgentPreferences);
            fail("Expected NoSuchCapabilityException for missing capability");
        } catch (SLCaps.NoSuchCapabilityException e) {
            assertNotNull(e.getMessage());
            assertTrue(e.getMessage().contains("AgentPreferences"));
        }
    }

    @Test
    public void viewerAssetPreferredForTextures() throws Exception {
        SLCaps caps = capsWith(SLCapability.ViewerAsset, VIEWER_ASSET, SLCapability.GetTexture, GET_TEXTURE);
        assertEquals(VIEWER_ASSET, caps.getTextureFetchURL());
    }

    @Test
    public void getTextureUsedWithoutViewerAsset() throws Exception {
        assertEquals(GET_TEXTURE, capsWith(SLCapability.GetTexture, GET_TEXTURE).getTextureFetchURL());
    }

    @Test
    public void noTextureCapGivesNull() throws Exception {
        assertNull(capsWith(SLCapability.GetMesh, GET_MESH).getTextureFetchURL());
    }

    @Test
    public void meshFallbackOrder() throws Exception {
        assertEquals(VIEWER_ASSET, capsWith(SLCapability.ViewerAsset, VIEWER_ASSET,
                SLCapability.GetMesh2, GET_MESH2, SLCapability.GetMesh, GET_MESH).getMeshFetchURL());
        assertEquals(GET_MESH2, capsWith(SLCapability.GetMesh2, GET_MESH2, SLCapability.GetMesh, GET_MESH).getMeshFetchURL());
        assertEquals(GET_MESH, capsWith(SLCapability.GetMesh, GET_MESH).getMeshFetchURL());
        assertNull(capsWith().getMeshFetchURL());
    }
}
