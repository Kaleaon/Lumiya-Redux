package com.lumiyaviewer.lumiya.voice.webrtc

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.media.AudioManager
import android.media.AudioDeviceInfo
import android.os.Build
import com.google.common.collect.BiMap
import com.google.common.collect.HashBiMap
import com.google.common.collect.Maps
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceAudioProperties
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceChannelStatus
import com.lumiyaviewer.lumiya.voice.common.model.VoiceAudioDevice
import com.lumiyaviewer.lumiya.voice.common.model.VoiceBluetoothState
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import com.lumiyaviewer.lumiya.voice.common.model.Voice3DPosition
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import org.webrtc.AudioSource
import org.webrtc.AudioTrack
import org.webrtc.MediaConstraints
import org.webrtc.PeerConnectionFactory
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference
import javax.annotation.Nullable

interface WebRTCVoiceClientListener {
    fun onVoiceLoggedIn(client: WebRTCVoiceClient, loggedIn: Boolean)
    fun onVoiceChannelStatus(status: VoiceChannelStatus)
}

class WebRTCVoiceClient(private val context: Context) : VoiceConnectionListener {
    private var peerConnectionFactory: PeerConnectionFactory? = null
    private var audioSource: AudioSource? = null
    private var localAudioTrack: AudioTrack? = null
    private val initialized = AtomicBoolean(false)
    private val connections = ConcurrentHashMap<String, WebRTCVoiceConnection>()
    private val voiceChannels: BiMap<ChatterID, VoiceChannelInfo> = Maps.synchronizedBiMap(HashBiMap.create())
    private val userManager = AtomicReference<UserManager>(null)
    private var listener: WebRTCVoiceClientListener? = null
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

    @Volatile
    private var bluetoothState = VoiceBluetoothState.Disconnected
    private var scoReceiverRegistered = false

    private val scoReceiver = object : BroadcastReceiver() {
        override fun onReceive(ctx: Context?, intent: Intent?) {
            val state = intent?.getIntExtra(AudioManager.EXTRA_SCO_AUDIO_STATE, -1) ?: return
            bluetoothState = when (state) {
                AudioManager.SCO_AUDIO_STATE_CONNECTED -> VoiceBluetoothState.Active
                AudioManager.SCO_AUDIO_STATE_CONNECTING -> VoiceBluetoothState.Connecting
                AudioManager.SCO_AUDIO_STATE_DISCONNECTED -> VoiceBluetoothState.Disconnected
                AudioManager.SCO_AUDIO_STATE_ERROR -> VoiceBluetoothState.Error
                else -> VoiceBluetoothState.Disconnected
            }
            Debug.Printf("WebRTCVoice: Bluetooth SCO state changed to %s", bluetoothState)
            notifyAudioPropertiesChanged()
        }
    }

    @Volatile
    var provisionCapURL: String? = null
        private set

    @Volatile
    var signalingCapURL: String? = null
        private set

    @Volatile
    var agentUUID: UUID? = null
        private set

    fun initialize() {
        if (initialized.getAndSet(true)) return

        PeerConnectionFactory.initialize(
            PeerConnectionFactory.InitializationOptions.builder(context)
                .setFieldTrials("")
                .createInitializationOptions()
        )

        peerConnectionFactory = PeerConnectionFactory.builder()
            .setOptions(PeerConnectionFactory.Options())
            .createPeerConnectionFactory()

        val audioConstraints = MediaConstraints().apply {
            mandatory.add(MediaConstraints.KeyValuePair("googEchoCancellation", "true"))
            mandatory.add(MediaConstraints.KeyValuePair("googAutoGainControl", "true"))
            mandatory.add(MediaConstraints.KeyValuePair("googNoiseSuppression", "true"))
            mandatory.add(MediaConstraints.KeyValuePair("googHighpassFilter", "true"))
        }

        audioSource = peerConnectionFactory?.createAudioSource(audioConstraints)
        localAudioTrack = peerConnectionFactory?.createAudioTrack("lumiya-mic", audioSource)
        localAudioTrack?.setEnabled(false)

        if (!scoReceiverRegistered) {
            context.registerReceiver(scoReceiver,
                IntentFilter(AudioManager.ACTION_SCO_AUDIO_STATE_UPDATED))
            scoReceiverRegistered = true
        }

        Debug.Printf("WebRTCVoice: initialized PeerConnectionFactory")
    }

    fun setCredentials(provisionURL: String, signalingURL: String?, uuid: UUID) {
        this.provisionCapURL = provisionURL
        this.signalingCapURL = signalingURL
        this.agentUUID = uuid
    }

    fun setUserManager(userManager: UserManager?) {
        this.userManager.set(userManager)
    }

    fun setListener(listener: WebRTCVoiceClientListener?) {
        this.listener = listener
    }

    fun login() {
        if (!initialized.get()) {
            initialize()
        }
        listener?.onVoiceLoggedIn(this, true)
    }

    fun logout() {
        disconnectAll()
        listener?.onVoiceLoggedIn(this, false)
    }

    fun addChannel(chatterID: ChatterID, channelInfo: VoiceChannelInfo) {
        voiceChannels.forcePut(chatterID, channelInfo)
    }

    fun connectChannel(channelInfo: VoiceChannelInfo, @Nullable credentials: String?) {
        val capURL = provisionCapURL ?: return
        val factory = peerConnectionFactory ?: return
        val key = channelInfo.voiceChannelURI ?: return

        if (connections.containsKey(key)) {
            Debug.Printf("WebRTCVoice: already connected to channel %s", key)
            return
        }

        val channelType = if (channelInfo.isSpatial) "local" else "adhoc"
        val parcelLocalId = if (channelInfo.isSpatial) extractParcelId(channelInfo.voiceChannelURI) else null

        val connection = WebRTCVoiceConnection(
            factory = factory,
            localAudioTrack = localAudioTrack,
            provisionCapURL = capURL,
            signalingCapURL = signalingCapURL,
            channelType = channelType,
            parcelLocalId = parcelLocalId,
            isSpatial = channelInfo.isSpatial,
            listener = this
        )

        connections[key] = connection

        val chatterID = voiceChannels.inverse()[channelInfo]
        if (chatterID != null) {
            val um = userManager.get()
            um?.setVoiceChatInfo(chatterID, VoiceChatInfo.create(
                VoiceChatInfo.VoiceChatState.Connecting,
                VoiceChatInfo.VoiceChatState.None,
                0, null, channelInfo.isConference, false
            ))
        }

        connection.connect()
    }

    fun disconnectChannel(channelInfo: VoiceChannelInfo) {
        val key = channelInfo.voiceChannelURI ?: return
        val connection = connections.remove(key) ?: return
        connection.disconnect()

        val chatterID = voiceChannels.inverse()[channelInfo]
        if (chatterID != null) {
            val um = userManager.get()
            um?.setVoiceChatInfo(chatterID, VoiceChatInfo.empty())
        }
    }

    fun disconnectAll() {
        for ((key, connection) in connections) {
            connection.disconnect()
            val channelInfo = voiceChannels.values.find { it.voiceChannelURI == key }
            if (channelInfo != null) {
                val chatterID = voiceChannels.inverse()[channelInfo]
                if (chatterID != null) {
                    val um = userManager.get()
                    um?.setVoiceChatInfo(chatterID, VoiceChatInfo.empty())
                }
            }
        }
        connections.clear()
    }

    fun enableMic(enabled: Boolean) {
        localAudioTrack?.setEnabled(enabled)
    }

    fun setAudioDevice(device: VoiceAudioDevice) {
        audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            setModernAudioDevice(device)
        } else {
            setLegacyAudioDevice(device)
        }
        notifyAudioPropertiesChanged()
    }

    private fun setModernAudioDevice(device: VoiceAudioDevice) {
        val preferredTypes = when (device) {
            VoiceAudioDevice.Loudspeaker -> setOf(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER)
            VoiceAudioDevice.Bluetooth -> setOf(
                AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                AudioDeviceInfo.TYPE_BLE_HEADSET,
                AudioDeviceInfo.TYPE_BLE_SPEAKER
            )
            else -> setOf(
                AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
                AudioDeviceInfo.TYPE_WIRED_HEADSET,
                AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
                AudioDeviceInfo.TYPE_USB_HEADSET
            )
        }
        val route = audioManager.availableCommunicationDevices.firstOrNull { it.type in preferredTypes }
        if (route != null) {
            audioManager.setCommunicationDevice(route)
        } else {
            audioManager.clearCommunicationDevice()
        }
        bluetoothState = if (route?.type in BLUETOOTH_DEVICE_TYPES) {
            VoiceBluetoothState.Active
        } else {
            VoiceBluetoothState.Disconnected
        }
    }

    @Suppress("DEPRECATION")
    private fun setLegacyAudioDevice(device: VoiceAudioDevice) {
        when (device) {
            VoiceAudioDevice.Loudspeaker -> {
                audioManager.stopBluetoothSco()
                audioManager.isBluetoothScoOn = false
                audioManager.isSpeakerphoneOn = true
            }
            VoiceAudioDevice.Bluetooth -> {
                audioManager.isSpeakerphoneOn = false
                audioManager.startBluetoothSco()
                audioManager.isBluetoothScoOn = true
            }
            else -> {
                audioManager.isSpeakerphoneOn = false
                audioManager.stopBluetoothSco()
                audioManager.isBluetoothScoOn = false
            }
        }
    }

    fun setSpeakerVolume(volume: Float) {
        val maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_VOICE_CALL)
        audioManager.setStreamVolume(
            AudioManager.STREAM_VOICE_CALL,
            (volume * maxVolume).toInt(),
            0
        )
        notifyAudioPropertiesChanged()
    }

    fun updateSpatialPosition(channelInfo: VoiceChannelInfo, position: Voice3DPosition) {
        val key = channelInfo.voiceChannelURI ?: return
        val connection = connections[key] ?: return
        if (connection.isSpatial && connection.state == VoiceConnectionState.CONNECTED) {
            connection.sendPositionUpdate(position)
        }
    }

    fun terminateCall(chatterID: ChatterID) {
        val channelInfo = voiceChannels[chatterID] ?: return
        disconnectChannel(channelInfo)
    }

    fun dispose() {
        disconnectAll()
        if (scoReceiverRegistered) {
            context.unregisterReceiver(scoReceiver)
            scoReceiverRegistered = false
        }
        resetAudioRouting()
        audioManager.mode = AudioManager.MODE_NORMAL
        localAudioTrack?.dispose()
        localAudioTrack = null
        audioSource?.dispose()
        audioSource = null
        peerConnectionFactory?.dispose()
        peerConnectionFactory = null
        initialized.set(false)
    }

    private fun notifyAudioPropertiesChanged() {
        val um = userManager.get() ?: return
        val maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_VOICE_CALL).toFloat()
        val currentVolume = audioManager.getStreamVolume(AudioManager.STREAM_VOICE_CALL).toFloat()
        val volume = if (maxVolume > 0) currentVolume / maxVolume else 0.5f

        um.setVoiceAudioProperties(VoiceAudioProperties(volume, isSpeakerphoneActive(), bluetoothState))
    }

    private fun isSpeakerphoneActive(): Boolean = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        audioManager.communicationDevice?.type == AudioDeviceInfo.TYPE_BUILTIN_SPEAKER
    } else {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn
    }

    private fun resetAudioRouting() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            audioManager.clearCommunicationDevice()
        } else {
            @Suppress("DEPRECATION")
            audioManager.stopBluetoothSco()
            @Suppress("DEPRECATION")
            run {
                audioManager.isBluetoothScoOn = false
                audioManager.isSpeakerphoneOn = false
            }
        }
        bluetoothState = VoiceBluetoothState.Disconnected
    }

    private fun extractParcelId(channelURI: String?): Int? {
        if (channelURI == null) return null
        val dashIndex = channelURI.lastIndexOf('-')
        if (dashIndex < 0) return null
        return try {
            channelURI.substring(dashIndex + 1).toInt()
        } catch (e: NumberFormatException) {
            null
        }
    }

    override fun onStateChanged(connection: WebRTCVoiceConnection, state: VoiceConnectionState) {
        val channelKey = connections.entries.find { it.value === connection }?.key ?: return
        val channelInfo = voiceChannels.values.find { it.voiceChannelURI == channelKey } ?: return
        val chatterID = voiceChannels.inverse()[channelInfo] ?: return

        val chatState = when (state) {
            VoiceConnectionState.CONNECTED -> VoiceChatInfo.VoiceChatState.Active
            VoiceConnectionState.CREATING_OFFER,
            VoiceConnectionState.WAITING_FOR_ANSWER,
            VoiceConnectionState.SETTING_ANSWER,
            VoiceConnectionState.WAITING_FOR_DATA_CHANNEL -> VoiceChatInfo.VoiceChatState.Connecting
            VoiceConnectionState.ERROR -> VoiceChatInfo.VoiceChatState.None
            else -> VoiceChatInfo.VoiceChatState.None
        }

        val micActive = localAudioTrack?.enabled() ?: false
        val chatInfo = VoiceChatInfo.create(
            chatState,
            VoiceChatInfo.VoiceChatState.None,
            0, null, channelInfo.isConference, micActive
        )

        val um = userManager.get()
        um?.setVoiceChatInfo(chatterID, chatInfo)

        val status = VoiceChannelStatus(
            channelInfo, chatInfo,
            if (state == VoiceConnectionState.ERROR) "WebRTC connection failed" else null
        )
        listener?.onVoiceChannelStatus(status)
    }

    override fun onParticipantJoined(connection: WebRTCVoiceConnection, participantId: UUID) {
        Debug.Printf("WebRTCVoice: participant joined: %s", participantId)
    }

    override fun onParticipantLeft(connection: WebRTCVoiceConnection, participantId: UUID) {
        Debug.Printf("WebRTCVoice: participant left: %s", participantId)
    }

    override fun onParticipantSpeaking(
        connection: WebRTCVoiceConnection,
        participantId: UUID,
        isSpeaking: Boolean,
        energy: Float
    ) {
        val channelKey = connections.entries.find { it.value === connection }?.key ?: return
        val channelInfo = voiceChannels.values.find { it.voiceChannelURI == channelKey } ?: return
        val chatterID = voiceChannels.inverse()[channelInfo] ?: return

        if (isSpeaking) {
            val um = userManager.get() ?: return
            val micActive = localAudioTrack?.enabled() ?: false
            um.setVoiceChatInfo(chatterID, VoiceChatInfo.create(
                VoiceChatInfo.VoiceChatState.Active,
                VoiceChatInfo.VoiceChatState.Active,
                1, participantId, channelInfo.isConference, micActive
            ))
        }
    }

    companion object {
        private val BLUETOOTH_DEVICE_TYPES = setOf(
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            AudioDeviceInfo.TYPE_BLE_HEADSET,
            AudioDeviceInfo.TYPE_BLE_SPEAKER
        )

        @JvmStatic
        fun isSupported(): Boolean = true
    }
}
