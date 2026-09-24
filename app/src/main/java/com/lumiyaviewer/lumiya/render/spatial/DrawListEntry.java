package com.lumiyaviewer.lumiya.render.spatial;

import com.lumiyaviewer.lumiya.utils.InlineList;
import com.lumiyaviewer.lumiya.utils.InlineListEntry;
import javax.annotation.Nonnull;

public abstract class DrawListEntry implements InlineListEntry<DrawListEntry> {

    @Nonnull
    final float[] boundingBox = new float[6];
    private volatile InlineList<DrawListEntry> list;
    private DrawListEntry next;
    private DrawListEntry prev;

    public abstract void addToDrawList(@Nonnull DrawList drawList);

    @Override
    public InlineList<DrawListEntry> getList() {
        return this.list;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public DrawListEntry getNext() {
        return this.next;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public DrawListEntry getPrev() {
        return this.prev;
    }

    @Override
    public void requestEntryRemoval() {
        InlineList<DrawListEntry> inlineList = this.list;
        if (inlineList != null) {
            inlineList.requestEntryRemoval(this);
        }
    }

    @Override
    public void setList(InlineList<DrawListEntry> inlineList) {
        this.list = inlineList;
    }

    @Override
    public void setNext(DrawListEntry drawListEntry) {
        this.next = drawListEntry;
    }

    @Override
    public void setPrev(DrawListEntry drawListEntry) {
        this.prev = drawListEntry;
    }
}
