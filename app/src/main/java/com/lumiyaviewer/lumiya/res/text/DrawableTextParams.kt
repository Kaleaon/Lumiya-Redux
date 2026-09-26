package com.lumiyaviewer.lumiya.res.text

abstract class DrawableTextParams {
    abstract fun backgroundColor(): Int
    abstract fun text(): String

    companion object {
        @JvmStatic fun create(text: String, backgroundColor: Int): DrawableTextParams =
            AutoValue_DrawableTextParams(text, backgroundColor)
    }
}
