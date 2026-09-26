package com.lumiyaviewer.lumiya.slproto.objects

class AutoValue_SLObjectFilterInfo : SLObjectFilterInfo() {
    private var filterText: String = ""
    private var range: Float = 0.0f
    private var showAttachments: Boolean = false
    private var showNonDescriptive: Boolean = false
    private var showNonTouchable: Boolean = false

    constructor(filterText: String, showAttachments: Boolean, showNonDescriptive: Boolean, showNonTouchable: Boolean, range: Float) {
        if (filterText == null) {
            throw NullPointerException("Null filterText")
        }
        this.filterText = filterText
        this.showAttachments = showAttachments
        this.showNonDescriptive = showNonDescriptive
        this.showNonTouchable = showNonTouchable
        this.range = range
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is SLObjectFilterInfo)) {
        return false
        }
        var objectFilterInfo: SLObjectFilterInfo = obj as SLObjectFilterInfo
        if (this.filterText.equals(objectFilterInfo.filterText()) && this.showAttachments == objectFilterInfo.showAttachments() && this.showNonDescriptive == objectFilterInfo.showNonDescriptive() && this.showNonTouchable == objectFilterInfo.showNonTouchable()) {
            return Float.floatToIntBits(this.range) == Float.floatToIntBits(objectFilterInfo.range())
        }
        return false
    }
    fun filterText(): String {
        return this.filterText
    }

    fun hashCode(): Int {
        return (((((if (this.showNonDescriptive) 1231 else 1237) ^ (((if (this.showAttachments) 1231 else 1237) ^ ((this.filterText.hashCode() ^ 1000003) * 1000003)) * 1000003)) * 1000003) ^ (if (this.showNonTouchable) 1231 else 1237)) * 1000003) ^ Float.floatToIntBits(this.range)
    }
    fun range(): Float {
        return this.range
    }
    fun showAttachments(): Boolean {
        return this.showAttachments
    }
    fun showNonDescriptive(): Boolean {
        return this.showNonDescriptive
    }
    fun showNonTouchable(): Boolean {
        return this.showNonTouchable
    }

    fun toString(): String {
        return "SLObjectFilterInfo{filterText=" + this.filterText + ", showAttachments=" + this.showAttachments + ", showNonDescriptive=" + this.showNonDescriptive + ", showNonTouchable=" + this.showNonTouchable + ", range=" + this.range + "}"
    }
}
