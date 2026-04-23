package com.lumiyaviewer.lumiya.render.backend.filament;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.mesh.MeshData;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nonnull;

/* loaded from: classes.dex */
public class FilamentSceneUploadBridge {
    private final AtomicInteger uploadedMeshCount = new AtomicInteger();
    private final AtomicInteger uploadedTextureCount = new AtomicInteger();

    public void uploadMesh(@Nonnull MeshData meshData, FilamentMaterialMode filamentMaterialMode) {
        this.uploadedMeshCount.incrementAndGet();
        Debug.Printf("FilamentBridge: uploadMesh faces=%d materialMode=%s", Integer.valueOf(meshData.getFaceCount()), filamentMaterialMode);
    }

    public void uploadTexture(@Nonnull ByteBuffer byteBuffer, int i, int i2, boolean z) {
        this.uploadedTextureCount.incrementAndGet();
        Debug.Printf("FilamentBridge: uploadTexture %dx%d alpha=%b bytes=%d", Integer.valueOf(i), Integer.valueOf(i2), Boolean.valueOf(z), Integer.valueOf(byteBuffer.remaining()));
    }

    public int getUploadedMeshCount() {
        return this.uploadedMeshCount.get();
    }

    public int getUploadedTextureCount() {
        return this.uploadedTextureCount.get();
    }
}
