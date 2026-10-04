package com.lumiyaviewer.lumiya

import com.lumiyaviewer.lumiya.compat.PlatformCompat
import android.app.Notification
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.ServiceInfo
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Message
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.media.AudioIntentReceiver
import com.lumiyaviewer.lumiya.media.AudioManagerWrapper
import com.lumiyaviewer.lumiya.media.MediaPlayerWrapper
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.profiles.ParcelPropertiesFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.media.StreamingMediaActivity
import java.lang.ref.WeakReference
import java.util.UUID

class StreamingMediaService : Service() {

    private var noisyReceiver = AudioIntentReceiver()
    private var notify: Notification? = null
    private var mediaWrapper = MediaPlayerWrapper()
    private var audioManagerWrapper: AudioManagerWrapper? = null
    private var lastURL = ""
    private var lastLocationName = ""
    private var lastLocationDesc = ""
    private var lastActiveAgentUUID: UUID? = null
    private var lastParcelData: ParcelData? = null
    private var isPausedForTransientLoss = false
    private val mHandler = AudioFocusChangeHandler(this)

    private class AudioFocusChangeHandler(service: StreamingMediaService) : Handler() {
        private val streamingMediaService = WeakReference(service)

        override fun handleMessage(message: Message) {
            if (message.what != MSG_ON_AUDIO_FOCUS_CHANGE) return
            streamingMediaService.get()?.handleAudioFocusChange(message.arg1)
        }
    }

    fun handleAudioFocusChange(focusChange: Int) {
        Debug.Log("StreamingMediaService: focusChange = $focusChange")
        when (focusChange) {
            AudioManager.AUDIOFOCUS_GAIN -> {
                mediaWrapper.setVolume(1.0f)
                if (isPausedForTransientLoss) {
                    mediaWrapper.resume()
                    isPausedForTransientLoss = false
                }
            }
            AudioManager.AUDIOFOCUS_LOSS -> {
                isPausedForTransientLoss = false
                isPlayingMedia.setData(SubscriptionSingleKey.Value, false)
                mediaWrapper.stop()
                audioManagerWrapper?.abandonAudioFocus()
                safeUnregisterReceiver()
                stopForeground(STOP_FOREGROUND_REMOVE)
                notify = null
                stopSelf()
            }
            AudioManager.AUDIOFOCUS_LOSS_TRANSIENT -> {
                isPausedForTransientLoss = true
                mediaWrapper.pause()
            }
            AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK -> {
                mediaWrapper.setVolume(0.2f)
            }
        }
    }

    private fun stopServiceAndMedia() {
        isPausedForTransientLoss = false
        isPlayingMedia.setData(SubscriptionSingleKey.Value, false)
        mediaWrapper.stop()
        audioManagerWrapper?.abandonAudioFocus()
        safeUnregisterReceiver()
        stopForeground(STOP_FOREGROUND_REMOVE)
        notify = null
        stopSelf()
    }

    private fun handleStartService(intent: Intent?) {
        if (intent == null) return
        val action = intent.action ?: ""
        if (action != "com.lumiyaviewer.lumiya.ACTION_PLAY_MEDIA") {
            stopServiceAndMedia()
            return
        }
        val url = intent.getStringExtra(MEDIA_URL_KEY) ?: ""
        Debug.Log("StreamingMediaService: service is started, playing $url")
        lastURL = url
        lastLocationName = intent.getStringExtra(LOCATION_NAME_KEY) ?: ""
        lastLocationDesc = intent.getStringExtra(LOCATION_DESC_KEY) ?: ""
        @Suppress("DEPRECATION")
        lastParcelData = if (intent.hasExtra(ParcelPropertiesFragment.PARCEL_DATA_KEY))
            intent.getSerializableExtra(ParcelPropertiesFragment.PARCEL_DATA_KEY) as? ParcelData
        else null
        lastActiveAgentUUID = ActivityUtils.getActiveAgentID(intent)
        if (audioManagerWrapper == null || audioManagerWrapper!!.requestAudioFocus()) {
            showNotification()
            safeRegisterReceiver()
            isPlayingMedia.setData(SubscriptionSingleKey.Value, true)
            mediaWrapper.play(url)
        }
    }

    private fun safeRegisterReceiver() {
        try {
            registerReceiver(noisyReceiver, IntentFilter("android.media.AUDIO_BECOMING_NOISY"))
        } catch (_: Exception) {
            Debug.Log("StreamingMediaService: Failed to register noisy receiver")
        }
    }

    private fun safeUnregisterReceiver() {
        try {
            unregisterReceiver(noisyReceiver)
        } catch (_: Exception) {
            Debug.Log("StreamingMediaService: Failed to unregister noisy receiver")
        }
    }

    private fun showNotification() {
        val stopIntent = PlatformCompat.getService(
            this, 0,
            Intent(this, StreamingMediaService::class.java),
            PendingIntent.FLAG_ONE_SHOT
        )
        val openIntent = Intent(this, StreamingMediaActivity::class.java)
        ActivityUtils.setActiveAgentID(openIntent, lastActiveAgentUUID)
        openIntent.putExtra(ParcelPropertiesFragment.PARCEL_DATA_KEY, lastParcelData)
        val builder = NotificationCompat.Builder(this)
        builder.setSmallIcon(R.drawable.ic_playing_media)
            .setContentTitle("Playing media")
            .setContentText(lastLocationName)
            .setDefaults(0)
            .setOngoing(true)
            .setContentIntent(
                PlatformCompat.getActivity(this, 0, openIntent, PendingIntent.FLAG_UPDATE_CURRENT)
            )
            .addAction(R.drawable.icon_material_stop, "Stop", stopIntent)
            .setDeleteIntent(stopIntent)
            .setOnlyAlertOnce(true)
        val notification = builder.build()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(R.id.media_notify_id, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK)
        } else {
            startForeground(R.id.media_notify_id, notification)
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        audioManagerWrapper = AudioManagerWrapper(this)
        audioManagerWrapper!!.setHandler(mHandler, MSG_ON_AUDIO_FOCUS_CHANGE)
    }

    override fun onDestroy() {
        mediaWrapper.release()
        audioManagerWrapper?.abandonAudioFocus()
        safeUnregisterReceiver()
        stopForeground(STOP_FOREGROUND_REMOVE)
        notify = null
        isPlayingMedia.setData(SubscriptionSingleKey.Value, false)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        handleStartService(intent)
        return START_FLAG_RETRY
    }

    companion object {
        const val LOCATION_DESC_KEY = "location_desc"
        const val LOCATION_NAME_KEY = "location_name"
        const val MEDIA_URL_KEY = "media_url"
        private const val MSG_ON_AUDIO_FOCUS_CHANGE = 100

        @JvmField
        val isPlayingMedia = SubscriptionSingleDataPool<Boolean>()

        @JvmStatic
        fun startServiceCompat(context: Context, intent: Intent) {
            ContextCompat.startForegroundService(context, intent)
        }

        @JvmStatic
        fun startStreamingMediaService(context: Context, userManager: UserManager?) {
            if (userManager == null) return
            val locationInfo = userManager.currentLocationInfoSnapshot ?: return
            val parcelData = locationInfo.parcelData() ?: return
            val mediaURL = parcelData.mediaURL
            if (Strings.isNullOrEmpty(mediaURL)) return
            val intent = Intent(context, StreamingMediaService::class.java)
            intent.action = "com.lumiyaviewer.lumiya.ACTION_PLAY_MEDIA"
            ActivityUtils.setActiveAgentID(intent, userManager.getUserID())
            intent.putExtra(ParcelPropertiesFragment.PARCEL_DATA_KEY, parcelData)
            intent.putExtra(MEDIA_URL_KEY, mediaURL)
            intent.putExtra(LOCATION_NAME_KEY, parcelData.name)
            startServiceCompat(context, intent)
        }
    }
}
