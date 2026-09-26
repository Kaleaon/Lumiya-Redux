package com.lumiyaviewer.lumiya.voice.common.model

import android.os.Bundle
import com.google.common.collect.Interner
import com.google.common.collect.Interners
import java.util.UUID
import javax.annotation.Nonnull
import javax.annotation.Nullable

class VoiceChatInfo private constructor(
    @Nonnull val state: VoiceChatState,
    @Nonnull val previousState: VoiceChatState,
    val numActiveSpeakers: Int,
    @Nullable val activeSpeakerID: UUID?,
    val isConference: Boolean,
    val localMicActive: Boolean
) {

    enum class VoiceChatState {
        None,
        Ringing,
        Connecting,
        Active
    }

    private constructor(bundle: Bundle) : this(
        VoiceChatState.valueOf(bundle.getString("state")!!),
        VoiceChatState.valueOf(bundle.getString("previousState")!!),
        bundle.getInt("numActiveSpeakers"),
        bundle.getString("activeSpeakerID")?.let { UUID.fromString(it) },
        bundle.getBoolean("isConference"),
        bundle.getBoolean("localMicActive")
    )

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || javaClass != other.javaClass) return false
        other as VoiceChatInfo
        if (numActiveSpeakers == other.numActiveSpeakers &&
            isConference == other.isConference &&
            localMicActive == other.localMicActive &&
            state == other.state &&
            previousState == other.previousState
        ) {
            return if (activeSpeakerID == null) other.activeSpeakerID == null else activeSpeakerID == other.activeSpeakerID
        }
        return false
    }

    override fun hashCode(): Int {
        return (((if (!isConference) 0 else 1) +
                (((activeSpeakerID?.hashCode() ?: 0) +
                        (((((state.hashCode() * 31) + previousState.hashCode()) * 31) + numActiveSpeakers) * 31)) * 31)) * 31) +
                if (localMicActive) 1 else 0
    }

    fun toBundle(): Bundle = Bundle().apply {
        putString("state", state.toString())
        putString("previousState", previousState.toString())
        putInt("numActiveSpeakers", numActiveSpeakers)
        putString("activeSpeakerID", activeSpeakerID?.toString())
        putBoolean("isConference", isConference)
        putBoolean("localMicActive", localMicActive)
    }

    override fun toString(): String =
        "VoiceChatInfo{state=$state, previousState=$previousState, numActiveSpeakers=$numActiveSpeakers, activeSpeakerID=$activeSpeakerID, isConference=$isConference, localMicActive=$localMicActive}"

    companion object {
        private val interner: Interner<VoiceChatInfo> = Interners.newWeakInterner()
        private val emptyChatState: VoiceChatInfo = interner.intern(
            VoiceChatInfo(VoiceChatState.None, VoiceChatState.None, 0, null, false, false)
        )

        @JvmStatic
        @Nonnull
        fun create(bundle: Bundle): VoiceChatInfo = interner.intern(VoiceChatInfo(bundle))

        @JvmStatic
        @Nonnull
        fun create(
            @Nonnull state: VoiceChatState,
            @Nonnull previousState: VoiceChatState,
            numActiveSpeakers: Int,
            @Nullable activeSpeakerID: UUID?,
            isConference: Boolean,
            localMicActive: Boolean
        ): VoiceChatInfo = interner.intern(
            VoiceChatInfo(state, previousState, numActiveSpeakers, activeSpeakerID, isConference, localMicActive)
        )

        @JvmStatic
        @Nonnull
        fun empty(): VoiceChatInfo = emptyChatState
    }
}
