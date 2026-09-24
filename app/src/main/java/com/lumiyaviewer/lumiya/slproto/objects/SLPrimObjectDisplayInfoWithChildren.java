package com.lumiyaviewer.lumiya.slproto.objects;

import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo;
import javax.annotation.Nonnull;

public class SLPrimObjectDisplayInfoWithChildren extends SLPrimObjectDisplayInfo implements SLObjectDisplayInfo.HasChildrenObjects {

    @Nonnull
    public final ImmutableList<SLObjectDisplayInfo> children;
    private final boolean implicitlyAdded;

    public SLPrimObjectDisplayInfoWithChildren(SLObjectInfo objectInfo, float f, @Nonnull ImmutableList<SLObjectDisplayInfo> immutableList, boolean implicitlyAdded) {
        super(objectInfo, f);
        this.children = immutableList;
        this.implicitlyAdded = implicitlyAdded;
    }

    @Override
    @Nonnull
    public ImmutableList<SLObjectDisplayInfo> getChildren() {
        return this.children;
    }

    @Override
    public boolean isImplicitlyAdded() {
        return this.implicitlyAdded;
    }
}
