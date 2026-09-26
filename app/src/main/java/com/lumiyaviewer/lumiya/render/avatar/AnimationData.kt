package com.lumiyaviewer.lumiya.render.avatar

import android.util.SparseArray
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBone
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.utils.LittleEndianDataInputStream
import java.io.IOException
import java.io.InputStream
import java.util.UUID

class AnimationData(val animationUUID: UUID, inputStream: InputStream) {

    private val animLength: Float
    private val animPriority: Int
    private val easeInTime: Float
    private val easeOutTime: Float
    private val expressionName: String
    private val handPose: Int
    private val inPoint: Float
    private val jointSets = SparseArray<AnimationJointSet>()
    private val loop: Boolean
    private val outPoint: Float

    private class AnimationJointData(
        littleEndianDataInputStream: LittleEndianDataInputStream,
        animLength: Float
    ) {
        val Priority: Int
        val posKeyframes: Array<AnimationPosKeyframe>
        val rotKeyframes: Array<AnimationRotKeyframe>

        init {
            Priority = littleEndianDataInputStream.readInt()
            var readInt = littleEndianDataInputStream.readInt()
            if (readInt < 0 || readInt > 10000) readInt = 0
            rotKeyframes = Array(readInt) {
                AnimationRotKeyframe(
                    uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), 0.0f, animLength),
                    LLQuaternion.unpackFromVector3(
                        LLVector3(
                            uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), -1.0f, 1.0f),
                            uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), -1.0f, 1.0f),
                            uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), -1.0f, 1.0f)
                        )
                    )
                )
            }
            var readInt2 = littleEndianDataInputStream.readInt()
            if (readInt2 < 0 || readInt2 > 10000) readInt2 = 0
            posKeyframes = Array(readInt2) {
                AnimationPosKeyframe(
                    uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), 0.0f, animLength),
                    LLVector3(
                        uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), -5.0f, LL_MAX_PELVIS_OFFSET),
                        uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), -5.0f, LL_MAX_PELVIS_OFFSET),
                        uint16ToFloat(littleEndianDataInputStream.readUnsignedShort(), -5.0f, LL_MAX_PELVIS_OFFSET)
                    )
                )
            }
        }

        fun animate(
            skeletonBone: SLSkeletonBone?,
            animLength: Float,
            time: Float,
            quaternions: Array<LLQuaternion>,
            vector3s: Array<LLVector3>,
            index: Int,
            factor: Float,
            floats: FloatArray,
            floats2: FloatArray,
            quaternion: LLQuaternion,
            vector3: LLVector3
        ) {
            if (posKeyframes.isNotEmpty()) {
                val posFactor = floats2[index] * factor
                animateArray(animLength, time, vector3, posKeyframes)
                if (skeletonBone != null && skeletonBone.boneID != SLSkeletonBoneID.mPelvis) {
                    vector3.sub(skeletonBone.basePosition)
                }
                vector3s[index].addMul(vector3, posFactor)
                floats2[index] = floats2[index] - posFactor
            }
            if (rotKeyframes.isNotEmpty()) {
                val rotFactor = floats[index] * factor
                animateArray(animLength, time, quaternion, rotKeyframes)
                quaternions[index].addMul(quaternion, rotFactor)
                floats[index] = floats[index] - rotFactor
            }
        }

        override fun toString(): String {
            val sb = StringBuilder()
            sb.append("Priority ").append(Priority)
            sb.append(", pos frames ").append(posKeyframes.size).append("[")
            for (keyframe in posKeyframes) sb.append(keyframe.toString())
            sb.append("], rot frames ").append(rotKeyframes.size).append("[")
            for (keyframe in rotKeyframes) sb.append(keyframe.toString())
            sb.append("]")
            return sb.toString()
        }

        companion object {
            private fun <T> animateArray(
                animLength: Float,
                time: Float,
                target: T,
                keyframes: Array<out AnimationKeyframe<T>>
            ): Boolean {
                if (keyframes.size == 1) {
                    keyframes[0].setTransform(target)
                    return true
                }
                for (i in keyframes.indices) {
                    if (time <= keyframes[i].time) {
                        if (time == keyframes[i].time) {
                            keyframes[i].setTransform(target)
                        } else {
                            var prev = i - 1
                            if (prev < 0) prev = 0
                            if (prev == i) {
                                keyframes[i].setTransform(target)
                            } else {
                                val nextTime = keyframes[i].time
                                var prevTime = keyframes[prev].time
                                if (prevTime > nextTime) {
                                    prevTime -= animLength
                                }
                                if (prevTime == nextTime) {
                                    keyframes[i].setTransform(target)
                                } else {
                                    keyframes[prev].setInterpolated(
                                        target,
                                        (nextTime - time) / (nextTime - prevTime),
                                        keyframes[i],
                                        (time - prevTime) / (nextTime - prevTime)
                                    )
                                }
                            }
                        }
                        return true
                    }
                }
                return false
            }

            fun uint16ToFloat(i: Int, min: Float, max: Float): Float {
                val range = max - min
                val value = (i * 1.5259022E-5f * range) + min
                return if (Math.abs(value) < range * 1.5259022E-5f) 0.0f else value
            }
        }
    }

    class AnimationJointSet internal constructor(
        private val animationUUID: UUID,
        private val animLength: Float,
        val priority: Int
    ) {
        private val jointAnims = SparseArray<AnimationJointData>()

        internal fun addJointData(index: Int, data: AnimationJointData) {
            jointAnims.put(index, data)
        }

        internal fun animate(
            avatarSkeleton: AvatarSkeleton,
            animationTiming: AnimationTiming,
            floats: FloatArray,
            floats2: FloatArray,
            quaternions: Array<LLQuaternion>,
            vector3s: Array<LLVector3>
        ) {
            val inAnimationTime = animationTiming.inAnimationTime
            val factor = animationTiming.inFactor * animationTiming.outFactor
            if (factor > 0.0f) {
                val quaternion = LLQuaternion()
                val vector3 = LLVector3()
                val size = jointAnims.size()
                for (i in 0 until size) {
                    val keyAt = jointAnims.keyAt(i)
                    jointAnims.valueAt(i).animate(
                        avatarSkeleton.getAnimatedBone(keyAt),
                        animLength, inAnimationTime,
                        quaternions, vector3s, keyAt, factor,
                        floats, floats2, quaternion, vector3
                    )
                }
            }
        }

        internal fun dumpJoints() {
            Debug.Printf("Anim -- joint set -- length %f prio %d joints %d",
                animLength, priority, jointAnims.size())
            val size = jointAnims.size()
            for (i in 0 until size) {
                Debug.Printf("Anim -- joint[%d] - jointIndex %d, %s",
                    i, jointAnims.keyAt(i), jointAnims.valueAt(i).toString())
            }
        }
    }

    private abstract class AnimationKeyframe<T>(val time: Float) {
        protected abstract fun getTransform(): T
        abstract fun setInterpolated(target: T, weight1: Float, other: AnimationKeyframe<T>, weight2: Float)
        abstract fun setTransform(target: T)
    }

    private class AnimationPosKeyframe(
        time: Float,
        private val position: LLVector3
    ) : AnimationKeyframe<LLVector3>(time) {

        override fun getTransform(): LLVector3 = position

        override fun setInterpolated(target: LLVector3, weight1: Float, other: AnimationKeyframe<LLVector3>, weight2: Float) {
            target.setLerp(position, weight1, other.getTransform(), weight2)
        }

        override fun setTransform(target: LLVector3) {
            target.set(position)
        }

        override fun toString(): String = position.toString()
    }

    private class AnimationRotKeyframe(
        time: Float,
        private val quaternion: LLQuaternion
    ) : AnimationKeyframe<LLQuaternion>(time) {

        override fun getTransform(): LLQuaternion = quaternion

        override fun setInterpolated(target: LLQuaternion, weight1: Float, other: AnimationKeyframe<LLQuaternion>, weight2: Float) {
            target.setLerp(quaternion, weight1, other.getTransform(), weight2)
        }

        override fun setTransform(target: LLQuaternion) {
            target.set(quaternion)
        }

        override fun toString(): String = quaternion.toString()
    }

    init {
        val littleEndianDataInputStream = LittleEndianDataInputStream(inputStream)
        littleEndianDataInputStream.skipBytes(4)
        animPriority = littleEndianDataInputStream.readInt()
        animLength = littleEndianDataInputStream.readFloat()
        expressionName = littleEndianDataInputStream.readZeroTerminatedString()
        inPoint = littleEndianDataInputStream.readFloat()
        outPoint = littleEndianDataInputStream.readFloat()
        loop = littleEndianDataInputStream.readInt() != 0
        easeInTime = littleEndianDataInputStream.readFloat()
        easeOutTime = littleEndianDataInputStream.readFloat()
        handPose = littleEndianDataInputStream.readInt()
        val readInt = littleEndianDataInputStream.readInt()
        for (j in 0 until readInt) {
            val skeletonBoneID = SLSkeletonBoneID.bones[littleEndianDataInputStream.readZeroTerminatedString()]
            val animationJointData = AnimationJointData(littleEndianDataInputStream, animLength)
            if (skeletonBoneID != null) {
                val animatedIndex = skeletonBoneID.animatedIndex
                if (animatedIndex >= 0) {
                    var animationJointSet = jointSets.get(animationJointData.Priority)
                    if (animationJointSet == null) {
                        animationJointSet = AnimationJointSet(animationUUID, animLength, animationJointData.Priority)
                        jointSets.put(animationJointData.Priority, animationJointSet)
                    }
                    animationJointSet.addJointData(animatedIndex, animationJointData)
                }
            }
        }
    }

    internal fun createRunningAnimations(avatarRunningSequence: AvatarRunningSequence): ImmutableList<AvatarRunningAnimation> {
        val size = jointSets.size()
        Debug.Printf("Animation: creating anims: %d anims", size)
        val builder = ImmutableList.builder<AvatarRunningAnimation>()
        for (i in 0 until size) {
            builder.add(AvatarRunningAnimation(avatarRunningSequence, jointSets.valueAt(i)))
        }
        return builder.build()
    }

    fun dumpAnimationData() {
        Debug.Printf(
            "Animation -- dump -- priority %d length %f joint sets %d (inPoint %f outPoint %f loop %b easeIn %f easeOut %f)",
            animPriority, animLength, jointSets.size(),
            inPoint, outPoint, loop, easeInTime, easeOutTime
        )
        for (i in 0 until jointSets.size()) {
            Debug.Printf("Anim -- joint set %d: prio %d", i, jointSets.keyAt(i))
            jointSets.valueAt(i).dumpJoints()
        }
        Debug.Printf("Animation -- dump end")
    }

    fun getPriority(): Int = animPriority

    internal fun updateAnimationTiming(
        currentTime: Long,
        startTime: Long,
        stopTime: Long,
        dontEaseIn: Boolean,
        animationTiming: AnimationTiming
    ): Boolean {
        val elapsed = (currentTime - startTime) / 1000.0f
        val stopElapsed = if (stopTime == -1L || currentTime < stopTime) -1.0f else (currentTime - stopTime) / 1000.0f
        val inAnimationTime = getInAnimationTime(elapsed, stopElapsed)
        val inFactor = getInFactor(elapsed)
        val outFactor = getOutFactor(elapsed, stopElapsed)
        val effectiveInFactor = if (dontEaseIn) 1.0f else inFactor
        var changed = false
        animationTiming.runningTime = elapsed
        if (animationTiming.inAnimationTime != inAnimationTime) {
            animationTiming.inAnimationTime = inAnimationTime
            changed = true
        }
        if (animationTiming.inFactor != effectiveInFactor) {
            animationTiming.inFactor = effectiveInFactor
            changed = true
        }
        if (animationTiming.outFactor != outFactor) {
            animationTiming.outFactor = outFactor
            return true
        }
        return changed
    }

    companion object {
        private const val LL_MAX_PELVIS_OFFSET = 5.0f

        @JvmStatic
        fun cubicStep(f: Float): Float {
            val clamped = Math.max(0.0f, Math.min(1.0f, f))
            return (3.0f - (clamped * 2.0f)) * clamped * clamped
        }
    }

    private fun getInAnimationTime(elapsed: Float, stopElapsed: Float): Float {
        if (!loop) return Math.min(elapsed, animLength)
        if (elapsed < inPoint) return elapsed
        if (stopElapsed < 0.0f) {
            return if (outPoint > inPoint) inPoint + ((elapsed - inPoint) % (outPoint - inPoint)) else inPoint
        }
        val result = if (outPoint > inPoint) {
            ((elapsed - stopElapsed) - (Math.floor(((elapsed - inPoint) / (outPoint - inPoint)).toDouble()).toFloat() * (outPoint - inPoint))) + stopElapsed
        } else {
            outPoint + stopElapsed
        }
        return Math.min(result, animLength)
    }

    private fun getInFactor(elapsed: Float): Float {
        if (elapsed >= easeInTime || easeInTime < 0.001f) return 1.0f
        val step = cubicStep(elapsed / easeInTime)
        return if (step > 1.0f) 1.0f else step
    }

    private fun getOutFactor(elapsed: Float): Float {
        var result = 1.0f
        if (elapsed >= 0.0f) {
            if (easeOutTime < 0.001f) return 0.0f
            result = cubicStep(1.0f - (elapsed / easeOutTime))
            if (result < 0.0f) return 0.0f
        }
        return result
    }

    private fun getOutFactor(elapsed: Float, stopElapsed: Float): Float {
        if (stopElapsed < 0.0f) {
            if (loop) return 1.0f
            val f3 = elapsed - (animLength - easeOutTime)
            return if (f3 >= 0.0f) getOutFactor(f3) else 1.0f
        }
        if (loop) {
            if (outPoint >= animLength) return getOutFactor(stopElapsed)
            val f4 = elapsed - stopElapsed
            return getOutFactor(
                elapsed - Math.max(
                    (if (outPoint > inPoint)
                        ((Math.floor(((f4 - inPoint) / (outPoint - inPoint)).toDouble()).toFloat() * (outPoint - inPoint)) + inPoint) + animLength
                    else
                        animLength + f4) - easeOutTime,
                    f4
                )
            )
        }
        var effectiveStopElapsed = stopElapsed
        val f5 = elapsed - (animLength - easeOutTime)
        if (f5 > 0.0f) {
            effectiveStopElapsed = Math.max(stopElapsed, f5)
        }
        return getOutFactor(effectiveStopElapsed)
    }
}
