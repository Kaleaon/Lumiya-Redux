package com.lumiyaviewer.lumiya.render.avatar

import java.util.UUID

class AnimationSequenceInfo private constructor(
    @JvmField val animationID: UUID,
    @JvmField val sequenceID: Int,
    @JvmField val runningSince: Long,
    @JvmField val stoppingSequenceID: Int,
    @JvmField val stoppingRunningSince: Long,
    @JvmField val stoppingEasingOutSince: Long,
    @JvmField val dontEaseIn: Boolean
) {
    fun hasStopped(now: Long): Boolean {
        return sequenceID == INVALID_SEQUENCE_ID &&
            (stoppingSequenceID == INVALID_SEQUENCE_ID || now >= stoppingEasingOutSince + MAX_ANIMATION_LENGTH)
    }

    companion object {
        private const val INVALID_SEQUENCE_ID = 0
        private const val INVALID_TIMESTAMP = -1L
        const val MAX_ANIMATION_LENGTH = 60000L

        @JvmStatic
        fun newSequence(animationID: UUID, runningSince: Long, sequenceID: Int): AnimationSequenceInfo {
            return AnimationSequenceInfo(
                animationID, sequenceID, runningSince,
                INVALID_SEQUENCE_ID, INVALID_TIMESTAMP, INVALID_TIMESTAMP, false
            )
        }

        @JvmStatic
        fun restartSequence(runningSince: Long, sequenceID: Int, previous: AnimationSequenceInfo): AnimationSequenceInfo {
            return if (previous.sequenceID != INVALID_SEQUENCE_ID) {
                AnimationSequenceInfo(
                    previous.animationID, sequenceID, runningSince,
                    previous.sequenceID, previous.runningSince, runningSince, true
                )
            } else {
                AnimationSequenceInfo(
                    previous.animationID, sequenceID, runningSince,
                    previous.stoppingSequenceID, previous.stoppingRunningSince, previous.stoppingRunningSince, true
                )
            }
        }

        @JvmStatic
        fun stopSequence(now: Long, previous: AnimationSequenceInfo): AnimationSequenceInfo? {
            if (previous.sequenceID != INVALID_SEQUENCE_ID) {
                return AnimationSequenceInfo(
                    previous.animationID, INVALID_SEQUENCE_ID, INVALID_TIMESTAMP,
                    previous.sequenceID, previous.runningSince, now, previous.dontEaseIn
                )
            }
            return null
        }
    }
}
