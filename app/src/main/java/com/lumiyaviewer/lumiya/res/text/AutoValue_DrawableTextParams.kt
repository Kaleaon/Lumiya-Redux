package com.lumiyaviewer.lumiya.res.text

internal class AutoValue_DrawableTextParams(
    private val text: String,
    private val backgroundColor: Int
) : DrawableTextParams() {

    init {
        // Preserve null-check contract from original AutoValue
        @Suppress("SENSELESS_COMPARISON")
        if (text == null) {
            throw NullPointerException("Null text")
        }
    }

    override fun backgroundColor(): Int = backgroundColor

    override fun text(): String = text

    override fun equals(other: Any?): Boolean {
        if (other === this) return true
        if (other !is DrawableTextParams) return false
        return text == other.text() && backgroundColor == other.backgroundColor()
    }

    override fun hashCode(): Int {
        return ((text.hashCode() xor 1000003) * 1000003) xor backgroundColor
    }

    override fun toString(): String {
        return "DrawableTextParams{text=$text, backgroundColor=$backgroundColor}"
    }
}
