package com.lumiyaviewer.lumiya.voice.common.model

import android.os.Bundle
import javax.annotation.Nonnull
import javax.annotation.concurrent.Immutable

@Immutable
class Voice3DPosition {

    @Nonnull
    val atOrientation: Voice3DVector

    @Nonnull
    val leftOrientation: Voice3DVector

    @Nonnull
    val position: Voice3DVector

    @Nonnull
    val upOrientation: Voice3DVector

    @Nonnull
    val velocity: Voice3DVector

    constructor(bundle: Bundle) {
        position = Voice3DVector(bundle.getBundle("position")!!)
        velocity = Voice3DVector(bundle.getBundle("velocity")!!)
        atOrientation = Voice3DVector(bundle.getBundle("atOrientation")!!)
        upOrientation = Voice3DVector(bundle.getBundle("upOrientation")!!)
        leftOrientation = Voice3DVector(bundle.getBundle("leftOrientation")!!)
    }

    constructor(
        @Nonnull position: Voice3DVector,
        @Nonnull velocity: Voice3DVector,
        @Nonnull atOrientation: Voice3DVector,
        @Nonnull upOrientation: Voice3DVector,
        @Nonnull leftOrientation: Voice3DVector
    ) {
        this.position = position
        this.velocity = velocity
        this.atOrientation = atOrientation
        this.upOrientation = upOrientation
        this.leftOrientation = leftOrientation
    }

    fun toBundle(): Bundle = Bundle().apply {
        putBundle("position", this@Voice3DPosition.position.toBundle())
        putBundle("velocity", this@Voice3DPosition.velocity.toBundle())
        putBundle("atOrientation", this@Voice3DPosition.atOrientation.toBundle())
        putBundle("upOrientation", this@Voice3DPosition.upOrientation.toBundle())
        putBundle("leftOrientation", this@Voice3DPosition.leftOrientation.toBundle())
    }

    override fun toString(): String = String.format(
        "(pos %s vel %s at %s up %s left %s)",
        position, velocity, atOrientation, upOrientation, leftOrientation
    )
}
