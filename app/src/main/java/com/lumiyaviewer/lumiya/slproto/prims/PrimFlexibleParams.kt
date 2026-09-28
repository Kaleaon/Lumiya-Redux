package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer

open class PrimFlexibleParams {
    var AirFriction: Float = 0.0f
    var Gravity: Float = 0.0f
    var NumFlexiSections: Int = 0
    var Tension: Float = 0.0f
    var UserForce: LLVector3? = null
    var WindSensitivity: Float = 0.0f

    constructor(byteBuffer: ByteBuffer, i: Int) {
        var b: Byte = byteBuffer.get()
        var b2: Byte = byteBuffer.get()
        this.Tension = (b & 0x7F) / 10.0f
        this.AirFriction = (b2 & 0x7F) / 10.0f
        var i2: Int = (b & 128) != if (0) 2 else 0
        this.NumFlexiSections = (1 << ((b2 & 128) != if (0) i2 | 1 else i2)) + 1
        this.Gravity = ((byteBuffer.get() & 0xFF) / 10.0f) - 10.0f
        this.WindSensitivity = (byteBuffer.get() & 0xFF) / 10.0f
        if (byteBuffer.position() < i) {
            this.UserForce = LLVector3.parseFloatVec(byteBuffer)
        } else {
            this.UserForce = LLVector3.Zero
        }
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is PrimFlexibleParams)) {
        return false
        }
        var primFlexibleParams: PrimFlexibleParams = obj as PrimFlexibleParams
        return this.Tension == primFlexibleParams.Tension && this.AirFriction == primFlexibleParams.AirFriction && this.Gravity == primFlexibleParams.Gravity && this.WindSensitivity == primFlexibleParams.WindSensitivity && this.NumFlexiSections == primFlexibleParams.NumFlexiSections && !(this.UserForce.equals(primFlexibleParams.UserForce) ^ true)
    }

    fun hashCode(): Int {
        return Float.floatToRawIntBits(this.Tension) + 0 + Float.floatToRawIntBits(this.AirFriction) + Float.floatToRawIntBits(this.Gravity) + Float.floatToRawIntBits(this.WindSensitivity) + this.NumFlexiSections + this.UserForce.hashCode()
    }
}
