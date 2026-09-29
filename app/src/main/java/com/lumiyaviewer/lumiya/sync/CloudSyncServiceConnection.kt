package com.lumiyaviewer.lumiya.sync

import com.lumiyaviewer.lumiya.compat.PlatformCompat
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.Message
import android.os.Messenger
import androidx.core.app.NotificationCompat
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.cloud.common.Bundleable
import com.lumiyaviewer.lumiya.cloud.common.CloudSyncMessenger
import com.lumiyaviewer.lumiya.cloud.common.LogMessagesCompleted
import com.lumiyaviewer.lumiya.cloud.common.LogMessagesFlushed
import com.lumiyaviewer.lumiya.cloud.common.LogSyncStart
import com.lumiyaviewer.lumiya.cloud.common.LogSyncStatus
import com.lumiyaviewer.lumiya.cloud.common.MessageType
import com.lumiyaviewer.lumiya.licensing.LicenseChecker
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.concurrent.atomic.AtomicBoolean

class CloudSyncServiceConnection(
    private val context: Context,
    private val userManager: UserManager
) : ServiceConnection {

    private var toPluginMessenger: Messenger? = null
    private val mainThreadHandler = Handler(Looper.getMainLooper())
    private val syncingStarted = AtomicBoolean(false)

    private val fromPluginHandler = object : Handler(Looper.getMainLooper()) {
        override fun handleMessage(message: Message) {
            if (message.what == 100 && message.obj is Bundle) {
                val bundle = message.obj as Bundle
                if (bundle.containsKey("message") && bundle.containsKey("messageType")) {
                    try {
                        when (MessageType.valueOf(bundle.getString("messageType")!!)) {
                            MessageType.LogMessagesCompleted ->
                                this@CloudSyncServiceConnection.onLogMessagesCompleted(
                                    LogMessagesCompleted(bundle.getBundle("message")!!)
                                )
                            MessageType.LogMessagesFlushed ->
                                this@CloudSyncServiceConnection.onLogMessagesFlushed(
                                    LogMessagesFlushed(bundle.getBundle("message")!!)
                                )
                            MessageType.LogSyncStatus ->
                                this@CloudSyncServiceConnection.onLogSyncStatus(
                                    LogSyncStatus(bundle.getBundle("message")!!)
                                )
                            else -> { /* other message types ignored */ }
                        }
                    } catch (e: Exception) {
                        Debug.Warning(e)
                    }
                }
            }
        }
    }
    private val fromPluginMessenger = Messenger(fromPluginHandler)

    fun onLogMessagesCompleted(logMessagesCompleted: LogMessagesCompleted) {
        Debug.Printf(
            "LumiyaCloud: written messages until %d for agent %s",
            logMessagesCompleted.lastWrittenMessageID,
            logMessagesCompleted.agentUUID
        )
        if (userManager.getUserID() == logMessagesCompleted.agentUUID) {
            userManager.getSyncManager().onMessagesWritten(logMessagesCompleted.lastWrittenMessageID)
        }
    }

    fun onLogMessagesFlushed(logMessagesFlushed: LogMessagesFlushed) {
        Debug.Printf("LumiyaCloud: flushed some messages for agent %s", logMessagesFlushed.agentUUID)
        if (userManager.getUserID() == logMessagesFlushed.agentUUID) {
            userManager.getSyncManager().onMessagesFlushed(logMessagesFlushed.messageIDs)
        }
    }

    fun onLogSyncStatus(logSyncStatus: LogSyncStatus) {
        Debug.Printf(
            "LumiyaCloud: got logSyncStatus %s, plugin version %d",
            logSyncStatus.status,
            logSyncStatus.pluginVersionCode
        )
        if (toPluginMessenger != null) {
            when (logSyncStatus.status) {
                LogSyncStatus.Status.AppVersionRejected -> {
                    val intent = Intent("android.intent.action.VIEW")
                    intent.data = Uri.parse(LicenseChecker.APP_STORE_URL)
                    showSyncingError(
                        context.getString(R.string.cloud_sync_app_outdated),
                        context.getString(R.string.cloud_sync_app_outdated_long),
                        intent
                    )
                }
                LogSyncStatus.Status.GoogleDriveError -> {
                    val intent = Intent("android.intent.action.VIEW")
                    intent.data = Uri.parse("https://drive.google.com/")
                    showSyncingError(
                        context.getString(R.string.cloud_sync_drive_error),
                        if (Strings.isNullOrEmpty(logSyncStatus.errorMessage))
                            context.getString(R.string.cloud_sync_drive_error_long)
                        else
                            context.getString(R.string.cloud_sync_drive_error_message, logSyncStatus.errorMessage),
                        intent
                    )
                }
                LogSyncStatus.Status.Ready -> {
                    if (logSyncStatus.pluginVersionCode < REQUIRED_PLUGIN_VERSION) {
                        val intent = Intent("android.intent.action.VIEW")
                        intent.data = Uri.parse(LicenseChecker.CLOUD_PLUGIN_URL)
                        showSyncingError(
                            context.getString(R.string.cloud_sync_plugin_outdated),
                            context.getString(R.string.cloud_sync_plugin_outdated_long),
                            intent
                        )
                    } else {
                        syncingStarted.set(true)
                        userManager.getSyncManager().startSyncing(this)
                    }
                }
                else -> { /* other statuses ignored */ }
            }
        }
    }

    fun disconnect() {
        mainThreadHandler.post {
            Debug.Printf("LumiyaCloud: disconnecting from sync service")
            context.unbindService(this@CloudSyncServiceConnection)
        }
    }

    override fun onServiceConnected(componentName: ComponentName, iBinder: IBinder) {
        Debug.Printf("LumiyaCloud: service connected")
        toPluginMessenger = Messenger(iBinder)
        try {
            sendMessage(
                MessageType.LogSyncStart,
                LogSyncStart(
                    context.packageManager.getPackageInfo(context.packageName, 0).versionCode,
                    userManager.getUserID()
                )
            )
        } catch (e: Exception) {
            Debug.Warning(e)
        }
    }

    override fun onServiceDisconnected(componentName: ComponentName) {
        Debug.Printf("LumiyaCloud: service disconnected")
    }

    fun sendMessage(messageType: MessageType, bundleable: Bundleable): Boolean {
        val messenger = toPluginMessenger ?: return false
        return CloudSyncMessenger.sendMessage(messenger, messageType, bundleable, fromPluginMessenger)
    }

    fun showSyncingError(title: String, message: String, intent: Intent) {
        val builder = NotificationCompat.Builder(context)
        builder.setSmallIcon(R.drawable.ic_cloud_sync_notify)
            .setContentTitle(title)
            .setContentText(message)
            .setDefaults(0)
            .setOngoing(false)
            .setAutoCancel(true)
            .setContentIntent(
                PlatformCompat.getActivity(context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT)
            )
            .setOnlyAlertOnce(true)
        (context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
            .notify(R.id.google_drive_problem_notify, builder.build())
    }

    fun stopSyncing() {
        if (!syncingStarted.getAndSet(false)) {
            disconnect()
        } else if (toPluginMessenger != null) {
            userManager.getSyncManager().stopSyncing()
        }
    }

    companion object {
        private const val REQUIRED_PLUGIN_VERSION = 1

        @JvmStatic
        fun checkPluginInstalled(context: Context): Boolean {
            val intent = Intent()
            intent.component = ComponentName(
                "com.lumiyaviewer.lumiya.cloud",
                "com.lumiyaviewer.lumiya.cloud.DriveSyncService"
            )
            val queryIntentServices = context.packageManager.queryIntentServices(intent, 0)
            return queryIntentServices != null && queryIntentServices.size > 0
        }
    }
}
