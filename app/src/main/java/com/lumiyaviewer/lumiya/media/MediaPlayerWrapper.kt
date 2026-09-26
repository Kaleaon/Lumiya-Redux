package com.lumiyaviewer.lumiya.media

import android.media.MediaPlayer
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

    override fun onError(mediaPlayer: MediaPlayer, what: Int, extra: Int): Boolean {
        Debug.Log("MediaPlayerWrapper: onError: what = $what, extra = $extra")
        return false
    }

    override fun onInfo(mediaPlayer: MediaPlayer, what: Int, extra: Int): Boolean {
        Debug.Log("MediaPlayerWrapper: onInfo: what = $what, extra = $extra")
        return false
    }

    override fun onPrepared(mediaPlayer: MediaPlayer) {
        Debug.Log("MediaPlayerWrapper: prepared, starting playback")
        mediaPlayer.start()
    }

    fun play(str: String) {
        synchronized(this) {
            if (mustExit) return
            mustPlay = true
            mustExit = false
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

    fun release() {
        synchronized(this) {
            mustPlay = false
            mustExit = true
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
                @Suppress("DEPRECATION")
                val mp = MediaPlayer().also {
                    it.setAudioStreamType(3)
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
            mediaURL = ""
            (this as Object).notify()
        }
    }
}
