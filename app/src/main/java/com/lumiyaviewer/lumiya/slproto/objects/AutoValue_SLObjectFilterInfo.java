package com.lumiyaviewer.lumiya.slproto.objects;

final class AutoValue_SLObjectFilterInfo extends SLObjectFilterInfo {
    private final String filterText;
    private final float range;
    private final boolean showAttachments;
    private final boolean showNonDescriptive;
    private final boolean showNonTouchable;

    AutoValue_SLObjectFilterInfo(String filterText, boolean showAttachments, boolean showNonDescriptive, boolean showNonTouchable, float range) {
        if (filterText == null) {
            throw new NullPointerException("Null filterText");
        }
        this.filterText = filterText;
        this.showAttachments = showAttachments;
        this.showNonDescriptive = showNonDescriptive;
        this.showNonTouchable = showNonTouchable;
        this.range = range;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof SLObjectFilterInfo)) {
            return false;
        }
        SLObjectFilterInfo objectFilterInfo = (SLObjectFilterInfo) obj;
        if (this.filterText.equals(objectFilterInfo.filterText()) && this.showAttachments == objectFilterInfo.showAttachments() && this.showNonDescriptive == objectFilterInfo.showNonDescriptive() && this.showNonTouchable == objectFilterInfo.showNonTouchable()) {
            return Float.floatToIntBits(this.range) == Float.floatToIntBits(objectFilterInfo.range());
        }
        return false;
    }

    @Override
    public String filterText() {
        return this.filterText;
    }

    public int hashCode() {
        return (((((this.showNonDescriptive ? 1231 : 1237) ^ (((this.showAttachments ? 1231 : 1237) ^ ((this.filterText.hashCode() ^ 1000003) * 1000003)) * 1000003)) * 1000003) ^ (this.showNonTouchable ? 1231 : 1237)) * 1000003) ^ Float.floatToIntBits(this.range);
    }

    @Override
    public float range() {
        return this.range;
    }

    @Override
    public boolean showAttachments() {
        return this.showAttachments;
    }

    @Override
    public boolean showNonDescriptive() {
        return this.showNonDescriptive;
    }

    @Override
    public boolean showNonTouchable() {
        return this.showNonTouchable;
    }

    public String toString() {
        return "SLObjectFilterInfo{filterText=" + this.filterText + ", showAttachments=" + this.showAttachments + ", showNonDescriptive=" + this.showNonDescriptive + ", showNonTouchable=" + this.showNonTouchable + ", range=" + this.range + "}";
    }
}
