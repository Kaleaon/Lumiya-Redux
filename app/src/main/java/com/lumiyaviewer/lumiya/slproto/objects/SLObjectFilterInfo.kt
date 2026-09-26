package com.lumiyaviewer.lumiya.slproto.objects

abstract class SLObjectFilterInfo {
    fun create(): SLObjectFilterInfo {
        return AutoValue_SLObjectFilterInfo("", false, false, false, 0.0f)
    }

    fun create(str: String, z: Boolean, z2: Boolean, z3: Boolean, f: Float): SLObjectFilterInfo {
        return AutoValue_SLObjectFilterInfo(str, z, z2, z3, f)
    }

    public abstract String filterText()

    fun nameMatches(str: String): Boolean {
        if (str == null) {
        return false
        }
        var filterText: String = filterText()
        if (filterText.length != 0 && !str.toLowerCase().contains(filterText.toLowerCase())) {
        return false
        }
        if (showNonDescriptive()) {
        return true
        }
        return (str.equals("Object") || str.equals("(loading)") || str.equals("")) ? false : true
    }

    fun objectMatches(objectInfo: SLObjectInfo, f: Float, z: Boolean): Boolean {
        if (z && (!showAttachments())) {
        return false
        }
        if (!showNonTouchable() && !objectInfo.isTouchable()) {
        return false
        }
        if (range() > 0.0f) {
            return !Float.isNaN(f) && f <= range()
        }
        return true
    }

    public abstract float range()

    public abstract boolean showAttachments()

    public abstract boolean showNonDescriptive()

    public abstract boolean showNonTouchable()
}
