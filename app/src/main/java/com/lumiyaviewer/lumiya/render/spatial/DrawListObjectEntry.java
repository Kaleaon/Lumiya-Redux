package com.lumiyaviewer.lumiya.render.spatial;

import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.types.Vector3Array;
import javax.annotation.Nonnull;

public abstract class DrawListObjectEntry extends DrawListEntry {

    @Nonnull
    final SLObjectInfo objectInfo;

    public DrawListObjectEntry(@Nonnull SLObjectInfo objectInfo) {
        this.objectInfo = objectInfo;
    }

    @Nonnull
    public SLObjectInfo getObjectInfo() {
        return this.objectInfo;
    }

    public void updateBoundingBox() {
        float[] worldMatrix = this.objectInfo.worldMatrix;
        if (worldMatrix != null) {
            Vector3Array objectCoords = this.objectInfo.getObjectCoords();
            float[] data = objectCoords.getData();
            int elementOffset = objectCoords.getElementOffset(1);
            for (int i = 0; i < 3; i++) {
                float[] boundingBox = this.boundingBox;
                float f = worldMatrix[i + 12];
                this.boundingBox[i + 3] = f;
                boundingBox[i] = f;
            }
            for (int j = 0; j < 3; j++) {
                for (int k = 0; k < 3; k++) {
                    float f2 = worldMatrix[(j * 4) + k] * ((-data[elementOffset + k]) / 2.0f);
                    float f3 = worldMatrix[(j * 4) + k] * (data[elementOffset + k] / 2.0f);
                    if (f2 < f3) {
                        float[] boundingBox2 = this.boundingBox;
                        boundingBox2[j] = f2 + boundingBox2[j];
                        float[] boundingBox3 = this.boundingBox;
                        int i4 = j + 3;
                        boundingBox3[i4] = f3 + boundingBox3[i4];
                    } else {
                        float[] boundingBox4 = this.boundingBox;
                        boundingBox4[j] = f3 + boundingBox4[j];
                        float[] boundingBox5 = this.boundingBox;
                        int i5 = j + 3;
                        boundingBox5[i5] = f2 + boundingBox5[i5];
                    }
                }
            }
            int i6 = 0;
            while (i6 < 3) {
                float f4 = i6 == 2 ? 4096.0f : 256.0f;
                this.boundingBox[i6] = Math.min(f4, Math.max(0.0f, this.boundingBox[i6]));
                this.boundingBox[i6 + 3] = Math.min(f4, Math.max(0.0f, this.boundingBox[i6 + 3]));
                i6++;
            }
        }
    }
}
