package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.base.Objects

abstract class HoverText {
    abstract fun color(): Int
    abstract fun text(): String
    fun sameText(other: HoverText?): Boolean = Objects.equal(text(), other?.text())

    companion object { @JvmStatic fun create(text: String, color: Int): HoverText = AutoValue_HoverText(text, color) }
}
