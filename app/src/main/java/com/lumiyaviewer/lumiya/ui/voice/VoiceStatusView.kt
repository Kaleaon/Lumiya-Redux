package com.lumiyaviewer.lumiya.ui.voice

import android.content.Context
import android.graphics.drawable.AnimationDrawable
import android.util.AttributeSet
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.View
import android.view.animation.AnimationUtils
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.SeekBar
import androidx.core.content.ContextCompat
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GridConnectionService
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.VoiceStatusBinding
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.ui.render.OnHoverListenerCompat
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceAudioProperties
import com.lumiyaviewer.lumiya.voice.common.model.VoiceAudioDevice
import com.lumiyaviewer.lumiya.voice.common.model.VoiceBluetoothState
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo

class VoiceStatusView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0,
    defStyleRes: Int = 0
) : FrameLayout(context, attrs, defStyleAttr, defStyleRes) {

    private lateinit var binding: VoiceStatusBinding
    private var chatterID: ChatterID? = null
    private var activeChatterID: ChatterID? = null
    private var speakerNameRetriever: ChatterNameRetriever? = null
    private var activeChatterNameRetriever: ChatterNameRetriever? = null
    private var showActiveChatterName = false
    private var showWhenInactive = false
    private var canConnect = false
    private var hoverEnabled = false
    private var onCallButtonListener: OnClickListener? = null
    private var updatingAudioVolume = false

    private val voiceAudioProperties = SubscriptionData<SubscriptionSingleKey, VoiceAudioProperties>(
        UIThreadExecutor.getInstance()
    ) { onVoiceAudioProperties(it as VoiceAudioProperties) }

    private val voiceChatInfo = SubscriptionData<ChatterID, VoiceChatInfo>(
        UIThreadExecutor.getInstance()
    ) { onVoiceChatInfo(it as VoiceChatInfo) }

    private val onActiveSpeakerNameUpdated = ChatterNameRetriever.OnChatterNameUpdated { retriever ->
        Debug.Printf("Voice: chatter name updated: %s", retriever.resolvedName)
        updateVoiceState()
    }

    private val volumeChangeListener = object : SeekBar.OnSeekBarChangeListener {
        override fun onProgressChanged(seekBar: SeekBar, progress: Int, fromUser: Boolean) {
            if (fromUser && !updatingAudioVolume) {
                val volume = progress.toFloat() / seekBar.max
                val client = GridConnectionService.getServiceInstance()?.webRTCVoiceClient ?: return
                client.setSpeakerVolume(volume)
            }
        }
        override fun onStartTrackingTouch(seekBar: SeekBar) {}
        override fun onStopTrackingTouch(seekBar: SeekBar) {}
    }

    init {
        LayoutInflater.from(context).inflate(R.layout.voice_status, this, true)
        initializeControls()
    }

    private fun initializeControls() {
        binding = VoiceStatusBinding.bind(getChildAt(0))
        binding.voiceAnswerButton.setOnClickListener { onVoiceAnswerButton() }
        binding.voiceBluetoothButton.setOnClickListener { onVoiceBluetoothButton() }
        binding.voiceLoudspeakerButton.setOnClickListener { onLoudspeakerButton() }
        binding.voiceMicOffButton.setOnClickListener { onVoiceMicOffButton() }
        binding.voiceMicOnButton.setOnClickListener { onVoiceMicOnButton() }
        binding.voiceStatusCardView.setOnClickListener { onVoiceStatusCardClick() }
        binding.voiceTerminateButton.setOnClickListener { onVoiceTerminateButton() }
        updateVoiceState()
        binding.voiceSpeakerVolumeControl.setOnSeekBarChangeListener(volumeChangeListener)
    }

    fun onVoiceAudioProperties(props: VoiceAudioProperties) {
        Debug.Printf("Voice: voice audio properties updated, bluetooth state %s",
            props.bluetoothState)
        updateVoiceState()
    }

    fun onVoiceChatInfo(info: VoiceChatInfo) {
        updateVoiceState(info)
    }

    private fun updateVoiceState(data: VoiceChatInfo? = voiceChatInfo.data) {
        Debug.Printf("VoiceStatusView: voice state %s", data)

        var newActiveChatterID: ChatterID.ChatterIDUser? = null

        if (data == null || data.state == VoiceChatInfo.VoiceChatState.None) {
            binding.voiceStatusControls.visibility = GONE
            if (showWhenInactive) {
                visibility = VISIBLE
                binding.voiceStatusText.setText(R.string.voice_not_connected)
                if (canConnect) {
                    binding.voiceStatusSmallText.setText(R.string.voice_tap_to_connect)
                    binding.voiceStatusSmallText.visibility = VISIBLE
                } else {
                    binding.voiceStatusSmallText.visibility = GONE
                }
                binding.voiceSpeakIndicatorLeft.visibility = INVISIBLE
                binding.voiceSpeakIndicatorRight.visibility = INVISIBLE
                binding.voiceTerminateButton.visibility = INVISIBLE
                binding.voiceMicOnButton.visibility = INVISIBLE
                binding.voiceMicOffButton.visibility = INVISIBLE
                binding.voiceAnswerButton.visibility = if (canConnect) VISIBLE else INVISIBLE
            } else {
                visibility = GONE
            }
        } else {
            visibility = VISIBLE
            binding.voiceTerminateButton.visibility = VISIBLE
            val isActive = data.state == VoiceChatInfo.VoiceChatState.Active
            binding.voiceMicOnButton.visibility = if (isActive && data.localMicActive) VISIBLE else INVISIBLE
            binding.voiceMicOffButton.visibility = if (isActive && !data.localMicActive) VISIBLE else INVISIBLE
            binding.voiceAnswerButton.visibility = if (data.state == VoiceChatInfo.VoiceChatState.Ringing) VISIBLE else INVISIBLE

            var statusText: String? = null

            if (data.state == VoiceChatInfo.VoiceChatState.Active && data.numActiveSpeakers != 0) {
                if (binding.voiceSpeakIndicatorLeft.visibility != VISIBLE || binding.voiceSpeakIndicatorRight.visibility != VISIBLE) {
                    binding.voiceSpeakIndicatorLeft.visibility = VISIBLE
                    binding.voiceSpeakIndicatorRight.visibility = VISIBLE
                    (binding.voiceSpeakIndicatorLeft.drawable as? AnimationDrawable)?.start()
                    (binding.voiceSpeakIndicatorRight.drawable as? AnimationDrawable)?.start()
                }
                if (data.numActiveSpeakers == 1 && data.activeSpeakerID != null && chatterID != null) {
                    newActiveChatterID = ChatterID.getUserChatterID(chatterID!!.agentUUID, data.activeSpeakerID)
                    statusText = if (speakerNameRetriever != null && Objects.equal(newActiveChatterID, speakerNameRetriever!!.chatterID)) {
                        speakerNameRetriever!!.resolvedName
                    } else null
                }
                Debug.Printf("Voice: numActiveSpeakers %d, speakerName %s, activeChatterID %s (view chatterID %s)",
                    data.numActiveSpeakers, statusText, newActiveChatterID, chatterID)
                if (statusText == null && data.numActiveSpeakers != 1) {
                    statusText = context.getString(R.string.speakers_speaking, data.numActiveSpeakers)
                }
            } else if (data.state == VoiceChatInfo.VoiceChatState.Ringing) {
                binding.voiceSpeakIndicatorLeft.visibility = VISIBLE
                binding.voiceSpeakIndicatorRight.visibility = VISIBLE
            } else {
                binding.voiceSpeakIndicatorLeft.visibility = INVISIBLE
                binding.voiceSpeakIndicatorRight.visibility = INVISIBLE
            }

            if (statusText == null) {
                statusText = when (data.state) {
                    VoiceChatInfo.VoiceChatState.Active ->
                        if (data.localMicActive) context.getString(R.string.voice_status_speak_now)
                        else context.getString(R.string.voice_status_tap_mic)
                    VoiceChatInfo.VoiceChatState.Connecting -> context.getString(R.string.voice_status_connecting)
                    VoiceChatInfo.VoiceChatState.Ringing -> context.getString(R.string.voice_status_ringing)
                    else -> null
                }
            }

            val resolvedName = if (showActiveChatterName) activeChatterNameRetriever?.resolvedName else null
            if (resolvedName != null) {
                binding.voiceStatusSmallText.visibility = VISIBLE
                binding.voiceStatusText.text = resolvedName
                binding.voiceStatusSmallText.text = statusText
            } else {
                binding.voiceStatusSmallText.text = null
                binding.voiceStatusText.text = statusText
                binding.voiceStatusSmallText.visibility = GONE
                if (data.state == VoiceChatInfo.VoiceChatState.Active && data.localMicActive) {
                    binding.voiceStatusSmallText.setText(R.string.tap_for_audio_controls)
                    binding.voiceStatusSmallText.visibility = VISIBLE
                }
            }
        }

        if (!Objects.equal(activeChatterID, newActiveChatterID)) {
            Debug.Printf("Voice: new activeChatterID %s", newActiveChatterID)
            activeChatterID = newActiveChatterID
            if (newActiveChatterID != null) {
                if (speakerNameRetriever == null || !Objects.equal(speakerNameRetriever!!.chatterID, newActiveChatterID)) {
                    speakerNameRetriever?.dispose()
                    speakerNameRetriever = ChatterNameRetriever(newActiveChatterID, onActiveSpeakerNameUpdated, UIThreadExecutor.getInstance(), false)
                    speakerNameRetriever!!.subscribe()
                }
            } else {
                speakerNameRetriever?.dispose()
                speakerNameRetriever = null
            }
        }

        val audioProps = voiceAudioProperties.data
        if (audioProps != null) {
            val compoundDrawables = binding.voiceBluetoothButton.compoundDrawables
            val btUnderline = when (audioProps.bluetoothState) {
                VoiceBluetoothState.Active -> R.drawable.active_button_underline
                VoiceBluetoothState.Connecting -> R.drawable.yellow_button_underline
                else -> R.drawable.inactive_button_underline
            }
            binding.voiceBluetoothButton.setCompoundDrawablesWithIntrinsicBounds(
                compoundDrawables[0], null, null, ContextCompat.getDrawable(context, btUnderline))
            binding.voiceLoudspeakerButton.setCompoundDrawablesWithIntrinsicBounds(
                binding.voiceLoudspeakerButton.compoundDrawables[0], null, null,
                ContextCompat.getDrawable(context,
                    if (audioProps.speakerphoneOn) R.drawable.active_button_underline
                    else R.drawable.inactive_button_underline))
            updatingAudioVolume = true
            binding.voiceSpeakerVolumeControl.progress =
                Math.round(audioProps.speakerVolume * binding.voiceSpeakerVolumeControl.max)
            updatingAudioVolume = false
        }
    }

    fun disableMic() {
        val data = voiceChatInfo.data ?: return
        if (chatterID == null || data.state != VoiceChatInfo.VoiceChatState.Active) return
        GridConnectionService.getServiceInstance()?.enableVoiceMic(false)
    }

    fun enableHover(hoverListenerCompat: OnHoverListenerCompat) {
        hoverEnabled = true
        val onHoverListener = OnHoverListener { view, event ->
            if (view !is ImageButton) return@OnHoverListener false
            when (event.actionMasked) {
                MotionEvent.ACTION_HOVER_ENTER -> hoverListenerCompat.onHoverEnter(view)
                MotionEvent.ACTION_HOVER_EXIT -> hoverListenerCompat.onHoverExit(view)
            }
            false
        }
        val pad = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 14f, resources.displayMetrics).toInt()
        val styledAttrs = context.obtainStyledAttributes(intArrayOf(R.attr.buttonShapeMoveControl))
        for (btn in arrayOf(binding.voiceAnswerButton, binding.voiceTerminateButton, binding.voiceMicOnButton, binding.voiceMicOffButton)) {
            btn.setOnHoverListener(onHoverListener)
            btn.background = if (btn == binding.voiceMicOnButton) {
                ContextCompat.getDrawable(context, R.drawable.fab_shape_move_control_green)
            } else {
                styledAttrs.getDrawable(0)
            }
            btn.setPadding(pad, pad, pad, pad)
            btn.alpha = 0.5f
        }
        styledAttrs.recycle()
    }

    fun hideBackground() {
        binding.voiceStatusCardView.setCardBackgroundColor(0)
        binding.voiceStatusCardView.cardElevation = 0f
    }

    private fun onLoudspeakerButton() {
        val data = voiceAudioProperties.data ?: return
        val client = GridConnectionService.getServiceInstance()?.webRTCVoiceClient ?: return
        client.setAudioDevice(
            if (data.speakerphoneOn) VoiceAudioDevice.Default else VoiceAudioDevice.Loudspeaker
        )
    }

    private fun onVoiceAnswerButton() {
        val data = voiceChatInfo.data
        if (onCallButtonListener != null && (chatterID == null || data == null || data.state == VoiceChatInfo.VoiceChatState.None)) {
            onCallButtonListener!!.onClick(binding.voiceAnswerButton)
        }
        val id = chatterID ?: return
        GridConnectionService.getServiceInstance()?.acceptVoiceCall(id)
    }

    private fun onVoiceBluetoothButton() {
        val data = voiceAudioProperties.data ?: return
        val client = GridConnectionService.getServiceInstance()?.webRTCVoiceClient ?: return
        client.setAudioDevice(
            if (data.bluetoothState == VoiceBluetoothState.Active) VoiceAudioDevice.Default else VoiceAudioDevice.Bluetooth
        )
    }

    private fun onVoiceMicOffButton() {
        GridConnectionService.getServiceInstance()?.enableVoiceMic(true)
    }

    private fun onVoiceMicOnButton() {
        GridConnectionService.getServiceInstance()?.enableVoiceMic(false)
    }

    private fun onVoiceStatusCardClick() {
        val controls = binding.voiceStatusControls
        if (controls.visibility == VISIBLE) {
            controls.visibility = GONE
        } else {
            controls.visibility = VISIBLE
            controls.startAnimation(AnimationUtils.loadAnimation(context, R.anim.expand_vertically))
        }
    }

    private fun onVoiceTerminateButton() {
        val id = chatterID ?: return
        GridConnectionService.getServiceInstance()?.terminateVoiceCall(id)
    }

    fun setCanConnect(canConnect: Boolean) {
        this.canConnect = canConnect
        updateVoiceState()
    }

    fun setChatterID(chatterID: ChatterID?) {
        this.chatterID = chatterID
        if (chatterID != null) {
            val userManager = chatterID.userManager
            if (userManager != null) {
                voiceAudioProperties.subscribe(userManager.voiceAudioProperties, SubscriptionSingleKey.Value)
                voiceChatInfo.subscribe(userManager.voiceChatInfo, chatterID)
                if (activeChatterNameRetriever != null && !Objects.equal(activeChatterNameRetriever!!.chatterID, chatterID)) {
                    activeChatterNameRetriever!!.dispose()
                    activeChatterNameRetriever = null
                }
                if (showActiveChatterName) {
                    activeChatterNameRetriever = ChatterNameRetriever(chatterID, onActiveSpeakerNameUpdated, UIThreadExecutor.getInstance(), false)
                    activeChatterNameRetriever!!.subscribe()
                }
            }
        } else {
            voiceAudioProperties.unsubscribe()
            voiceChatInfo.unsubscribe()
            speakerNameRetriever?.dispose()
            speakerNameRetriever = null
            activeChatterNameRetriever?.dispose()
            activeChatterNameRetriever = null
            GridConnectionService.getServiceInstance()?.enableVoiceMic(false)
        }
        updateVoiceState()
    }

    fun setLightTheme() {
        binding.voiceStatusText.setTextColor(-1)
        binding.voiceStatusSmallText.setTextColor(-1)
        binding.voiceAnswerButton.setImageResource(R.drawable.icon_material_voice_call)
        binding.voiceMicOnButton.setImageResource(R.drawable.icon_material_mic)
        binding.voiceMicOffButton.setImageResource(R.drawable.icon_material_mic_off)
        binding.voiceTerminateButton.setImageResource(R.drawable.menu_close_light)
    }

    fun setOnCallButtonListener(listener: OnClickListener?) {
        onCallButtonListener = listener
    }

    fun setShowActiveChatterName(show: Boolean) {
        showActiveChatterName = show
        updateVoiceState()
    }

    fun setShowWhenInactive(show: Boolean) {
        showWhenInactive = show
        updateVoiceState()
    }
}
