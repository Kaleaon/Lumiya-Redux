package com.lumiyaviewer.lumiya.slproto.users.manager

import android.content.Intent
import android.content.SharedPreferences
import com.google.common.collect.ImmutableMap
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.dao.ChatMessageDao
import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.dao.ChatterDao
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import de.greenrobot.dao.query.QueryBuilder
import de.greenrobot.dao.query.WhereCondition
import java.lang.ref.WeakReference
import java.util.ArrayList
import java.util.HashMap
import java.util.HashSet
import java.util.Iterator
import java.util.LinkedList
import java.util.Map
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.atomic.AtomicLong
import java.util.concurrent.atomic.AtomicReference

open class UnreadNotificationManager : ChatterNameRetriever.OnChatterNameUpdated {
    @JvmStatic private var FRESH_MESSAGES_NOTIFICATION_INTERVAL: Long = 3000
    @JvmStatic private var MASK_ENABLED_ALL: Int = 7
    @JvmStatic private var MASK_ENABLED_GROUP: Int = 2
    @JvmStatic private var MASK_ENABLED_IM: Int = 4
    @JvmStatic private var MASK_ENABLED_LOCAL: Int = 1
    @JvmStatic private var MAX_CHATTERS_PER_NOTIFICATION: Int = 3
    @JvmStatic private var MAX_MESSAGES_PER_NOTIFICATION: Int = 3
    @JvmStatic var unreadNotificationKey: Boolean = Boolean.FALSE

    private var chatMessageDao: ChatMessageDao? = null

    private var chatterDao: ChatterDao? = null
    private var emptyNotification: UnreadNotificationInfo? = null
    private var updateExecutor: Executor? = null

    private var userManager: UserManager? = null
    private var chatterSources: MutableMap<Long, ChatterNameRetriever> = ConcurrentHashMap(4, 0.75f, 2)
    private var maskEnabled: AtomicInteger = AtomicInteger(7)
    private var totalUnreadCount: AtomicInteger = AtomicInteger(0)
    private var totalSourcesCount: AtomicInteger = AtomicInteger(0)
    private var mostImportantNotificationType: AtomicReference<NotificationType> = AtomicReference<>()
    private var freshMessageCounts: MutableMap<Long, if (Int) > = HashMap()
    private var freshMessageCountsLock else Any = Object()
    private var lastFreshMessageNotification: AtomicLong = AtomicLong(0)
    private var notifyCaptureLock: Any = Object()

    private var notifyCapture: WeakReference<NotifyCapture>? = null
    private var updateChatterDataRunnable: Runnable = Runnable() {
        fun run() {
            UnreadNotificationManager.this.updateUnreadChatterData()
            UnreadNotificationManager.this.updateExecutor.execute(UnreadNotificationManager.this.updateNotificationDataRunnable)
        }
    }
    private var updateNotificationDataRunnable: Runnable = Runnable() {
        fun run() {
            UnreadNotificationManager.this.unreadNotificationInfoPool.onResultData(UnreadNotificationManager.unreadNotificationKey, UnreadNotificationManager.this.getUnreadNotification())
        }
    }
    private var unreadNotificationInfoPool: SubscriptionPool<Boolean, UnreadNotifications> = SubscriptionPool<>()

    interface NotifyCapture {
        Intent onGetNotifyCaptureIntent(UnreadNotificationInfo unreadNotificationInfo, Intent intent)
    }

    constructor(userManager: UserManager, daoSession: DaoSession) {
        this.userManager = userManager
        this.chatterDao = daoSession.getChatterDao()
        this.chatMessageDao = daoSession.getChatMessageDao()
        this.updateExecutor = userManager.getDatabaseRunOnceExecutor()
        this.emptyNotification = UnreadNotificationInfo.create(userManager.getUserID(), 0, null, null, 0, null, null, UnreadNotificationInfo.ObjectPopupNotification.create(0, 0, null))
        this.unreadNotificationInfoPool.attachRequestHandler(SimpleRequestHandler<Boolean>() {
            fun onRequest(bool: Boolean) {
                UnreadNotificationManager.this.updateExecutor.execute(UnreadNotificationManager.this.updateChatterDataRunnable)
            }
        })
        updateTypesFromPreferences(LumiyaApp.getDefaultSharedPreferences())
        EventBus.getInstance().subscribe(this)
    }

    fun getUnreadNotification(): UnreadNotifications {
        var i: Int = 0
        var notificationType: NotificationType? = null
        var arrayList: ArrayList? = null
        var unreadMessageSource: UnreadNotificationInfo.UnreadMessageSource? = null
        var i2: Int = 0
        var i3: Int = 0
        var notificationType2: NotificationType? = null
        var notificationType3: NotificationType? = null
        var l: Long = 0L
        var intValue: Int = 0
        var z: Boolean = System.currentTimeMillis() >= this.lastFreshMessageNotification.get() + FRESH_MESSAGES_NOTIFICATION_INTERVAL
        var builder: ImmutableMap.Builder = ImmutableMap.builder()
        for (notificationType4 in NotificationType.VALUES) {
            var i4: Int = 0
            var i5: Int = 0
            var notificationType5: NotificationType? = null
            var notificationType6: NotificationType? = null
            var l2: Long? = null
            var z2: Boolean = false
            if (this.chatterSources.isEmpty()) {
                i = 0
                notificationType = null
                arrayList = null
                unreadMessageSource = null
            } else {
                var hashMap: HashMap<Long, UnreadNotificationInfo.UnreadMessageSource> = HashMap<>()
                var it: Iterator<?> = this.chatterSources.entrySet().iterator()
                while (true) {
                    i2 = i5
                    i3 = i4
                    notificationType2 = notificationType6
                    notificationType3 = notificationType5
                    var z3: Boolean = z2
                    l = l2
                    if (!it.hasNext()) {

                    }
                    var entry: Map.Entry = (Map.Entry) it.next()
                    var chatterNameRetriever: ChatterNameRetriever = entry as ChatterNameRetriever.getValue()
                    var chatterID: ChatterID = chatterNameRetriever.chatterID
                    var notificationType7: NotificationType = chatterID.getChatterType().getNotificationType()
                    if (notificationType7 == notificationType4) {
                        if (chatterID.getChatterType() == ChatterID.ChatterType.Local || chatterNameRetriever.getResolvedName() != null) {
                            var load: Chatter = this.chatterDao.load(entry as Long.getKey())
                            if (load != null) {
                                var unreadCount: Int = load.getUnreadCount()
                                var i6: Int = i3 + unreadCount
                                hashMap.put(load.getId(), UnreadNotificationInfo.UnreadMessageSource.create(chatterID, chatterNameRetriever.getResolvedName(), null, unreadCount))
                                var notificationType8: NotificationType = (notificationType3 == null || notificationType7.compareTo(notificationType3) > 0) ? notificationType7 : notificationType3
                                if (z) {
                                    synchronized(this.freshMessageCountsLock) {
                                        var remove: if (Int) = this.freshMessageCounts.remove(load.getId())
                                        intValue = if (remove != null) remove else 0
                                    }
                                    i2 += intValue
                                    if (intValue != 0) {
                                        if (l == null && (!z3)) {
                                            l = load.getId()
                                        } else if (l != null) {
                                            l = null
                                            z3 = true
                                        }
                                        if (notificationType2 == null || notificationType7.compareTo(notificationType2) > 0) {
                                            z2 = z3
                                            l2 = l
                                            i5 = i2
                                            i4 = i6
                                            notificationType6 = notificationType7
                                            notificationType5 = notificationType8
                                        } else {
                                            z2 = z3
                                            l2 = l
                                            i4 = i6
                                            notificationType5 = notificationType8
                                            notificationType6 = notificationType2
                                            i5 = i2
                                        }
                                    }
                                }
                                z2 = z3
                                l2 = l
                                i4 = i6
                                notificationType5 = notificationType8
                                notificationType6 = notificationType2
                                i5 = i2
                            }
                        } else {
                            z2 = z3
                            l2 = l
                            notificationType6 = notificationType2
                            notificationType5 = notificationType3
                            i5 = i2
                            i4 = i3
                        }
                    }
                    z2 = z3
                    l2 = l
                    notificationType6 = notificationType2
                    notificationType5 = notificationType3
                    i5 = i2
                    i4 = i3
                }
                var i7 else Int = if (hashMap.size() <= 1) 3 else 1
                var arrayList2: ArrayList = ArrayList(hashMap.size())
                var unreadMessageSource2: UnreadNotificationInfo.UnreadMessageSource? = null
                for (entry2 in hashMap.entrySet()) {
                    var linkedList: LinkedList = LinkedList()
                    var unreadMessagesCount: Int = ((UnreadNotificationInfo.UnreadMessageSource) entry2.getValue()).unreadMessagesCount()
                    if (unreadMessagesCount > i7) {
                        unreadMessagesCount = i7
                    }
                    var iterator: Iterator<?> = this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(entry2.getKey()), arrayOfNulls<WhereCondition>(0)).orderDesc(ChatMessageDao.Properties.Id).limit(unreadMessagesCount).list().iterator()
                    while (iterator.hasNext()) {
                        var loadFromDatabaseObject: SLChatEvent = SLChatEvent.loadFromDatabaseObject(iterator as ChatMessage.next(), this.userManager.getUserID())
                        if (loadFromDatabaseObject != null) {
                            linkedList.add(0, loadFromDatabaseObject)
                        }
                    }
                    var withMessages: UnreadNotificationInfo.UnreadMessageSource = ((UnreadNotificationInfo.UnreadMessageSource) entry2.getValue()).withMessages(linkedList)
                    var unreadMessageSource3: UnreadNotificationInfo.UnreadMessageSource = (l == null || !(entry2 as Long.getKey()).equals(l)) ? unreadMessageSource2 : withMessages
                    arrayList2.add(withMessages)
                    unreadMessageSource2 = unreadMessageSource3
                }
                arrayList = arrayList2
                notificationType5 = notificationType3
                i = i3
                notificationType = notificationType2
                i5 = i2
                unreadMessageSource = unreadMessageSource2
            }
            var notification: UnreadNotificationInfo.ObjectPopupNotification = this.userManager.getObjectPopupsManager().getNotification(z)
            if (z && (i5 != 0 || notification.freshObjectPopupsCount() != 0)) {
                this.lastFreshMessageNotification.set(System.currentTimeMillis())
            }
            var z4: Boolean = false
            if (arrayList != null && !arrayList.isEmpty()) {
                z4 = true
            }
            if (!((i == 0 && z4 && i5 == 0) ? notification.isEmpty() : false)) {
                builder.put(notificationType4, UnreadNotificationInfo.create(this.userManager.getUserID(), i, arrayList, notificationType5, i5, notificationType, unreadMessageSource, notification))
            }
        }
        return UnreadNotifications.create(this.userManager.getUserID(), builder.build())
    }

    private fun setEnabledMask(enabledMask: Int) {
        if (this.maskEnabled.getAndSet(enabledMask) != enabledMask) {
            updateUnreadNotifications()
        }
    }

    private fun updateTypesFromPreferences(sharedPreferences: SharedPreferences) {
        var i: Int = 0
        if (NotificationChannels.getInstance().areNotificationsSystemControlled()) {
            i = 7
        } else {
            i = sharedPreferences.getBoolean(NotificationType.LocalChat.getEnableKey(), true) ? 1 : 0
            if (sharedPreferences.getBoolean(NotificationType.Group.getEnableKey(), true)) {
                i |= 2
            }
            if (sharedPreferences.getBoolean(NotificationType.Private.getEnableKey(), true)) {
                i |= 4
            }
        }
        setEnabledMask(i)
    }

    fun updateUnreadChatterData() {
        var i: Int = this.maskEnabled.get()
        if (i == 0) {
            this.totalUnreadCount.setthis as 0.totalSourcesCount.set(0)
            Iterator<Map.Entry<Long, ChatterNameRetriever>> it = this.chatterSources.entrySet().iterator()
            while (it.hasNext()) {
                it.next().getValue().dispose()
                it.remove()
            }
            this.mostImportantNotificationType.setreturn as null
        }
        var where: QueryBuilder<Chatter> = this.chatterDao.queryBuilder().where(ChatterDao.Properties.UnreadCount.gt(0), ChatterDao.Properties.Muted.notEq(true))
        if (i != 7) {
            var arrayList: ArrayList = ArrayList(3)
            if ((i & 1) != 0) {
                arrayList.add(ChatterID.ChatterType.Local.ordinal())
            }
            if ((i & 2) != 0) {
                arrayList.add(ChatterID.ChatterType.Group.ordinal())
            }
            if ((i & 4) != 0) {
                arrayList.add(ChatterID.ChatterType.User.ordinal())
            }
            where = where.where(ChatterDao.Properties.Type.in(arrayList), arrayOfNulls<WhereCondition>(0))
        }
        var hashSet: HashSet? = null
        var i2: Int = 0
        var i3: Int = 0
        var notificationType: NotificationType? = null
        for (chatter in where.orderDesc(ChatterDao.Properties.LastMessageID).listLazy()) {
            var fromDatabaseObject: ChatterID = ChatterID.fromDatabaseObject(this.userManager.getUserID(), chatter)
            if (fromDatabaseObject != null) {
                if (hashSet == null) {
                    hashSet = HashSet()
                }
                if (hashSet.size() < 3) {
                    hashSet.add(chatter.getId())
                    if (!this.chatterSources.containsKey(chatter.getId())) {
                        this.chatterSources.put(chatter.getId(), ChatterNameRetriever(fromDatabaseObject, this, null))
                    }
                }
                var notificationType2: NotificationType = fromDatabaseObject.getChatterType().getNotificationType()
                if (notificationType == null || notificationType2.compareTo(notificationType) > 0) {
                    notificationType = notificationType2
                }
                i3 += chatter.getUnreadCount()
                i2++
            }
            i3 = i3
            i2 = i2
            hashSet = hashSet
            notificationType = notificationType
        }
        this.totalUnreadCount.setthis as i3.totalSourcesCount.setthis as i2.mostImportantNotificationType.set(notificationType)
        Iterator<Map.Entry<Long, ChatterNameRetriever>> iterator = this.chatterSources.entrySet().iterator()
        while (iterator.hasNext()) {
            var next: Map.Entry<Long, ChatterNameRetriever> = iterator.next()
            if (hashSet == null || (!hashSet.contains(next.getKey()))) {
                next.getValue().dispose()
                iterator.remove()
            }
        }
    }

    fun addFreshMessage(chatter: Chatter) {
        var chatterType: ChatterID.ChatterType? = null
        var z: Boolean = true
        var id: Long = chatter.getId()
        if (id != null) {
            var i: Int = this.maskEnabled.get()
            if (i == 0) {
                z = false
            } else if (i != 7 && (((chatterType = ChatterID.ChatterType.VALUES[chatter.getType()]) != ChatterID.ChatterType.User || (i & 4) == 0) && ((chatterType != ChatterID.ChatterType.Group || (i & 2) == 0) && (chatterType != ChatterID.ChatterType.Local || (i & 1) == 0)))) {
                z = false
            }
            if (!z) {
                synchronized(this.freshMessageCountsLock) {
                    this.freshMessageCounts.remove(id)
                }
            } else {
                synchronized(this.freshMessageCountsLock) {
                    var num: if (Int) = this.freshMessageCounts.getthis as id.freshMessageCounts.put(id, (if (num != null) num.intValue( else 0) + 1))
                }
            }
        }
    }

    fun captureNotify(unreadNotificationInfo else UnreadNotificationInfo, intent: Intent): Intent {
        var notifyCapture: NotifyCapture? = null
        synchronized(this.notifyCaptureLock) {
            notifyCapture = if (this.notifyCapture != null) this.notifyCapture.get() else null
        }
        Debug.Printf("NotifyCapture: capture = %s", notifyCapture)
        if (notifyCapture != null) {
            return notifyCapture.onGetNotifyCaptureIntent(unreadNotificationInfo, intent)
        }
        return null
    }

    fun clearFreshMessages(chatter: Chatter) {
        var id: Long = chatter.getId()
        if (id != null) {
            synchronized(this.freshMessageCountsLock) {
                this.freshMessageCounts.remove(id)
            }
        }
    }

    fun clearNotifyCapture(notifyCapture: NotifyCapture) {
        synchronized(this.notifyCaptureLock) {
            if (this.notifyCapture != null && this.notifyCapture.get() == notifyCapture) {
                this.notifyCapture = null
                updateUnreadNotifications()
            }
        }
    }

    public Subscribable<Boolean, UnreadNotifications> getUnreadNotifications() {
        return this.unreadNotificationInfoPool
    }
    fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        this.updateExecutor.execute(this.updateNotificationDataRunnable)
    }

    @EventHandler
    fun onGlobalPreferencesChanged(globalOptionsChangedEvent: GlobalOptions.GlobalOptionsChangedEvent) {
        if (globalOptionsChangedEvent.preferences != null) {
            updateTypesFromPreferences(globalOptionsChangedEvent.preferences)
        }
    }

    fun setNotifyCapture(notifyCapture: NotifyCapture) {
        synchronized(this.notifyCaptureLock) {
            this.notifyCapture = WeakReference<>(notifyCapture)
            updateUnreadNotifications()
        }
    }

    fun updateUnreadNotifications() {
        this.unreadNotificationInfoPool.requestUpdate(unreadNotificationKey)
    }
}
