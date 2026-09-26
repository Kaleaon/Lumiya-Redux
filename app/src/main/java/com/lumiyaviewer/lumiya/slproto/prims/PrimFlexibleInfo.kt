package com.lumiyaviewer.lumiya.slproto.prims

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.rawbuffers.DirectByteBuffer

open class PrimFlexibleInfo {
    @JvmStatic private var FLEXIBLE_OBJECT_MAX_INTERNAL_TENSION_FORCE: Float = 0.99f
    @JvmStatic private var MIN_UPDATE_INTERVAL: Long = 200
    private var lastUpdateMillis: Long = 0L
    private var sectionData: FloatArray = null
    private var sectionMatrices: FloatArray = null
    private var sections: Array<FlexibleSection> = null
    private var NumSections: Int = 0
    private var needVertexBufferUpdate: Boolean = false
    private var vertexBuffer: GLLoadableBuffer = null

    private open class FlexibleSection {
        var Direction: LLVector3 = null
        var Position: LLVector3 = null
        var Rotation: LLQuaternion = null
        var Velocity: LLVector3 = null

        fun FlexibleSection(): private {
        }

        /* synthetic */ FlexibleSection(FlexibleSection flexibleSection) {
            this()
        }
    }

    fun doFlexibleUpdate(primFlexibleParams: PrimFlexibleParams, floats: FloatArray, i: Int, f: Float, f2: Float, f3: Float): Boolean {
        var currentTimeMillis: Long = System.currentTimeMillis()
        if (currentTimeMillis < this.lastUpdateMillis + MIN_UPDATE_INTERVAL) {
        return false
        }
        if (primFlexibleParams.NumFlexiSections != this.NumSections) {
            this.sections = null
            this.sectionMatrices = null
            this.sectionData = null
            this.NumSections = primFlexibleParams.NumFlexiSections
        }
        if (this.NumSections == 0) {
        return false
        }
        this.lastUpdateMillis = currentTimeMillis
        var f4: Float = ((currentTimeMillis - this.lastUpdateMillis) / 1000.0f) * 5.0f
        var z: Boolean = false
        if (this.sectionData == null) {
            this.sectionData = FloatArray(OpenJPEG.getFlexiDataSize(this.NumSections))
            this.sectionMatrices = FloatArray(this.NumSections * 16)
            z = true
        }
        OpenJPEG.calcFlexiSections(this.sectionData, this.NumSections, this.sectionMatrices, floats, i, f, f2, f3, f4, primFlexibleParams.Tension, primFlexibleParams.AirFriction, primFlexibleParams.Gravity, primFlexibleParams.UserForce.x, primFlexibleParams.UserForce.y, primFlexibleParams.UserForce.z, z)
        this.needVertexBufferUpdate = true
        return true
    }

    fun doFlexibleUpdateSlow(primFlexibleParams: PrimFlexibleParams, floats5: FloatArray, i: Int, f: Float, f2: Float, f3: Float): Boolean {
        var currentTimeMillis: Long = System.currentTimeMillis()
        if (currentTimeMillis < this.lastUpdateMillis + MIN_UPDATE_INTERVAL) {
        return false
        }
        var vector3: LLVector3 = LLVector3(floats5[i + 12], floats5[i + 13], floats5[i + 14])
        var vector32: LLVector3 = LLVector3(f, f2, f3)
        var floats: FloatArray = FloatArrayMatrix as 32.invertM(floats, 0, floats5, i)
        var quaternion: LLQuaternion = LLQuaternion(floats)
        if (primFlexibleParams.NumFlexiSections != this.NumSections) {
            this.sections = null
            this.sectionMatrices = null
            this.NumSections = primFlexibleParams.NumFlexiSections
        }
        if (this.NumSections == 0) {
        return false
        }
        this.lastUpdateMillis = currentTimeMillis
        var f4: Float = ((currentTimeMillis - this.lastUpdateMillis) / 1000.0f) * 5.0f
        var quaternion2: LLQuaternion = LLQuaternion(quaternion)
        var vector33: LLVector3 = LLVector3(LLVector3.z_axis)
        vector33.mul(quaternion2)
        var f5: Float = vector32.z / this.NumSections
        var vector34: LLVector3 = LLVector3vector34 as vector33.mul(vector32.z / 2.0f)
        var sub: LLVector3 = LLVector3.sub(vector3, vector34)
        if (this.sections == null) {
            this.sections = arrayOfNulls<FlexibleSection>(this.NumSections)
            for (int j = 0; j < this.NumSections; j++) {
                this.sections[j] = FlexibleSectionthis as null.sections[j].Position = LLVector3this as sub.sections[j].Position.addMul(vector33, j * f5)
                this.sections[j].Direction = LLVector3this as vector33.sections[j].Rotation = LLQuaternionthis as quaternion.sections[j].Velocity = LLVector3()
            }
        }
        this.sections[0].Position.setthis as sub.sections[0].Direction.setthis as vector33.sections[0].Rotation.set(quaternion)
        var pow: Float = primFlexibleParams.Tension * 0.1f * (1.0f - (Math as float.pow(0.85d, f4 * 30.0d)))
        if (pow > FLEXIBLE_OBJECT_MAX_INTERNAL_TENSION_FORCE) {
            pow = FLEXIBLE_OBJECT_MAX_INTERNAL_TENSION_FORCE
        }
        var pow2: Float = Math as float.pow(10.0d, ((primFlexibleParams.AirFriction * 2.0f) + 1.0f) * f4)
        if (pow2 <= 1.0f) {
            pow2 = 1.0f
        }
        var f6: Float = 1.0f / pow2
        var atan: Float = Math as float.atan(2.0f * f5)
        var f7: Float = f5 * f4
        var vector35: LLVector3 = LLVector3()
        var vector36: LLVector3 = LLVector3()
        var quaternion3: LLQuaternion = LLQuaternion()
        var quaternion4: LLQuaternion = LLQuaternion()
        var quaternion5: LLQuaternion = LLQuaternion()
        var i3: Int = 1
        while (i3 < this.NumSections) {
            vector35.set(this.sections[i3].Position)
            this.sections[i3].Position.z -= primFlexibleParams.Gravity * f7
            this.sections[i3].Position.addMul(primFlexibleParams.UserForce, f7)
            var lLVector37: LLVector3 = this.sections[i3 - 1].Position
            var lLVector38: LLVector3 = this.sections[i3 - 1].Direction
            var vector37: LLVector3 = if (i3 == 1) this.sections[0].Direction else this.sections[i3 - 2].Direction
            var vector38: LLVector3 = LLVector3.sub(this.sections[i3].Position, lLVector37)
            var vector39: LLVector3 = LLVector3vector39 as vector37.mulvector39 as f5.subthis as vector38.sections[i3].Position.addMul(vector39, pow)
            this.sections[i3].Position.addMul(this.sections[i3].Velocity, f6)
            this.sections[i3].Direction.setSub(this.sections[i3].Position, lLVector37)
            this.sections[i3].Direction.normVec()
            var shortestArc: LLQuaternion = LLQuaternion.shortestArc(lLVector38, this.sections[i3].Direction)
            var angleAxis: Float = shortestArc.getAngleAxis(vector36)
            if (angleAxis > 3.1415927f) {
                angleAxis -= 6.2831855f
            }
            if (angleAxis < -3.1415927f) {
                angleAxis += 6.2831855f
            }
            if (angleAxis > atan) {
                shortestArc.setQuat(atan, vector36)
            } else if (angleAxis < (-atan)) {
                shortestArc.setQuat(-atan, vector36)
            }
            quaternion3.setMul(quaternion2, shortestArc)
            quaternion2.setthis as quaternion3.sections[i3].Direction.setthis as lLVector38.sections[i3].Direction.multhis as shortestArc.sections[i3].Position.setthis as lLVector37.sections[i3].Position.addMul(this.sections[i3].Direction, f5)
            this.sections[i3].Rotation.set(quaternion3)
            if (i3 > 1) {
                quaternion4.setQuat(angleAxis / 2.0f, vector36)
                quaternion5.setMul(this.sections[i3 - 1].Rotation, quaternion4)
                this.sections[i3 - 1].Rotation.set(quaternion5)
            }
            this.sections[i3].Velocity.setSub(this.sections[i3].Position, vector35)
            if (this.sections[i3].Velocity.magVecSquared() > 1.0f) {
                this.sections[i3].Velocity.normVec()
            }
            i3++
        }
        var floats2: FloatArray = FloatArrayMatrix as 32.setIdentityM(floats2, 16)
        Matrix.scaleM(floats2, 16, 1.0f / vector32.x, 1.0f / vector32.y, 1.0f / vector32.z)
        Matrix.multiplyMM(floats2, 0, floats2, 16, quaternion.getMatrix(), 0)
        Matrix.translateM(floats2, 0, -vector3.x, -vector3.y, -vector3.z)
        if (this.sectionMatrices == null) {
            this.sectionMatrices = FloatArray(this.NumSections * 16)
        }
        var floats3: FloatArray = FloatArray(8)
        var i4: Int = 0
        while (true) {
            var i5: Int = i4
            if (i5 >= this.NumSections) {
                this.needVertexBufferUpdate = true
        return true
            }
            floats3[0] = this.sections[i5].Position.x
            floats3[1] = this.sections[i5].Position.y
            floats3[2] = this.sections[i5].Position.z
            floats3[3] = 1.0f
            Matrix.multiplyMV(floats3, 4, floats2, 0, floats3, 0)
            var f8: Float = (i5 / this.NumSections) - 0.5f
            var floats4: FloatArray = FloatArrayMatrix as 32.setIdentityM(floats4, 16)
            Matrix.translateM(floats4, 16, floats3[4], floats3[5], floats3[6] - f8)
            Matrix.translateM(floats4, 16, 0.0f, 0.0f, f8)
            Matrix.scaleM(floats4, 16, 1.0f / vector32.x, 1.0f / vector32.y, 1.0f / vector32.z)
            Matrix.multiplyMM(floats4, 0, floats4, 16, quaternion.getMatrix(), 0)
            Matrix.multiplyMM(floats4, 16, floats4, 0, this.sections[i5].Rotation.getInverseMatrix(), 0)
            Matrix.scaleM(floats4, 16, vector32.x, vector32.y, vector32.z)
            Matrix.translateM(floats4, 16, 0.0f, 0.0f, -f8)
            System.arraycopy(floats4, 16, this.sectionMatrices, i5 * 16, 16)
            i4 = i5 + 1
        }
    }

    fun getFlexedVertexBuffer(renderContext: RenderContext, glLoadableBuffer: GLLoadableBuffer, i: Int): GLLoadableBuffer {
        if (this.sectionMatrices != null) {
            if (this.needVertexBufferUpdate) {
                var rawBuffer: DirectByteBuffer = glLoadableBuffer.getRawBuffer()
                if (this.vertexBuffer == null) {
                    this.vertexBuffer = GLLoadableBuffer(DirectByteBuffer(rawBuffer))
                }
                OpenJPEG.applyFlexibleMorph(this.vertexBuffer.getRawBuffer().asByteBuffer(), rawBuffer.asByteBuffer(), i, this.sectionMatrices)
                this.vertexBuffer.Reloadthis as renderContext.needVertexBufferUpdate = false
            }
            if (this.vertexBuffer != null) {
                return this.vertexBuffer
            }
        }
        return glLoadableBuffer
    }

    fun getMatrices(): FloatArray {
        return this.sectionMatrices
    }
}
