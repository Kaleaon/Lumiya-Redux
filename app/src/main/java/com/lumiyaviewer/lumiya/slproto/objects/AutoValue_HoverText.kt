package com.lumiyaviewer.lumiya.slproto.objects

class AutoValue_HoverText(
    private val text: String,
    private val color: Int
) : HoverText() {

    init {
        // text is non-null by Kotlin's type system
    }

    fun color(): Int {
        return this.color
    }

    override fun equals(other: Any?): Boolean {
        if (other === this) {
            return true
        }
        if (other !is HoverText) {
            return false
        }
        return this.text == other.text() && this.color == other.color()
    }

    override fun hashCode(): Int {
        return ((this.text.hashCode() xor 1000003) * 1000003) xor this.color
    }

    fun text(): String {
        return this.text
    }

    override fun toString(): String {
        return "HoverText{text=$text, color=$color}"
    }
}
