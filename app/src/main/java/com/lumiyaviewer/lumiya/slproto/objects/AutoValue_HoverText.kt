package com.lumiyaviewer.lumiya.slproto.objects

class AutoValue_HoverText : HoverText() {
    private var color: Int = 0
    private var text: String = ""

    constructor(text: String, color: Int) {
        if (text == null) {
            throw NullPointerException("Null text")
        }
        this.text = text
        this.color = color
    }
    fun color(): Int {
        return this.color
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is HoverText)) {
        return false
        }
        var hoverText: HoverText = obj as HoverText
        return this.text.equals(hoverText.text()) && this.color == hoverText.color()
    }

    fun hashCode(): Int {
        return ((this.text.hashCode() ^ 1000003) * 1000003) ^ this.color
    }
    fun text(): String {
        return this.text
    }

    fun toString(): String {
        return "HoverText{text=" + this.text + ", color=" + this.color + "}"
    }
}
