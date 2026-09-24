package com.lumiyaviewer.lumiya.slproto.objects;

import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry;
import com.lumiyaviewer.lumiya.render.spatial.DrawListPrimEntry;
import javax.annotation.Nonnull;

public class SLObjectPrimInfo extends SLObjectInfo {
    @Override
    @Nonnull
    protected DrawListObjectEntry createDrawListEntry() {
        return new DrawListPrimEntry(this);
    }

    @Override
    public boolean isAvatar() {
        return false;
    }
}
