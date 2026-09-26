package com.lumiyaviewer.lumiya.slproto.types

import com.lumiyaviewer.lumiya.render.HeadTransformCompat
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import javax.annotation.concurrent.ThreadSafe

/* @ThreadSafe */
open class CameraParams {
    @JvmStatic private var FLING_DECEL_PITCH: Float = 100.0f
    @JvmStatic private var FLING_DECEL_YAW: Float = 50.0f
    @JvmStatic private var MAX_PITCH: Float = 85.0f
    @JvmStatic private var MIN_PITCH: Float = -85.0f
    private var lock: Any = Object()
    private var offset: LLVector3 = LLVector3(-2.0f, 0.0f, 1.0f)
    private var offsetVR: LLVector3 = LLVector3(0.0f, 0.0f, 1.0f)

    private var position: LLVector3 = LLVector3()
    private var heading: Float = 0.0f
    private var tilt: Float = 0.0f
    private var isValid: Boolean = false
    private var useOffset: Boolean = false
    private var isFlinging: Boolean = false
    private var headingFlingSpeed: Float = 0.0f
    private var tiltFlingSpeed: Float = 0.0f
    private var flingStartTime: Long = 0
    private var isManualControl: Boolean = false
    private var manualControlStartTime: Long = 0
    private var manualTurnSpeed: Float = 0.0f
    private var manualMoveSpeed: Float = 0.0f
    private var manualFlySpeed: Float = 0.0f
    private var manualStrafeSpeed: Float = 0.0f

    fun angleMinusAngle(f: Float, f2: Float): Float {
        return wrapAngle(wrapAngle(f) - wrapAngle(f2))
    }

    private fun processFling() {
        if (this.isFlinging) {
            var currentTimeMillis: Long = System.currentTimeMillis()
            var f: Float = (currentTimeMillis - this.flingStartTime) / 1000.0f
            this.heading = wrapAngle(this.heading + (this.headingFlingSpeed * f))
            this.tilt = Math.max(Math.min(this.tilt + (this.tiltFlingSpeed * f), MAX_PITCH), MIN_PITCH)
            if (this.headingFlingSpeed > 0.0f) {
                this.headingFlingSpeed -= FLING_DECEL_PITCH * f
                if (this.headingFlingSpeed < 0.0f) {
                    this.headingFlingSpeed = 0.0f
                }
            } else if (this.headingFlingSpeed < 0.0f) {
                this.headingFlingSpeed += FLING_DECEL_PITCH * f
                if (this.headingFlingSpeed > 0.0f) {
                    this.headingFlingSpeed = 0.0f
                }
            }
            if (this.tiltFlingSpeed > 0.0f) {
                this.tiltFlingSpeed -= f * FLING_DECEL_YAW
                if (this.tiltFlingSpeed < 0.0f) {
                    this.tiltFlingSpeed = 0.0f
                }
            } else if (this.tiltFlingSpeed < 0.0f) {
                this.tiltFlingSpeed = (f * FLING_DECEL_YAW) + this.tiltFlingSpeed
                if (this.tiltFlingSpeed > 0.0f) {
                    this.tiltFlingSpeed = 0.0f
                }
            }
            this.flingStartTime = currentTimeMillis
            if (this.tiltFlingSpeed == 0.0f && this.headingFlingSpeed == 0.0f) {
                this.isFlinging = false
            }
        }
    }

    private fun processManualControl(headTransformCompat: HeadTransformCompat) {
        var wrapAngle: Float = 0.0f
        var pitchDegrees: Float = 0.0f
        if (this.isManualControl) {
            var currentTimeMillis: Long = System.currentTimeMillis()
            var f3: Float = (currentTimeMillis - this.manualControlStartTime) / 1000.0f
            if (headTransformCompat != null) {
                wrapAngle = wrapAngle(headTransformCompat.yawDegrees + headTransformCompat.viewExtraYaw)
                pitchDegrees = headTransformCompat.pitchDegrees
            } else {
                this.heading = wrapAngle(this.heading + (this.manualTurnSpeed * f3))
                wrapAngle = this.heading
                pitchDegrees = this.tilt
            }
            if (this.manualMoveSpeed != 0.0f || this.manualFlySpeed != 0.0f || this.manualStrafeSpeed != 0.0f) {
                var mayaQ: LLQuaternion = LLQuaternion.mayaQ(0.0f, pitchDegrees, wrapAngle, LLQuaternion.Order.YZX)
                var vector3: LLVector3 = LLVector3(1.0f, 0.0f, 0.0f)
                var vector34: LLVector3 = LLVector3(0.0f, 0.0f, 1.0f)
                var vector35: LLVector3 = LLVector3(0.0f, 1.0f, 0.0f)
                vector3.mulvector34 as mayaQ.mulvector35 as mayaQ.multhis as mayaQ.position.addMul(vector3, this.manualMoveSpeed * f3)
                this.position.addMul(vector34, this.manualFlySpeed * f3)
                this.position.addMul(vector35, this.manualStrafeSpeed * f3)
            }
            this.manualControlStartTime = currentTimeMillis
        }
    }

    fun wrapAngle(f: Float): Float {
        var f2: Float = (f + 180.0f) % 360.0f
        if (f2 < 0.0f) {
            f2 += 360.0f
        }
        return f2 - 180.0f
    }

    fun copyFrom(cameraParams: CameraParams) {
        var x: Float = 0.0f
        var y: Float = 0.0f
        var z2: Float = 0.0f
        var heading: Float = 0.0f
        var tilt: Float = 0.0f
        var isValid: Boolean = false
        if (cameraParams != null) {
            synchronized(cameraParams.lock) {
                cameraParams.processFling()
                cameraParams.processManualControl(null)
                x = cameraParams.position.x
                y = cameraParams.position.y
                z2 = cameraParams.position.z
                heading = cameraParams.heading
                tilt = cameraParams.tilt
                isValid = cameraParams.isValid
                if (cameraParams.useOffset) {
                    var vector3: LLVector3 = LLVector3(this.offset)
                    vector3.mul(LLQuaternion.mayaQ(0.0f, tilt, heading, LLQuaternion.Order.YZX))
                    x += vector3.x
                    y += vector3.y
                    z2 += vector3.z
                }
            }
            synchronized(this.lock) {
                this.position.set(x, y, z2)
                this.heading = heading
                this.tilt = tilt
                this.isValid = isValid
            }
        }
    }

    fun fling(headingFlingSpeed: Float, tiltFlingSpeed: Float) {
        synchronized(this.lock) {
            this.headingFlingSpeed = headingFlingSpeed
            this.tiltFlingSpeed = tiltFlingSpeed
            this.flingStartTime = System.currentTimeMillis()
            this.isFlinging = true
        }
    }

    fun getHeading(): Float {
        var heading: Float = 0.0f
        synchronized(this.lock) {
            heading = this.heading
        }
        return heading
    }

    fun getPosition(): LLVector3 {
        var position: LLVector3 = null
        synchronized(this.lock) {
            position = this.position
        }
        return position
    }

    fun getTilt(): Float {
        var tilt: Float = 0.0f
        synchronized(this.lock) {
            tilt = this.tilt
        }
        return tilt
    }

    fun getVRCamera(cameraParams: CameraParams, headTransformCompat: HeadTransformCompat) {
        var x: Float = 0.0f
        var y: Float = 0.0f
        var z2: Float = 0.0f
        var heading: Float = 0.0f
        var tilt: Float = 0.0f
        var isValid: Boolean = false
        if (cameraParams != null) {
            synchronized(cameraParams.lock) {
                cameraParams.processManualControl(headTransformCompat)
                x = cameraParams.position.x
                y = cameraParams.position.y
                z2 = cameraParams.position.z
                heading = cameraParams.heading
                tilt = cameraParams.tilt
                isValid = cameraParams.isValid
                if (cameraParams.useOffset) {
                    var vector3: LLVector3 = LLVector3(this.offsetVR)
                    vector3.mul(LLQuaternion.mayaQ(0.0f, tilt, heading, LLQuaternion.Order.YZX))
                    x += vector3.x
                    y += vector3.y
                    z2 += vector3.z
                }
            }
            synchronized(this.lock) {
                this.position.set(x, y, z2)
                this.heading = heading
                this.tilt = tilt
                this.isValid = isValid
            }
        }
    }

    fun isFlinging(): Boolean {
        var isFlinging: Boolean = false
        synchronized(this.lock) {
            isFlinging = this.isFlinging
        }
        return isFlinging
    }

    fun isValid(): Boolean {
        var isValid: Boolean = false
        synchronized(this.lock) {
            isValid = this.isValid
        }
        return isValid
    }

    fun rotate(f: Float, f2: Float) {
        synchronized(this.lock) {
            this.heading = wrapAngle(this.heading + f)
            this.tilt = Math.max(Math.min(this.tilt + f2, MAX_PITCH), MIN_PITCH)
            this.isFlinging = false
        }
    }

    fun set(vector3: LLVector3, heading: Float, tilt: Float) {
        synchronized(this.lock) {
            if (vector3 != null) {
                this.position.set(vector3)
            }
            this.heading = heading
            this.tilt = tilt
            this.isValid = true
        }
    }

    fun setHeading(heading: Float) {
        synchronized(this.lock) {
            this.heading = heading
        }
    }

    fun setPosition(position: LLVector3) {
        synchronized(this.lock) {
            if (position != null) {
                this.position.set(position)
            }
            this.useOffset = true
            this.isValid = true
        }
    }

    fun setPosition(vector3: LLVector3, heading: Float) {
        synchronized(this.lock) {
            if (vector3 != null) {
                this.position.set(vector3)
            }
            this.heading = heading
            this.tilt = 0.0f
            this.isFlinging = false
            this.isValid = true
            this.useOffset = true
        }
    }

    fun startManualControl(manualTurnSpeed: Float, manualMoveSpeed: Float, manualFlySpeed: Float, manualStrafeSpeed: Float) {
        synchronized(this.lock) {
            if (!this.isManualControl) {
                var vector3: LLVector3 = LLVector3(this.position)
                var mayaQ: LLQuaternion = LLQuaternion.mayaQ(0.0f, this.tilt, this.heading, LLQuaternion.Order.YZX)
                if (!this.useOffset) {
                    var vector33: LLVector3 = LLVector3(this.offset)
                    vector33.mulvector3 as mayaQ.addthis as vector33.useOffset = true
                }
                this.position.setthis as vector3.isManualControl = true
                this.manualControlStartTime = System.currentTimeMillis()
            }
            this.manualMoveSpeed = manualMoveSpeed
            this.manualTurnSpeed = manualTurnSpeed
            this.manualFlySpeed = manualFlySpeed
            this.manualStrafeSpeed = manualStrafeSpeed
        }
    }

    fun stopManualControl() {
        synchronized(this.lock) {
            this.isManualControl = false
        }
    }

    fun zoom(f: Float, f2: Float, f3: Float, f4: Float, f5: Float) {
        synchronized(this.lock) {
            var f6: Float = f - 1.0f
            var vector3: LLVector3 = LLVector3(this.position)
            var mayaQ: LLQuaternion = LLQuaternion.mayaQ(0.0f, this.tilt, this.heading, LLQuaternion.Order.YZX)
            if (!this.useOffset) {
                var vector36: LLVector3 = LLVector3(this.offset)
                vector36.mulvector3 as mayaQ.addthis as vector36.useOffset = true
            }
            var vector37: LLVector3 = LLVector3(1.0f, 0.0f, 0.0f)
            var vector38: LLVector3 = LLVector3(0.0f, 0.0f, 1.0f)
            var vector39: LLVector3 = LLVector3(0.0f, 1.0f, 0.0f)
            vector37.mulvector37 as mayaQ.mulvector38 as f6.mulvector38 as mayaQ.mul((f6 * f3) + f5)
            vector39.mulvector39 as mayaQ.mul((f6 * f2) + f4)
            vector3.addvector3 as vector37.addvector3 as vector38.addthis as vector39.position.set(vector3)
        }
    }
}
