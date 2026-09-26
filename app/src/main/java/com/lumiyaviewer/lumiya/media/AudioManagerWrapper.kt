package com.lumiyaviewer.lumiya.media

import android.content.Context
import android.media.AudioManager
import android.os.Handler
import com.lumiyaviewer.lumiya.Debug
import java.lang.reflect.InvocationHandler
import java.lang.reflect.Method
import java.lang.reflect.Proxy

class AudioManagerWrapper(context: Context) : InvocationHandler {

    private var audioFocusHandler: Any? = null
    private val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private var hasAudioFocusAPI: Boolean = false
    private var mHandler: Handler? = null
    private var msgCode: Int = 0

    init {
        try {
            val declaredClasses = audioManager.javaClass.declaredClasses
            var listenerClass: Class<*>? = null
            for (cls in declaredClasses) {
                if (cls.simpleName == "OnAudioFocusChangeListener") {
                    listenerClass = cls
                    break
                }
            }
            if (listenerClass == null) {
                throw Exception("Failed to get OnAudioFocusChangeListener interface")
            }
            mRequestAudioFocus = AudioManager::class.java.getMethod(
                "requestAudioFocus", listenerClass, Integer.TYPE, Integer.TYPE
            )
            mAbandonAudioFocus = AudioManager::class.java.getMethod(
                "abandonAudioFocus", listenerClass
            )
            audioFocusHandler = Proxy.newProxyInstance(
                listenerClass.classLoader, arrayOf(listenerClass), this
            )
            hasAudioFocusAPI = true
        } catch (e: Exception) {
            // 3.4.2 falls back to no audio-focus handling on any failure here
            // (hidden API missing, proxy creation refused, ...).
            hasAudioFocusAPI = false
            Debug.Log("AudioManagerWrapper: audio focus api not found")
            e.printStackTrace()
        }
        Debug.Log("AudioManagerWrapper: has audio focus api = $hasAudioFocusAPI")
    }

    private fun onAudioFocusChange(i: Int) {
        mHandler?.sendMessage(mHandler!!.obtainMessage(msgCode, i, 0))
    }

    fun abandonAudioFocus() {
        Debug.Log("AudioManagerWrapper: abandoning audio focus")
        if (hasAudioFocusAPI) {
            try {
                mAbandonAudioFocus?.invoke(audioManager, audioFocusHandler)
            } catch (_: Exception) {
            }
        }
    }

    override fun invoke(obj: Any?, method: Method?, objArr: Array<out Any?>?): Any? {
        try {
            if (method?.name.equals("onAudioFocusChange", ignoreCase = true) &&
                objArr != null && objArr.isNotEmpty() && objArr[0] is Int
            ) {
                onAudioFocusChange(objArr[0] as Int)
            }
            return null
        } catch (_: Exception) {
            return null
        }
    }

    fun requestAudioFocus(): Boolean {
        Debug.Log("AudioManagerWrapper: requesting audio focus")
        if (!hasAudioFocusAPI) return true
        return try {
            (mRequestAudioFocus?.invoke(audioManager, audioFocusHandler, 3, 1) as Int) == 1
        } catch (_: Exception) {
            true
        }
    }

    fun setHandler(handler: Handler, msgCode: Int) {
        this.mHandler = handler
        this.msgCode = msgCode
    }

    companion object {
        const val AUDIOFOCUS_GAIN = 1
        const val AUDIOFOCUS_GAIN_TRANSIENT = 2
        const val AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK = 3
        const val AUDIOFOCUS_LOSS = -1
        const val AUDIOFOCUS_LOSS_TRANSIENT = -2
        const val AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK = -3
        const val AUDIOFOCUS_REQUEST_FAILED = 0
        const val AUDIOFOCUS_REQUEST_GRANTED = 1

        private var mAbandonAudioFocus: Method? = null
        private var mRequestAudioFocus: Method? = null
    }
}
