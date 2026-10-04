package com.lumiyaviewer.lumiya.media

import android.media.AudioAttributes
import android.media.AudioManager
import android.media.MediaPlayer
import android.os.Build
import com.lumiyaviewer.lumiya.Debug

class MediaPlayerWrapper :
    Runnable,
    MediaPlayer.OnErrorListener,
    MediaPlayer.OnInfoListener,
    MediaPlayer.OnPreparedListener {

    private var mediaPlayer: MediaPlayer? = null
    private var workingThread: Thread? = null

    @Volatile
    private var mustPlay: Boolean = false

    @Volatile
    private var mustExit: Boolean = false

    @Volatile
    private var mediaURL: String = ""

    @Volatile
    private var currentVolume: Float = 1.0f

    @Volatile
    private var isPaused: Boolean = false

    override fun onError(mediaPlayer: MediaPlayer, what: Int, extra: Int): Boolean {
        Debug.Log("MediaPlayerWrapper: onError: what = $what, extra = $extra")
        return false
    }

    override fun onInfo(mediaPlayer: MediaPlayer, what: Int, extra: Int): Boolean {
        Debug.Log("MediaPlayerWrapper: onInfo: what = $what, extra = $extra")
        return false
    }

    override fun onPrepared(mp: MediaPlayer) {
        Debug.Log("MediaPlayerWrapper: prepared, starting playback with volume $currentVolume")
        try {
            mp.setVolume(currentVolume, currentVolume)
            if (!isPaused) {
                mp.start()
            }
        } catch (e: Exception) {
            Debug.Log("MediaPlayerWrapper: Error starting onPrepared: ${e.message}")
        }
    }

    fun play(str: String) {
        synchronized(this) {
            if (mustExit) return
            mustPlay = true
            mustExit = false
            isPaused = false
            currentVolume = 1.0f
            var trim = str.trim()
            if (trim.lowercase().startsWith("http://")) {
                trim = "http://" + trim.substring(7)
            } else if (trim.lowercase().startsWith("https://")) {
                trim = "https://" + trim.substring(8)
            }
            mediaURL = trim
            if (workingThread == null) {
                workingThread = Thread(this)
                workingThread!!.start()
            }
            (this as Object).notify()
        }
    }

    fun pause() {
        synchronized(this) {
            isPaused = true
            try {
                if (mediaPlayer?.isPlaying == true) {
                    mediaPlayer?.pause()
                    Debug.Log("MediaPlayerWrapper: paused playback")
                }
            } catch (e: Exception) {
                Debug.Log("MediaPlayerWrapper: Error pausing playback: ${e.message}")
            }
        }
    }

    fun resume() {
        synchronized(this) {
            isPaused = false
            try {
                if (mediaPlayer != null && !mediaPlayer!!.isPlaying) {
                    mediaPlayer?.start()
                    Debug.Log("MediaPlayerWrapper: resumed playback")
                }
            } catch (e: Exception) {
                Debug.Log("MediaPlayerWrapper: Error resuming playback: ${e.message}")
            }
        }
    }

    fun setVolume(vol: Float) {
        synchronized(this) {
            currentVolume = vol.coerceIn(0.0f, 1.0f)
            try {
                mediaPlayer?.setVolume(currentVolume, currentVolume)
                Debug.Log("MediaPlayerWrapper: setVolume to $currentVolume")
            } catch (e: Exception) {
                Debug.Log("MediaPlayerWrapper: Error setting volume: ${e.message}")
            }
        }
    }

    fun release() {
        synchronized(this) {
            mustPlay = false
            mustExit = true
            isPaused = false
            mediaURL = ""
            workingThread = null
            (this as Object).notify()
        }
    }

    override fun run() {
        Debug.Log("MediaPlayerWrapper: working thread started")
        while (!mustExit) {
            if (mustPlay) {
                Debug.Log("MediaPlayerWrapper: working thread must play, URL = $mediaURL")
                mediaPlayer?.release()
                mediaPlayer = null
                val mp = MediaPlayer().also {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.21) {
                        it.setAudioAttributes(
                            AudioAttributes.Builder()
                                .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                                .setUsage(AudioAttributes.USAGE_MEDIA)
                                .build()
                        )
                    } else {
                        @Suppress("DEPRECATION")
                        it.setAudioStreamType(AudioManager.STREAM_MUSIC)
                    }
                    it.setOnErrorListener(this)
                    it.setOnInfoListener(this)
                    it.setOnPreparedListener(this)
                }
                mediaPlayer = mp
                try {
                    mp.setDataSource(mediaURL)
                } catch (e: Exception) {
                    Debug.Log("MediaPlayerWrapper: Failed to set data source to $mediaURL")
                    e.printStackTrace()
                    mustPlay = false
                }
                try {
                    mp.prepareAsync()
                } catch (e: Exception) {
                    Debug.Log("MediaPlayerWrapper: PrepareAsync exception while playing $mediaURL")
                    e.printStackTrace()
                    mustPlay = false
                }
            } else {
                Debug.Log("MediaPlayerWrapper: working thread must stop playing")
                mediaPlayer?.release()
                mediaPlayer = null
            }
            Debug.Log("MediaPlayerWrapper: working thread waiting")
            synchronized(this) {
                try {
                    (this as Object).wait()
                } catch (e: InterruptedException) {
                    e.printStackTrace()
                }
            }
            Debug.Log("MediaPlayerWrapper: working thread wake up")
        }
        Debug.Log("MediaPlayerWrapper: working thread exiting")
        mediaPlayer?.release()
        mediaPlayer = null
    }

    fun stop() {
        synchronized(this) {
            if (mustExit) return
            mustPlay = false
            isPaused = false
            mediaURL = ""
            (this as Object).notify()
        }
    }
}
