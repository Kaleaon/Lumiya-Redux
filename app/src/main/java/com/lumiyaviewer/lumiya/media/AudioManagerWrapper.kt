package com.lumiyaviewer.lumiya.media

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFocusRequest
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import com.lumiyaviewer.lumiya.Debug

class AudioManagerWrapper(context: Context) : AudioManager.OnAudioFocusChangeListener {

    private val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private var mHandler: Handler? = null
    private var msgCode: Int = 0
    private var audioFocusRequest: AudioFocusRequest? = null

    override fun onAudioFocusChange(focusChange: Int) {
        mHandler?.sendMessage(mHandler!!.obtainMessage(msgCode, focusChange, 0))
    }

    fun abandonAudioFocus() {
        Debug.Log("AudioManagerWrapper: abandoning audio focus")
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                audioFocusRequest?.let { request ->
                    audioManager.abandonAudioFocusRequest(request)
                    audioFocusRequest = null
                }
            } else {
                @Suppress("DEPRECATION")
                audioManager.abandonAudioFocus(this)
            }
        } catch (e: Exception) {
            Debug.Log("AudioManagerWrapper: error abandoning audio focus: ${e.message}")
        }
    }

    fun requestAudioFocus(): Boolean {
        Debug.Log("AudioManagerWrapper: requesting audio focus")
        return try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                val audioAttributes = AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_MEDIA)
                    .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                    .build()

                val focusRequest = AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
                    .setAudioAttributes(audioAttributes)
                    .setAcceptsDelayedFocusGain(false)
                    .setOnAudioFocusChangeListener(this)
                    .build()

                this.audioFocusRequest = focusRequest
                val res = audioManager.requestAudioFocus(focusRequest)
                res == AudioManager.AUDIOFOCUS_REQUEST_GRANTED
            } else {
                @Suppress("DEPRECATION")
                val res = audioManager.requestAudioFocus(
                    this,
                    AudioManager.STREAM_MUSIC,
                    AudioManager.AUDIOFOCUS_GAIN
                )
                res == AudioManager.AUDIOFOCUS_REQUEST_GRANTED
            }
        } catch (e: Exception) {
            Debug.Log("AudioManagerWrapper: error requesting audio focus: ${e.message}")
            true
        }
    }

    fun setHandler(handler: Handler, msgCode: Int) {
        this.mHandler = handler
        this.msgCode = msgCode
    }

    companion object {
        const val AUDIOFOCUS_GAIN = AudioManager.AUDIOFOCUS_GAIN
        const val AUDIOFOCUS_GAIN_TRANSIENT = AudioManager.AUDIOFOCUS_GAIN_TRANSIENT
        const val AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK = AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK
        const val AUDIOFOCUS_LOSS = AudioManager.AUDIOFOCUS_LOSS
        const val AUDIOFOCUS_LOSS_TRANSIENT = AudioManager.AUDIOFOCUS_LOSS_TRANSIENT
        const val AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK = AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK
        const val AUDIOFOCUS_REQUEST_FAILED = AudioManager.AUDIOFOCUS_REQUEST_FAILED
        const val AUDIOFOCUS_REQUEST_GRANTED = AudioManager.AUDIOFOCUS_REQUEST_GRANTED
    }
}
