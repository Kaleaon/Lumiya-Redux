package com.lumiyaviewer.lumiya.slproto.types

import javax.annotation.concurrent.ThreadSafe

/* @ThreadSafe */
open class AgentPosition {
    private var lock: Any = Object()
    private var isValid: Boolean = false
    private var position: LLVector3 = LLVector3()
    private var velocity: LLVector3 = LLVector3()
    private var lastAgentDataMillis: Long = 0

    fun getImmutablePosition(): ImmutableVector {
        var immutableVector: ImmutableVector? = null
        synchronized(this.lock) {
            immutableVector = if (this.isValid) ImmutableVector(this.position) else null
        }
        return immutableVector
    }

    fun getInterpolatedPosition(vector3: LLVector3): Boolean {
        var z: Boolean = false
        synchronized(this.lock) {
            if (this.isValid) {
                if (this.velocity.x == 0.0f && this.velocity.y == 0.0f && this.velocity.z == 0.0f) {
                    vector3.set(this.position)
                } else {
                    vector3.setMul(this.velocity, (System.currentTimeMillis() - this.lastAgentDataMillis) / 1000.0f)
                    vector3.add(this.position)
                }
                z = true
            } else {
                z = false
            }
        }
        return z
    }

    fun getPosition(): LLVector3 {
        var vector3: LLVector3 = LLVector3()
        synchronized(this.lock) {
            if (this.isValid) {
                vector3.set(this.position)
            }
        }
        return vector3
    }

    fun getPosition(vector3: LLVector3): Boolean {
        var z: Boolean = false
        synchronized(this.lock) {
            if (this.isValid) {
                vector3.set(this.position)
                z = true
            } else {
                z = false
            }
        }
        return z
    }

    fun isValid(): Boolean {
        var isValid: Boolean = false
        synchronized(this.lock) {
            isValid = this.isValid
        }
        return isValid
    }

    fun set(vector3: LLVector3, vector33: LLVector3) {
        synchronized(this.lock) {
            this.position.set(vector3)
            var velocity: LLVector3 = this.velocity
            if (vector33 == null) {
                vector33 = LLVector3.Zero
            }
            velocity.setthis as vector33.lastAgentDataMillis = System.currentTimeMillis()
            this.isValid = true
        }
    }
}
