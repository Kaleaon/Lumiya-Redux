package com.lumiyaviewer.lumiya

import com.lumiyaviewer.lumiya.compat.PlatformCompat
import android.app.Activity
import android.app.Notification
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.SharedPreferences
import android.content.pm.ServiceInfo
import android.os.Build
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.Uri
import android.os.PowerManager
import android.net.wifi.WifiManager
import android.os.Binder
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.Message
import androidx.annotation.Nullable
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import androidx.preference.PreferenceManager
import com.google.common.base.Strings
import com.google.vr.cardboard.TransitionView
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.licensing.LicenseChecker
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthParams
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.events.SLConnectionStateChangedEvent
import com.lumiyaviewer.lumiya.slproto.events.SLDisconnectEvent
import com.lumiyaviewer.lumiya.slproto.events.SLLoginResultEvent
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotifications
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.sync.CloudSyncServiceConnection
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatFragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.ConnectedActivity
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels
import com.lumiyaviewer.lumiya.ui.notify.OnlineNotificationInfo
import com.lumiyaviewer.lumiya.ui.settings.NotificationSettings
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import com.lumiyaviewer.lumiya.utils.LEDAction
import com.lumiyaviewer.lumiya.voice.common.model.VoiceLoginInfo
import com.lumiyaviewer.lumiya.voice.webrtc.WebRTCVoiceClient
import java.lang.ref.WeakReference
import java.util.Collections
import java.util.HashMap
import java.util.HashSet
import java.util.UUID

class GridConnectionService : Service(), SharedPreferences.OnSharedPreferenceChangeListener {

    private var unreadNotifySubscription: Subscription<Boolean, UnreadNotifications>? = null
    private val eventBus: EventBus = EventBus.getInstance()
    private val mHandler = Handler(Looper.getMainLooper())
    private var prefs: SharedPreferences? = null
    private var cloudSyncEnabled = false
    private var startingNotificationVisible = false

    @Nullable
    private var cloudSyncUserManager: UserManager? = null
    private var cloudPluginReceiverRegistered = false

    private val currentLocationInfo = SubscriptionData<SubscriptionSingleKey, CurrentLocationInfo>(
        UIThreadExecutor.getInstance(),
        Subscription.OnData<CurrentLocationInfo> { info -> onCurrentLocationInfo(info) }
    )

    private var connectedAgentNameRetriever: ChatterNameRetriever? = null
    private val shownNotificationIds: MutableSet<Int> = Collections.newSetFromMap(Collections.synchronizedMap(HashMap()))
    private var onlineNotificationInfo = OnlineNotificationInfo(onlineNotify, this, gridName, gridConnection, connectedAgentNameRetriever, null)
    private var wifiLock: WifiManager.WifiLock? = null
    private var partialWakeLock: PowerManager.WakeLock? = null
    private var screenOn = true
    private var isBackgroundState = false

    private val screenReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            when (intent.action) {
                Intent.ACTION_SCREEN_OFF -> {
                    screenOn = false
                    updateBackgroundState()
                }
                Intent.ACTION_SCREEN_ON -> {
                    screenOn = true
                    updateBackgroundState()
                }
            }
        }
    }
    private val mBinder: IBinder = GridServiceBinder()

    private var networkCallback: ConnectivityManager.NetworkCallback? = null
    private var currentActiveNetwork: Network? = null

    fun getCurrentActiveNetwork(): Network? = currentActiveNetwork

    private fun registerNetworkCallback() {
        if (networkCallback != null) return
        val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager ?: return
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                Debug.Printf("GridConnectionService: Network onAvailable: %s", network)
                handleNetworkRebind(cm, network)
            }

            override fun onLost(network: Network) {
                Debug.Printf("GridConnectionService: Network onLost: %s", network)
                if (currentActiveNetwork == network) {
                    currentActiveNetwork = null
                    gridConnection?.onNetworkLost()
                }
            }

            override fun onCapabilitiesChanged(network: Network, networkCapabilities: NetworkCapabilities) {
                val hasInternet = networkCapabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                Debug.Printf("GridConnectionService: Network capabilities changed: %s (hasInternet=%b)", network, hasInternet)
                if (hasInternet && currentActiveNetwork != network) {
                    handleNetworkRebind(cm, network)
                }
            }
        }
        networkCallback = callback
        try {
            cm.registerDefaultNetworkCallback(callback)
            Debug.Printf("GridConnectionService: Default network callback registered")
        } catch (e: Exception) {
            Debug.Warning(e)
        }
    }

    private fun handleNetworkRebind(cm: ConnectivityManager, network: Network) {
        if (currentActiveNetwork == network) return
        currentActiveNetwork = network
        try {
            cm.bindProcessToNetwork(network)
            Debug.Printf("GridConnectionService: Process bound to network %s", network)
        } catch (e: Exception) {
            Debug.Warning(e)
        }
        gridConnection?.onNetworkRebound(network)
    }

    private fun unregisterNetworkCallback() {
        val callback = networkCallback ?: return
        networkCallback = null
        currentActiveNetwork = null
        val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager ?: return
        try {
            cm.bindProcessToNetwork(null)
            cm.unregisterNetworkCallback(callback)
            Debug.Printf("GridConnectionService: Default network callback unregistered")
        } catch (e: Exception) {
            Debug.Warning(e)
        }
    }

    private val licenseCheckHandler = object : Handler(Looper.getMainLooper()) {
        override fun handleMessage(message: Message) {
            when (message.what) {
                R.id.msg_licensing_allow -> {
                    Debug.Printf("License: License check ok.")
                    if (message.obj is SLAuthParams) {
                        this@GridConnectionService.performLogin(message.obj as SLAuthParams)
                    }
                }
                R.id.msg_licensing_app_error -> {
                    val str = if (message.obj is String) message.obj as String else "Internal application error"
                    Debug.Printf("License: License check app error: %s", str)
                    this@GridConnectionService.eventBus.publish(
                        SLLoginResultEvent(false, "License check failed: $str.", null)
                    )
                }
                R.id.msg_licensing_dont_allow -> {
                    Debug.Printf("License: License check failed.")
                    this@GridConnectionService.eventBus.publish(
                        SLLoginResultEvent(false, "You don't have valid license to use this application.", null)
                    )
                }
            }
        }
    }

    private val cloudPluginInstalledReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            val pkg = Strings.nullToEmpty(intent.data?.schemeSpecificPart)
            if (pkg != "com.lumiyaviewer.lumiya.cloud") return
            val conn = gridConnection ?: return
            if (conn.connectionState != SLGridConnection.ConnectionState.Connected) return
            val agentUUID = conn.activeAgentUUID ?: return
            val userManager = UserManager.getUserManager(agentUUID) ?: return
            this@GridConnectionService.startCloudSync(userManager)
        }
    }

    private var cloudSyncServiceConnection: CloudSyncServiceConnection? = null
    var webRTCVoiceClient: WebRTCVoiceClient? = null

    private val onActiveAgentNameUpdated = ChatterNameRetriever.OnChatterNameUpdated { _ ->
        updateOnlineNotification()
    }

    inner class GridServiceBinder : Binder() {
        fun getEventBus(): EventBus = this@GridConnectionService.eventBus
        fun getGridConn(): SLGridConnection? = gridConnection
    }

    init {
        getGridConnection()
        eventBus.subscribe(this, null, mHandler)
    }

    private fun connectToWebRTC(voiceLoginInfo: VoiceLoginInfo, userManager: UserManager) {
        if (webRTCVoiceClient == null) {
            webRTCVoiceClient = WebRTCVoiceClient(this)
        }
        if (voiceLoginInfo.provisionCapURL != null) {
            webRTCVoiceClient!!.setCredentials(
                voiceLoginInfo.provisionCapURL,
                voiceLoginInfo.signalingCapURL,
                voiceLoginInfo.agentUUID
            )
        }
        webRTCVoiceClient!!.setUserManager(userManager)
        webRTCVoiceClient!!.login()
    }

    private fun handleStartService(intent: Intent?) {
        Debug.Printf("GridConnectionService: service is now started, intent is %s",
            if (intent != null) "not null" else "null")
        updateOnlineNotification()
        if (intent != null) {
            val action = Strings.nullToEmpty(intent.action)
            if (action == LOGIN_ACTION) {
                LicenseChecker(applicationContext, licenseCheckHandler, SLAuthParams(intent))
            }
        }
    }

    private fun hideUnreadNotificationSingle(id: Int) {
        if (shownNotificationIds.contains(id)) {
            shownNotificationIds.remove(id)
            (getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager).cancel(id)
        }
    }

    fun onCurrentLocationInfo(currentLocationInfo: CurrentLocationInfo) {
        updateOnlineNotification()
    }

    fun onUnreadNotification(unreadNotifications: UnreadNotifications) {
        showUnreadNotification(unreadNotifications)
    }

    fun performLogin(authParams: SLAuthParams) {
        gridName = authParams.gridName
        gridConnection!!.Connect(authParams)
    }

    private fun readPreferences(sharedPreferences: SharedPreferences) {
        onlineNotify = sharedPreferences.getBoolean("onlineNotify", true)
        soundOnNotify = sharedPreferences.getBoolean("soundOnNotify", true)
        cloudSyncEnabled = sharedPreferences.getBoolean("sync_to_gdrive", false)
        notifyLocalChat.Load(sharedPreferences)
        notifyPrivate.Load(sharedPreferences)
        notifyGroup.Load(sharedPreferences)
        SLGridConnection.setAutoresponseInfo(
            sharedPreferences.getBoolean("autoresponse", false),
            sharedPreferences.getString("autoresponseText",
                "(Autoresponse) I have auto-response feature enabled. I will respond shortly.")
                ?: "(Autoresponse) I have auto-response feature enabled. I will respond shortly."
        )
        Debug.Log("GridConnectionService: prefs: onlineNotify = $onlineNotify")
        Debug.Log("GridConnectionService: prefs: soundOnNotify = $soundOnNotify")
        if (gridConnection != null) {
            try {
                gridConnection!!.modules.HandleGlobalOptionsChange()
            } catch (_: SLGridConnection.NotConnectedException) {
            }
        }
        updateOnlineNotification()
        updateCloudSyncStatus()
    }

    private fun showUnreadNotification(unreadNotifications: UnreadNotifications) {
        val notificationChannels = NotificationChannels.getInstance()
        var filtered = unreadNotifications
        if (notificationChannels.areNotificationsSystemControlled()) {
            filtered = unreadNotifications.filter(notificationChannels.getEnabledTypes(this))
        }
        if (filtered.notificationGroups().isEmpty()) {
            if (shownNotificationIds.isEmpty()) return
            val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            for (id in shownNotificationIds) {
                nm.cancel(id)
            }
            shownNotificationIds.clear()
            return
        }
        val merge = filtered.merge()
        showUnreadNotificationSingle(
            merge, R.id.unread_notify_id,
            notificationChannels.getChannelName(
                notificationChannels.getChannelByType(
                    merge.mostImportantFreshType().or(merge.mostImportantType().or(NotificationType.LocalChat))
                )
            ),
            NotificationChannels.MESSAGE_NOTIFICATION_GROUP, true, null
        )
        for (notificationType in NotificationType.VALUES) {
            val channelByType = notificationChannels.getChannelByType(notificationType) ?: continue
            showUnreadNotificationSingle(
                filtered.notificationGroups()[notificationType],
                channelByType.notificationId,
                notificationChannels.getChannelName(channelByType),
                NotificationChannels.MESSAGE_NOTIFICATION_GROUP, false,
                (9 - notificationType.priority).toString()
            )
        }
    }

    private fun showUnreadNotificationSingle(
        unreadNotificationInfo: UnreadNotificationInfo?,
        id: Int,
        channelName: String,
        groupKey: String?,
        isGroupSummary: Boolean,
        sortKey: String?
    ) {
        val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val hasContent = unreadNotificationInfo != null &&
                (unreadNotificationInfo.totalUnreadCount() != 0 || unreadNotificationInfo.objectPopupInfo().objectPopupsCount() != 0)
        if (!hasContent) {
            hideUnreadNotificationSingle(id)
            return
        }
        unreadNotificationInfo!!
        Debug.Log("GridConnectionService: updateUnreadNotification: notification state changed.")
        val builder = NotificationCompat.Builder(this, channelName)
        builder.setSmallIcon(R.drawable.ic_unread_icon)
        if (groupKey != null) {
            builder.setGroup(groupKey)
            builder.setGroupSummary(isGroupSummary)
            builder.setGroupAlertBehavior(NotificationCompat.GROUP_ALERT_CHILDREN)
            if (sortKey != null) builder.setSortKey(sortKey)
        }
        val userManager = UserManager.getUserManager(unreadNotificationInfo.agentUUID())
        val singleSource = if (unreadNotificationInfo.unreadSources().size == 1)
            unreadNotificationInfo.unreadSources()[0] else null

        val createIntent = ChatFragmentActivityFactory.getInstance().createIntent(
            this,
            if (singleSource != null) ChatFragment.makeSelection(singleSource.chatterID()) else null
        )
        createIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
        ActivityUtils.setActiveAgentID(createIntent, unreadNotificationInfo.agentUUID())

        val freshSource = if (unreadNotificationInfo.singleFreshSource().isPresent)
            unreadNotificationInfo.singleFreshSource().get()
        else {
            var best: UnreadNotificationInfo.UnreadMessageSource? = null
            for (src in unreadNotificationInfo.unreadSources()) {
                if (best == null || src.unreadMessagesCount() > best.unreadMessagesCount()) {
                    best = src
                }
            }
            best
        }
        if (freshSource != null) {
            createIntent.putExtra(MasterDetailsActivity.WEAK_SELECTION_KEY, ChatFragment.makeSelection(freshSource.chatterID()))
        }

        val finalIntent = if (userManager != null) {
            userManager.unreadNotificationManager.captureNotify(unreadNotificationInfo, createIntent) ?: createIntent
        } else createIntent

        var shouldShow = hasContent
        if (singleSource != null && unreadNotificationInfo.objectPopupInfo().objectPopupsCount() == 0) {
            val title = singleSource.chatterName().or(gridName)
            builder.setContentTitle(title)
            if (singleSource.unreadMessagesCount() == 1 && singleSource.unreadMessages().size == 1) {
                builder.setContentText(singleSource.unreadMessages()[0].getPlainTextMessage(this, singleSource.chatterID().userManager, true))
            } else {
                builder.setContentText(String.format(getString(R.string.unread_messages), singleSource.unreadMessagesCount()))
            }
            if (singleSource.unreadMessages().size > 1) {
                val inboxStyle = NotificationCompat.InboxStyle()
                for (msg in singleSource.unreadMessages()) {
                    inboxStyle.addLine(msg.getPlainTextMessage(
                        this, singleSource.chatterID().userManager,
                        singleSource.chatterID().chatterType == ChatterID.ChatterType.User, "  ", " "
                    ))
                }
                inboxStyle.setBigContentTitle(title)
                inboxStyle.setSummaryText(String.format(getString(R.string.unread_messages), unreadNotificationInfo.totalUnreadCount()))
                builder.setStyle(inboxStyle)
            }
        } else if (unreadNotificationInfo.totalUnreadCount() != 0) {
            var headline = resources.getQuantityString(R.plurals.new_messages, unreadNotificationInfo.totalUnreadCount(), unreadNotificationInfo.totalUnreadCount())
            if (unreadNotificationInfo.objectPopupInfo().objectPopupsCount() != 0) {
                headline += resources.getQuantityString(R.plurals.and_questions, unreadNotificationInfo.objectPopupInfo().objectPopupsCount(), unreadNotificationInfo.objectPopupInfo().objectPopupsCount())
            }
            builder.setContentTitle(headline)

            var firstName: String? = null
            for (src in unreadNotificationInfo.unreadSources()) {
                if (src.chatterName().isPresent) {
                    firstName = src.chatterName().orNull()
                    break
                }
            }
            val count = unreadNotificationInfo.unreadSources().size
            val summary = if (firstName != null) {
                if (count > 1) "$firstName ${String.format(getString(R.string.other_chatters), count - 1)}"
                else firstName
            } else {
                String.format(getString(R.string.chat_sessions), count)
            }
            builder.setContentText(summary)
            val inboxStyle = NotificationCompat.InboxStyle()
            for (src in unreadNotificationInfo.unreadSources()) {
                for (msg in src.unreadMessages()) {
                    inboxStyle.addLine(msg.getPlainTextMessage(this, src.chatterID().userManager, false, "  ", " "))
                }
            }
            inboxStyle.setBigContentTitle(String.format(getString(R.string.unread_messages), unreadNotificationInfo.totalUnreadCount()))
            inboxStyle.setSummaryText(summary)
            builder.setStyle(inboxStyle)
        } else if (unreadNotificationInfo.objectPopupInfo().objectPopupsCount() != 0) {
            finalIntent.putExtra(ConnectedActivity.OBJECT_POPUP_NOTIFICATION, true)
            if (finalIntent.getBundleExtra(MasterDetailsActivity.INTENT_SELECTION_KEY) == null &&
                finalIntent.getBundleExtra(MasterDetailsActivity.WEAK_SELECTION_KEY) == null) {
                finalIntent.putExtra(MasterDetailsActivity.INTENT_SELECTION_KEY,
                    ChatFragment.makeSelection(ChatterID.getLocalChatterID(unreadNotificationInfo.agentUUID())))
            }
            val lastPopup = unreadNotificationInfo.objectPopupInfo().lastObjectPopup().orNull()
            if (unreadNotificationInfo.objectPopupInfo().freshObjectPopupsCount() == 1 && lastPopup != null) {
                builder.setContentTitle(lastPopup.objectName())
                builder.setContentText(lastPopup.message())
            } else {
                builder.setContentTitle(resources.getQuantityString(R.plurals.new_questions,
                    unreadNotificationInfo.objectPopupInfo().objectPopupsCount(),
                    unreadNotificationInfo.objectPopupInfo().objectPopupsCount()))
                if (lastPopup != null) {
                    builder.setContentText("${lastPopup.objectName()}: ${lastPopup.message()}")
                } else {
                    builder.setContentText(resources.getQuantityString(R.plurals.new_questions,
                        unreadNotificationInfo.objectPopupInfo().objectPopupsCount(),
                        unreadNotificationInfo.objectPopupInfo().objectPopupsCount()))
                }
            }
        } else {
            shouldShow = false
        }

        if (!shouldShow) {
            hideUnreadNotificationSingle(id)
            return
        }

        var ticker: String? = null
        if (unreadNotificationInfo.freshMessagesCount() > 0) {
            val singleFresh = unreadNotificationInfo.singleFreshSource().orNull()
            if (singleFresh == null) {
                ticker = String.format(getString(R.string.unread_messages), unreadNotificationInfo.freshMessagesCount())
            } else if (unreadNotificationInfo.freshMessagesCount() == 1 && singleFresh.unreadMessages().isNotEmpty()) {
                val typeLabel = when (singleFresh.chatterID().chatterType) {
                    ChatterID.ChatterType.Local -> getString(R.string.chat_type_ticker_local)
                    ChatterID.ChatterType.Group -> getString(R.string.chat_type_ticker_group)
                    else -> getString(R.string.chat_type_ticker_im)
                }
                var t = "[$typeLabel] ${singleFresh.unreadMessages()[singleFresh.unreadMessages().size - 1]
                    .getPlainTextMessage(this, singleFresh.chatterID().userManager, false).toString().trim()}"
                val nl = t.indexOf("\n")
                if (nl >= 0) t = t.substring(0, nl)
                if (t.length > 30) t = t.substring(0, 30) + "..."
                ticker = t
            } else {
                val count = String.format(getString(R.string.unread_messages), unreadNotificationInfo.freshMessagesCount())
                val where = when {
                    singleFresh.chatterID().chatterType == ChatterID.ChatterType.Local ->
                        getString(R.string.messages_in_where, singleFresh.chatterName().or(getString(R.string.local_chat_title)))
                    singleFresh.chatterID().chatterType == ChatterID.ChatterType.Group ->
                        getString(R.string.messages_in_where, singleFresh.chatterName().or(getString(R.string.default_group_chat_title)))
                    singleFresh.chatterName().isPresent ->
                        String.format(getString(R.string.from_chatter), singleFresh.chatterName().orNull())
                    else -> null
                }
                ticker = if (where != null) "$count $where" else count
            }
        } else if (unreadNotificationInfo.objectPopupInfo().freshObjectPopupsCount() != 0) {
            val lastPopup = unreadNotificationInfo.objectPopupInfo().lastObjectPopup().orNull()
            if (unreadNotificationInfo.objectPopupInfo().freshObjectPopupsCount() == 1 && lastPopup != null) {
                var t = "${lastPopup.objectName()}: ${lastPopup.message()}"
                val nl = t.indexOf("\n")
                if (nl >= 0) t = t.substring(0, nl)
                if (t.length > 30) t = t.substring(0, 30) + "..."
                ticker = t
            } else {
                ticker = resources.getQuantityString(R.plurals.new_questions,
                    unreadNotificationInfo.objectPopupInfo().objectPopupsCount(),
                    unreadNotificationInfo.objectPopupInfo().objectPopupsCount())
            }
        }

        builder.setOngoing(false)
        builder.setNumber(unreadNotificationInfo.totalUnreadCount())
        builder.setContentIntent(PlatformCompat.getActivity(this, REQUEST_CODE_UNREAD_NOTIFY, finalIntent, PendingIntent.FLAG_UPDATE_CURRENT))
        builder.setDefaults(0)
        if (ticker != null) builder.setTicker(ticker)
        builder.setOnlyAlertOnce(true)

        if (groupKey == null || !isGroupSummary) {
            var ledAction = LEDAction.None
            var ledColor = 0
            var notificationType = if (unreadNotificationInfo.totalUnreadCount() > 0)
                unreadNotificationInfo.mostImportantType().orNull() else null
            if (notificationType == null && unreadNotificationInfo.objectPopupInfo().objectPopupsCount() != 0) {
                notificationType = NotificationType.LocalChat
            }
            if (notificationType != null) {
                val settings = notifySettingsByType(notificationType)
                ledAction = settings.ledAction
                ledColor = settings.ledColor
            }
            var freshType = if (unreadNotificationInfo.freshMessagesCount() != 0)
                unreadNotificationInfo.mostImportantFreshType().orNull() else null
            if (freshType == null && unreadNotificationInfo.objectPopupInfo().freshObjectPopupsCount() != 0) {
                freshType = NotificationType.LocalChat
            }
            val freshSettings = if (freshType != null) notifySettingsByType(freshType) else null
            Debug.Printf("GridConnectionService: updateUnreadNotification: ledAction = %s, color = %08x", ledAction.toString(), ledColor)
            if (ledAction != LEDAction.None) {
                when (ledAction) {
                    LEDAction.Always -> builder.setLights(ledColor, 1, 0)
                    LEDAction.Fast -> builder.setLights(ledColor, 300, 100)
                    LEDAction.None -> builder.setLights(ledColor, 0, 0)
                    LEDAction.Slow -> builder.setLights(ledColor, 1000, TransitionView.TRANSITION_ANIMATION_DURATION_MS)
                }
            }
            if (!soundOnNotify || freshSettings == null) {
                Debug.Printf("GridConnectionService: will not emit sound.")
            } else {
                val ringtone = freshSettings.ringtone
                if (ringtone != null) {
                    builder.setSound(Uri.parse(ringtone))
                    builder.setOnlyAlertOnce(false)
                }
            }
        }
        shownNotificationIds.add(id)
        nm.notify(id, builder.build())
    }

    fun startCloudSync(userManager: UserManager) {
        cloudSyncUserManager = userManager
        updateCloudSyncStatus()
    }

    private fun stopCloudSync() {
        cloudSyncUserManager = null
        updateCloudSyncStatus()
    }

    private fun updateCloudSyncStatus() {
        if (!cloudSyncEnabled || cloudSyncUserManager == null) {
            cloudSyncServiceConnection?.stopSyncing()
            cloudSyncServiceConnection = null
            if (cloudPluginReceiverRegistered) {
                try { unregisterReceiver(cloudPluginInstalledReceiver) } catch (e: IllegalArgumentException) { Debug.Warning(e) }
            }
            cloudPluginReceiverRegistered = false
            return
        }
        if (cloudSyncServiceConnection == null) {
            cloudSyncServiceConnection = CloudSyncServiceConnection(this, cloudSyncUserManager!!)
            val intent = Intent()
            intent.component = ComponentName("com.lumiyaviewer.lumiya.cloud", "com.lumiyaviewer.lumiya.cloud.DriveSyncService")
            val bound = try { bindService(intent, cloudSyncServiceConnection!!, BIND_AUTO_CREATE) } catch (e: SecurityException) { Debug.Warning(e); false }
            Debug.Printf("LumiyaCloud: bindService = %b", bound)
            if (bound) return
            cloudSyncServiceConnection!!.stopSyncing()
            val viewIntent = Intent(Intent.ACTION_VIEW)
            viewIntent.data = Uri.parse(LicenseChecker.CLOUD_PLUGIN_URL)
            cloudSyncServiceConnection!!.showSyncingError(getString(R.string.cloud_sync_not_installed), getString(R.string.cloud_sync_not_installed_long), viewIntent)
            cloudSyncServiceConnection = null
            val filter = IntentFilter()
            filter.addAction(Intent.ACTION_PACKAGE_ADDED)
            filter.addDataScheme("package")
            filter.addDataSchemeSpecificPart("com.lumiyaviewer.lumiya.cloud", 0)
            registerReceiver(cloudPluginInstalledReceiver, filter)
            cloudPluginReceiverRegistered = true
        }
    }

    private fun updateOnlineNotification() {
        var needWifi = false
        if (gridConnection != null) {
            val state = gridConnection!!.connectionState
            needWifi = if (state != SLGridConnection.ConnectionState.Idle) GlobalOptions.getInstance().getKeepWifiOn() else false
            val agentUUID = gridConnection!!.activeAgentUUID
            if (agentUUID == null || state == SLGridConnection.ConnectionState.Idle) {
                connectedAgentNameRetriever?.dispose()
                connectedAgentNameRetriever = null
            } else if (connectedAgentNameRetriever == null) {
                connectedAgentNameRetriever = ChatterNameRetriever(
                    ChatterID.getUserChatterID(agentUUID, agentUUID),
                    onActiveAgentNameUpdated, UIThreadExecutor.getSerialInstance()
                )
            }
        }
        if (needWifi && wifiLock == null) {
            val appContext = applicationContext
            if (appContext != null) {
                @Suppress("DEPRECATION")
                wifiLock = (appContext.getSystemService(Context.WIFI_SERVICE) as WifiManager).createWifiLock(1, "Lumiya")
                wifiLock!!.acquire()
                Debug.Printf("WiFi lock acquired")
            }
        } else if (wifiLock != null && !needWifi) {
            wifiLock!!.release()
            wifiLock = null
            Debug.Printf("WiFi lock released")
        }
        val newInfo = OnlineNotificationInfo(onlineNotify, this, gridName, gridConnection, connectedAgentNameRetriever, currentLocationInfo.data)
        if (!startingNotificationVisible && newInfo == onlineNotificationInfo) return
        startingNotificationVisible = false
        onlineNotificationInfo = newInfo
        val notification = newInfo.getNotification(this)
        if (notification != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                startForeground(R.id.online_notify_id, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_REMOTE_MESSAGING)
            } else {
                startForeground(R.id.online_notify_id, notification)
            }
        } else {
            stopForeground(true)
        }
    }

    fun acceptVoiceCall(chatterID: ChatterID) {
        // WebRTC voice calls are accepted by connecting to the channel directly
    }

    fun enableVoiceMic(enabled: Boolean) {
        webRTCVoiceClient?.enableMic(enabled)
    }

    fun getWebRTCVoiceClient(): WebRTCVoiceClient? = webRTCVoiceClient

    @EventHandler
    fun handleConnectEvent(loginResultEvent: SLLoginResultEvent) {
        val userManager = UserManager.getUserManager(loginResultEvent.activeAgentUUID)
        if (userManager != null) {
            unreadNotifySubscription = userManager.unreadNotificationManager.unreadNotifications.subscribe(
                UnreadNotificationManager.unreadNotificationKey, UIThreadExecutor.getSerialInstance(),
                Subscription.OnData<UnreadNotifications> { data -> onUnreadNotification(data) }
            )
            currentLocationInfo.subscribe(userManager.currentLocationInfo, SubscriptionSingleKey.Value)
        }
        updateOnlineNotification()
        if (loginResultEvent.success) {
            startCloudSync(userManager!!)
        } else {
            Debug.Log("GridConnectionService: stopping self because of connect failed.")
            stopCloudSync()
            stopSelf()
        }
    }

    @EventHandler
    fun handleConnectionStateChangedEvent(event: SLConnectionStateChangedEvent) {
        updateOnlineNotification()
    }

    @EventHandler
    fun handleDisconnectEvent(event: SLDisconnectEvent) {
        updateOnlineNotification()
        Debug.Log("GridConnectionService: stopping self because of disconnect.")
        stopCloudSync()
        stopVoice()
        stopSelf()
        currentLocationInfo.unsubscribe()
    }

    override fun onBind(intent: Intent): IBinder = mBinder

    fun updateBackgroundState() {
        val inBackground = !screenOn || visibleActivities.isEmpty()
        if (this.isBackgroundState != inBackground) {
            this.isBackgroundState = inBackground
            Debug.Printf("GridConnectionService: background state updated to %b (screenOn=%b, visibleActivities=%d)",
                inBackground, screenOn, visibleActivities.size)

            if (inBackground) {
                releaseWakeLocks()
                gridConnection?.setBackgroundState(true)
            } else {
                gridConnection?.setBackgroundState(false)
                updateOnlineNotification()
            }
        }
    }

    private fun releaseWakeLocks() {
        wifiLock?.let {
            if (it.isHeld) {
                it.release()
                Debug.Log("GridConnectionService: Released WifiLock for background idle")
            }
        }
        wifiLock = null

        partialWakeLock?.let {
            if (it.isHeld) {
                it.release()
                Debug.Log("GridConnectionService: Released PartialWakeLock for background idle")
            }
        }
        partialWakeLock = null
    }

    fun acquirePartialWakeLock(timeoutMs: Long = 5000L) {
        if (!isBackgroundState) {
            if (partialWakeLock == null) {
                val pm = getSystemService(Context.POWER_SERVICE) as PowerManager
                partialWakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "Lumiya:PartialWakeLock")
                partialWakeLock?.setReferenceCounted(false)
            }
            if (partialWakeLock != null && !partialWakeLock!!.isHeld) {
                partialWakeLock!!.acquire(timeoutMs)
            }
        }
    }

    override fun onCreate() {
        super.onCreate()
        serviceInstance = WeakReference(this)
        prefs = PreferenceManager.getDefaultSharedPreferences(baseContext)
        prefs!!.registerOnSharedPreferenceChangeListener(this)
        readPreferences(prefs!!)
        val filter = IntentFilter().apply {
            addAction(Intent.ACTION_SCREEN_OFF)
            addAction(Intent.ACTION_SCREEN_ON)
        }
        registerReceiver(screenReceiver, filter)
        registerNetworkCallback()
        updateOnlineNotification()
    }

    override fun onDestroy() {
        try {
            unregisterReceiver(screenReceiver)
        } catch (e: Exception) {
            Debug.Warning(e)
        }
        releaseWakeLocks()
        unregisterNetworkCallback()
        prefs?.unregisterOnSharedPreferenceChangeListener(this)
        prefs = null
        onlineNotificationInfo = OnlineNotificationInfo(onlineNotify, this, gridName, gridConnection, connectedAgentNameRetriever, null)
        stopForeground(true)
        shownNotificationIds.clear()
        eventBus.unsubscribe(this)
        serviceInstance = null
        super.onDestroy()
    }

    @EventHandler
    fun onGlobalPreferencesChanged(event: GlobalOptions.GlobalOptionsChangedEvent) {
        readPreferences(event.preferences)
    }

    override fun onSharedPreferenceChanged(sharedPreferences: SharedPreferences, key: String?) {
        readPreferences(sharedPreferences)
        updateOnlineNotification()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val startingNotification = OnlineNotificationInfo.getStartingNotification(this, gridName)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(R.id.online_notify_id, startingNotification, ServiceInfo.FOREGROUND_SERVICE_TYPE_REMOTE_MESSAGING)
        } else {
            startForeground(R.id.online_notify_id, startingNotification)
        }
        startingNotificationVisible = true
        Debug.Printf("onStartCommand: intent is %s, flags %08x",
            if (intent != null) "not null" else "null", flags)
        val effectiveIntent = if (flags and START_FLAG_REDELIVERY != 0) null else intent
        handleStartService(effectiveIntent)
        return START_FLAG_RETRY
    }

    override fun onUnbind(intent: Intent): Boolean {
        Debug.Log("GridConnectionService: onUnbind called, connection state = ${gridConnection!!.connectionState}")
        if (gridConnection!!.connectionState == SLGridConnection.ConnectionState.Idle) {
            Debug.Log("GridConnectionService: Stopping self because unbind and no clients are bound")
            stopCloudSync()
            stopSelf()
        }
        return super.onUnbind(intent)
    }

    fun startVoice(voiceLoginInfo: VoiceLoginInfo, userManager: UserManager) {
        connectToWebRTC(voiceLoginInfo, userManager)
    }

    fun stopVoice() {
        webRTCVoiceClient?.let {
            it.logout()
            it.dispose()
        }
        webRTCVoiceClient = null
    }

    fun terminateVoiceCall(chatterID: ChatterID) {
        webRTCVoiceClient?.terminateCall(chatterID)
    }

    companion object {
        const val LOGIN_ACTION = "com.lumiyaviewer.lumiya.ACTION_LOGIN"
        private val REQUEST_CODE_UNREAD_NOTIFY = R.id.unread_notify_request_code

        private var serviceInstance: WeakReference<GridConnectionService>? = null
        private var onlineNotify = false
        private var soundOnNotify = true
        private var notifyLocalChat = NotificationSettings(NotificationType.LocalChat)
        private var notifyPrivate = NotificationSettings(NotificationType.Private)
        private var notifyGroup = NotificationSettings(NotificationType.Group)
        private var gridName = "Second Life"
        private var gridConnection: SLGridConnection? = null
        private val visibleActivities: MutableSet<Activity> = Collections.synchronizedSet(HashSet())

        @JvmStatic
        fun startServiceCompat(context: Context, intent: Intent) {
            ContextCompat.startForegroundService(context, intent)
        }

        @JvmStatic
        fun getGridConnection(): SLGridConnection {
            if (gridConnection == null) {
                gridConnection = SLGridConnection()
            }
            return gridConnection!!
        }

        @JvmStatic
        fun getServiceInstance(): GridConnectionService? = serviceInstance?.get()

        @JvmStatic
        fun hasVisibleActivities(): Boolean = visibleActivities.isNotEmpty()

        @JvmStatic
        fun setActivityVisible(activity: Activity, visible: Boolean) {
            if (visible) visibleActivities.add(activity) else visibleActivities.remove(activity)
            getServiceInstance()?.updateBackgroundState()
            if (visibleActivities.isEmpty() || gridConnection == null) return
            try {
                if (gridConnection!!.connectionState == SLGridConnection.ConnectionState.Connected) {
                    gridConnection!!.agentCircuit.UnpauseAgent()
                }
            } catch (e: SLGridConnection.NotConnectedException) {
                e.printStackTrace()
            }
        }

        private fun notifySettingsByType(type: NotificationType): NotificationSettings {
            return when (type) {
                NotificationType.Group -> notifyGroup
                NotificationType.Private -> notifyPrivate
                else -> notifyLocalChat
            }
        }
    }
}
