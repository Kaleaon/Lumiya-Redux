package com.lumiyaviewer.lumiya.slproto.caps;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import com.lumiyaviewer.lumiya.slproto.caps.SLCaps.SLCapability;
import java.lang.reflect.Field;
import java.util.Map;
import org.junit.Test;

/** Asset fetch URL selection: ViewerAsset first, then the legacy per-asset caps. */
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
