package com.lumiyaviewer.lumiya.slproto.prims;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.UUID;
import org.junit.Test;

/** Protocol coverage for the 0x70 extended-mesh parameter used by Animesh. */
public class PrimVolumeParamsAnimeshTest {
    private static ByteBuffer extras(int flags) {
        UUID mesh = UUID.fromString("12345678-1234-5678-9abc-def012345678");
        ByteBuffer buffer = ByteBuffer.allocate(1 + 2 + 4 + 17 + 2 + 4 + 4)
                .order(ByteOrder.LITTLE_ENDIAN)
                .put((byte) 2)
                .putShort(PrimVolumeParams.PARAMS_MESH)
                .putInt(17)
                .order(ByteOrder.BIG_ENDIAN).putLong(mesh.getMostSignificantBits()).putLong(mesh.getLeastSignificantBits())
                .order(ByteOrder.LITTLE_ENDIAN).put(PrimVolumeParams.LL_SCULPT_TYPE_MESH)
                .putShort(PrimVolumeParams.PARAMS_EXTENDED_MESH)
                .putInt(4)
                .putInt(flags);
        buffer.flip();
        return buffer;
    }

    @Test
    public void animatedFlagMarksMeshAsAnimesh() {
        PrimVolumeParams params = new PrimVolumeParams();
        params.unpackExtraParams(extras(PrimVolumeParams.EXTENDED_MESH_ANIMATED));

        assertTrue(params.isMesh());
        assertTrue(params.isAnimatedMesh());
        assertEquals(PrimVolumeParams.EXTENDED_MESH_ANIMATED, params.ExtendedMeshFlags);
    }

    @Test
    public void preservesUnknownFlagsWithoutEnablingAnimation() {
        PrimVolumeParams params = new PrimVolumeParams();
        params.unpackExtraParams(extras(0x40));

        assertTrue(params.isMesh());
        assertFalse(params.isAnimatedMesh());
        assertEquals(0x40, params.ExtendedMeshFlags);
    }

    @Test
    public void malformedLengthDoesNotEscapeParser() {
        ByteBuffer malformed = ByteBuffer.allocate(7).order(ByteOrder.LITTLE_ENDIAN)
                .put((byte) 1).putShort(PrimVolumeParams.PARAMS_EXTENDED_MESH).putInt(100);
        malformed.flip();
        PrimVolumeParams params = new PrimVolumeParams();

        params.unpackExtraParams(malformed);

        assertEquals(0, params.ExtendedMeshFlags);
    }
}
