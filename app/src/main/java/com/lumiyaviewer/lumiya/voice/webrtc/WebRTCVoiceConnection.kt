package com.lumiyaviewer.lumiya.voice.webrtc

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLAsyncRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import com.lumiyaviewer.lumiya.voice.common.model.Voice3DPosition
import org.json.JSONArray
import org.json.JSONObject
import org.webrtc.AudioTrack
import org.webrtc.DataChannel
import org.webrtc.IceCandidate
import org.webrtc.MediaConstraints
import org.webrtc.MediaStream
import org.webrtc.PeerConnection
import org.webrtc.PeerConnectionFactory
import org.webrtc.RtpReceiver
import org.webrtc.SdpObserver
import org.webrtc.SessionDescription
import java.nio.ByteBuffer
import java.nio.charset.StandardCharsets
import java.util.UUID
import java.util.concurrent.CopyOnWriteArrayList

enum class VoiceConnectionState {
    IDLE,
    CREATING_OFFER,
    WAITING_FOR_ANSWER,
    SETTING_ANSWER,
    WAITING_FOR_DATA_CHANNEL,
    CONNECTED,
    DISCONNECTING,
    ERROR
}

interface VoiceConnectionListener {
    fun onStateChanged(connection: WebRTCVoiceConnection, state: VoiceConnectionState)
    fun onParticipantJoined(connection: WebRTCVoiceConnection, participantId: UUID)
    fun onParticipantLeft(connection: WebRTCVoiceConnection, participantId: UUID)
    fun onParticipantSpeaking(connection: WebRTCVoiceConnection, participantId: UUID, isSpeaking: Boolean, energy: Float)
}

class WebRTCVoiceConnection(
    private val factory: PeerConnectionFactory,
    private val localAudioTrack: AudioTrack?,
    private val provisionCapURL: String,
    private val signalingCapURL: String?,
    private val channelCredentials: String?,
    val channelType: String,
    val parcelLocalId: Int?,
    val isSpatial: Boolean,
    private val listener: VoiceConnectionListener
) {
    @Volatile
    var state: VoiceConnectionState = VoiceConnectionState.IDLE
        private set(value) {
            field = value
            listener.onStateChanged(this, value)
        }

    @Volatile
    var viewerSession: String? = null
        private set

    private var peerConnection: PeerConnection? = null
    private var dataChannel: DataChannel? = null
    private val pendingIceCandidates = CopyOnWriteArrayList<IceCandidate>()
    private var iceGatheringComplete = false

    fun connect() {
        if (state != VoiceConnectionState.IDLE && state != VoiceConnectionState.ERROR) return
        state = VoiceConnectionState.CREATING_OFFER

        val rtcConfig = PeerConnection.RTCConfiguration(emptyList()).apply {
            sdpSemantics = PeerConnection.SdpSemantics.UNIFIED_PLAN
            continualGatheringPolicy = PeerConnection.ContinualGatheringPolicy.GATHER_CONTINUALLY
        }

        peerConnection = factory.createPeerConnection(rtcConfig, peerConnectionObserver)
        if (peerConnection == null) {
            Debug.Printf("WebRTCVoice: failed to create PeerConnection")
            state = VoiceConnectionState.ERROR
            return
        }

        if (localAudioTrack != null) {
            peerConnection?.addTrack(localAudioTrack, listOf("lumiya-voice"))
        }

        val dcInit = DataChannel.Init().apply {
            ordered = true
            negotiated = true
            id = 0
        }
        dataChannel = peerConnection?.createDataChannel("voice", dcInit)
        dataChannel?.registerObserver(dataChannelObserver)

        val constraints = MediaConstraints().apply {
            mandatory.add(MediaConstraints.KeyValuePair("OfferToReceiveAudio", "true"))
            mandatory.add(MediaConstraints.KeyValuePair("OfferToReceiveVideo", "false"))
        }
        peerConnection?.createOffer(sdpOfferObserver, constraints)
    }

    fun disconnect() {
        state = VoiceConnectionState.DISCONNECTING
        dataChannel?.unregisterObserver()
        dataChannel?.close()
        dataChannel?.dispose()
        dataChannel = null
        peerConnection?.close()
        peerConnection?.dispose()
        peerConnection = null
        pendingIceCandidates.clear()
        iceGatheringComplete = false
        viewerSession = null
        state = VoiceConnectionState.IDLE
    }

    fun sendJoin() {
        sendDataChannelMessage(JSONObject().put("j", true).toString())
    }

    fun sendPositionUpdate(position: Voice3DPosition) {
        val spX = (position.position.x * 100).toInt()
        val spY = (position.position.y * 100).toInt()
        val spZ = (position.position.z * 100).toInt()

        val atX = (position.atOrientation.x * 100).toInt()
        val atY = (position.atOrientation.y * 100).toInt()
        val atZ = (position.atOrientation.z * 100).toInt()

        val msg = JSONObject()
        msg.put("sp", JSONObject().put("x", spX).put("y", spY).put("z", spZ))
        msg.put("sh", JSONObject().put("x", atX).put("y", atY).put("z", atZ).put("w", 0))
        msg.put("lp", JSONObject().put("x", spX).put("y", spY).put("z", spZ))
        msg.put("lh", JSONObject().put("x", atX).put("y", atY).put("z", atZ).put("w", 0))

        sendDataChannelMessage(msg.toString())
    }

    fun sendMuteUser(agentId: UUID, muted: Boolean) {
        sendDataChannelMessage(
            JSONObject().put("m", JSONObject().put(agentId.toString(), muted)).toString()
        )
    }

    fun sendUserVolume(agentId: UUID, gain: Float) {
        sendDataChannelMessage(
            JSONObject().put("ug", JSONObject().put(agentId.toString(), gain)).toString()
        )
    }

    private fun sendDataChannelMessage(json: String) {
        val dc = dataChannel ?: return
        if (dc.state() != DataChannel.State.OPEN) return
        val bytes = json.toByteArray(StandardCharsets.UTF_8)
        dc.send(DataChannel.Buffer(ByteBuffer.wrap(bytes), false))
    }

    private fun sendSdpOfferToServer(sdp: String) {
        state = VoiceConnectionState.WAITING_FOR_ANSWER

        val jsep = LLSDMap(
            LLSDMap.LLSDMapEntry("type", LLSDString("offer")),
            LLSDMap.LLSDMapEntry("sdp", LLSDString(sdp))
        )

        val bodyEntries = mutableListOf(
            LLSDMap.LLSDMapEntry("jsep", jsep),
            LLSDMap.LLSDMapEntry("voice_server_type", LLSDString("webrtc")),
            LLSDMap.LLSDMapEntry("channel_type", LLSDString(channelType))
        )

        if (!channelCredentials.isNullOrEmpty()) {
            bodyEntries.add(
                LLSDMap.LLSDMapEntry("channel_credentials", LLSDString(channelCredentials))
            )
        }

        if (parcelLocalId != null) {
            bodyEntries.add(LLSDMap.LLSDMapEntry("parcel_local_id", LLSDInt(parcelLocalId)))
        }

        val body = LLSDMap(*bodyEntries.toTypedArray())

        LLSDXMLAsyncRequest(provisionCapURL, body,
            LLSDXMLAsyncRequest.LLSDXMLResultListener { result ->
                onProvisionResult(result)
            })
    }

    private fun onProvisionResult(result: LLSDNode?) {
        if (result == null) {
            Debug.Printf("WebRTCVoice: null provision result")
            state = VoiceConnectionState.ERROR
            return
        }

        try {
            val jsepType = result.byKey("jsep").byKey("type").asString()
            val jsepSdp = result.byKey("jsep").byKey("sdp").asString()

            if (jsepType != "answer") {
                Debug.Printf("WebRTCVoice: unexpected jsep type '%s'", jsepType)
                state = VoiceConnectionState.ERROR
                return
            }

            try {
                viewerSession = result.byKey("viewer_session").asString()
            } catch (e: Exception) {
                Debug.Printf("WebRTCVoice: no viewer_session in response")
            }

            state = VoiceConnectionState.SETTING_ANSWER
            val answer = SessionDescription(SessionDescription.Type.ANSWER, jsepSdp)
            peerConnection?.setRemoteDescription(sdpAnswerObserver, answer)

        } catch (e: Exception) {
            Debug.Warning(e)
            state = VoiceConnectionState.ERROR
        }
    }

    private fun sendIceCandidatesToServer() {
        val url = signalingCapURL ?: return
        val session = viewerSession ?: return
        val candidates = pendingIceCandidates.toList()
        pendingIceCandidates.clear()

        if (candidates.isEmpty() && !iceGatheringComplete) return

        val candidatesArray = JSONArray()
        for (candidate in candidates) {
            candidatesArray.put(JSONObject().apply {
                put("sdpMid", candidate.sdpMid)
                put("sdpMLineIndex", candidate.sdpMLineIndex)
                put("candidate", candidate.sdp)
            })
        }

        val bodyEntries = mutableListOf(
            LLSDMap.LLSDMapEntry("viewer_session", LLSDString(session)),
            LLSDMap.LLSDMapEntry("voice_server_type", LLSDString("webrtc"))
        )

        if (iceGatheringComplete && candidates.isEmpty()) {
            val completedCandidate = LLSDMap(
                LLSDMap.LLSDMapEntry("completed", LLSDString("true"))
            )
            bodyEntries.add(LLSDMap.LLSDMapEntry("candidate", completedCandidate))
        } else {
            bodyEntries.add(
                LLSDMap.LLSDMapEntry("candidates", LLSDString(candidatesArray.toString()))
            )
        }

        val body = LLSDMap(*bodyEntries.toTypedArray())

        LLSDXMLAsyncRequest(url, body,
            LLSDXMLAsyncRequest.LLSDXMLResultListener { _ ->
                Debug.Printf("WebRTCVoice: ICE candidates sent")
            })
    }

    private val peerConnectionObserver = object : PeerConnection.Observer {
        override fun onSignalingChange(newState: PeerConnection.SignalingState?) {
            Debug.Printf("WebRTCVoice: signaling state: %s", newState)
        }

        override fun onIceConnectionChange(newState: PeerConnection.IceConnectionState?) {
            Debug.Printf("WebRTCVoice: ICE connection state: %s", newState)
            when (newState) {
                PeerConnection.IceConnectionState.CONNECTED,
                PeerConnection.IceConnectionState.COMPLETED -> {
                    if (state == VoiceConnectionState.WAITING_FOR_DATA_CHANNEL ||
                        state == VoiceConnectionState.SETTING_ANSWER) {
                        checkReadyState()
                    }
                }
                PeerConnection.IceConnectionState.FAILED -> {
                    state = VoiceConnectionState.ERROR
                }
                PeerConnection.IceConnectionState.DISCONNECTED -> {
                    if (state == VoiceConnectionState.CONNECTED) {
                        state = VoiceConnectionState.ERROR
                    }
                }
                else -> {}
            }
        }

        override fun onIceConnectionReceivingChange(receiving: Boolean) {}

        override fun onIceGatheringChange(newState: PeerConnection.IceGatheringState?) {
            if (newState == PeerConnection.IceGatheringState.COMPLETE) {
                iceGatheringComplete = true
                sendIceCandidatesToServer()
            }
        }

        override fun onIceCandidate(candidate: IceCandidate?) {
            candidate ?: return
            pendingIceCandidates.add(candidate)
            if (viewerSession != null) {
                sendIceCandidatesToServer()
            }
        }

        override fun onIceCandidatesRemoved(candidates: Array<out IceCandidate>?) {}

        override fun onAddStream(stream: MediaStream?) {}

        override fun onRemoveStream(stream: MediaStream?) {}

        override fun onDataChannel(channel: DataChannel?) {}

        override fun onRenegotiationNeeded() {}

        override fun onAddTrack(receiver: RtpReceiver?, streams: Array<out MediaStream>?) {}
    }

    private val dataChannelObserver = object : DataChannel.Observer {
        override fun onBufferedAmountChange(previousAmount: Long) {}

        override fun onStateChange() {
            val dc = dataChannel ?: return
            Debug.Printf("WebRTCVoice: data channel state: %s", dc.state())
            if (dc.state() == DataChannel.State.OPEN) {
                checkReadyState()
            }
        }

        override fun onMessage(buffer: DataChannel.Buffer?) {
            buffer ?: return
            val data = ByteArray(buffer.data.remaining())
            buffer.data.get(data)
            val json = String(data, StandardCharsets.UTF_8)
            onDataChannelMessage(json)
        }
    }

    private fun checkReadyState() {
        val pc = peerConnection ?: return
        val dc = dataChannel ?: return

        val iceConnected = pc.iceConnectionState() == PeerConnection.IceConnectionState.CONNECTED ||
                pc.iceConnectionState() == PeerConnection.IceConnectionState.COMPLETED
        val dcOpen = dc.state() == DataChannel.State.OPEN

        if (iceConnected && dcOpen && state != VoiceConnectionState.CONNECTED) {
            state = VoiceConnectionState.CONNECTED
            sendJoin()
        }
    }

    private fun onDataChannelMessage(json: String) {
        try {
            val obj = JSONObject(json)
            if (obj.has("p")) {
                val participants = obj.getJSONObject("p")
                val keys = participants.keys()
                while (keys.hasNext()) {
                    val key = keys.next()
                    try {
                        val uuid = UUID.fromString(key)
                        val info = participants.getJSONObject(key)
                        val isMuted = info.optBoolean("m", false)
                        val energy = info.optDouble("e", 0.0).toFloat()
                        listener.onParticipantSpeaking(this, uuid, !isMuted && energy > 0.01f, energy)
                    } catch (e: Exception) {
                        Debug.Printf("WebRTCVoice: error parsing participant %s", key)
                    }
                }
            }
        } catch (e: Exception) {
            Debug.Printf("WebRTCVoice: error parsing data channel message: %s", e.message)
        }
    }

    private val sdpOfferObserver = object : SdpObserver {
        override fun onCreateSuccess(sdp: SessionDescription?) {
            sdp ?: return
            peerConnection?.setLocalDescription(object : SdpObserver {
                override fun onCreateSuccess(p0: SessionDescription?) {}
                override fun onSetSuccess() {
                    sendSdpOfferToServer(sdp.description)
                }
                override fun onCreateFailure(error: String?) {}
                override fun onSetFailure(error: String?) {
                    Debug.Printf("WebRTCVoice: failed to set local description: %s", error)
                    state = VoiceConnectionState.ERROR
                }
            }, sdp)
        }

        override fun onSetSuccess() {}

        override fun onCreateFailure(error: String?) {
            Debug.Printf("WebRTCVoice: failed to create offer: %s", error)
            state = VoiceConnectionState.ERROR
        }

        override fun onSetFailure(error: String?) {}
    }

    private val sdpAnswerObserver = object : SdpObserver {
        override fun onCreateSuccess(sdp: SessionDescription?) {}

        override fun onSetSuccess() {
            Debug.Printf("WebRTCVoice: remote description set successfully")
            state = VoiceConnectionState.WAITING_FOR_DATA_CHANNEL
            if (pendingIceCandidates.isNotEmpty()) {
                sendIceCandidatesToServer()
            }
            checkReadyState()
        }

        override fun onCreateFailure(error: String?) {}

        override fun onSetFailure(error: String?) {
            Debug.Printf("WebRTCVoice: failed to set remote description: %s", error)
            state = VoiceConnectionState.ERROR
        }
    }
}
