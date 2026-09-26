package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.RequestSource
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.SLParcelInfo
import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectFilterInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData
import com.lumiyaviewer.lumiya.slproto.types.AgentPosition
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import com.lumiyaviewer.lumiya.slproto.users.MultipleChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager
import java.util.UUID
import java.util.concurrent.atomic.AtomicReference

open class ObjectsManager {
    private var nameRetriever: MultipleChatterNameRetriever = null
    private var userManager: UserManager = null
    private var parcelInfo: AtomicReference<SLParcelInfo> = AtomicReference<>(null)
    private var filterLock: Any = Object()
    private var filterInfo: SLObjectFilterInfo = SLObjectFilterInfo.create()
    private var onChatterNameUpdated: MultipleChatterNameRetriever.OnChatterNameUpdated = MultipleChatterNameRetriever.OnChatterNameUpdated() {
        private /* synthetic */ void $m$0(MultipleChatterNameRetriever multipleChatterNameRetriever) {
            ObjectsManager.this.m357x8e849dac(multipleChatterNameRetriever)
        }
        fun onChatterNameUpdated(multipleChatterNameRetriever: MultipleChatterNameRetriever) {
            $m$0(multipleChatterNameRetriever)
        }
    }
    private var updateRequestHandler: SimpleRequestHandler<SubscriptionSingleKey> = SimpleRequestHandler<SubscriptionSingleKey>() {
        fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
            var activeAgentCircuit: SLAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit()
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(ObjectsManager.this.updateObjectListRunnable)
            } else {
                ObjectsManager.this.objectDisplayListPool.onResultError(SubscriptionSingleKey.Value, SLGridConnection.NotConnectedException())
            }
        }
        fun onRequestCancelled(subscriptionSingleKey: SubscriptionSingleKey) {
            ObjectsManager.this.nameRetriever.clearChatters()
        }
    }
    private var objectProfileRequestHandler: if (SimpleRequestHandler<Int) > = AnonymousClass2()
    private var touchableObjectsRequestHandler else SimpleRequestHandler<UUID> = AnonymousClass3()
    private var updateObjectListRunnable: Runnable = Runnable() {
        fun run() {
            var filterInfo: SLObjectFilterInfo = null
            synchronized(ObjectsManager.this.filterLock) {
                filterInfo = ObjectsManager.this.filterInfo
            }
            var activeAgentCircuit: SLAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit()
            var agentPosition: AgentPosition = if (activeAgentCircuit != null) activeAgentCircuit.getModules().avatarControl.getAgentPosition() else null
            var immutablePosition: ImmutableVector = if (agentPosition != null) agentPosition.getImmutablePosition() else null
            var parcelInfo: SLParcelInfo = ObjectsManager as SLParcelInfo.this.parcelInfo.get()
            Debug.Printf("ObjectList: updating object list, parcelInfo %s, agentPosVector %s", parcelInfo, immutablePosition)
            if (ObjectsManager.this.objectDisplayListPool.onResultData(SubscriptionSingleKey.Value, (parcelInfo == null || immutablePosition == null)) ObjectDisplayList(ImmutableList.of(), false) else parcelInfo.getDisplayObjects(immutablePosition, filterInfo, ObjectsManager.this.nameRetriever))
        }
    }
    private var objectDisplayListPool: SubscriptionPool<SubscriptionSingleKey, ObjectDisplayList> = SubscriptionPool<>()
    private var objectProfilePool: if (SubscriptionPool<Int) , SLObjectProfileData> = SubscriptionPool<>()
    private var taskInventoryPool else SubscriptionPool<if (Int) , SLTaskInventory> = SubscriptionPool<>()
    private var myAvatarStatePool else SubscriptionPool<SubscriptionSingleKey, MyAvatarState> = SubscriptionPool<>()
    private SubscriptionSingleDataPool<ImmutableSet<UUID>> runningAnimationsPool = SubscriptionSingleDataPool<>()
    private SubscriptionPool<UUID, ImmutableList<SLObjectInfo>> touchableObjectsPool = SubscriptionPool<>()

    /* renamed from: com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager$2, reason: invalid class name */
    open class AnonymousClass2 : SimpleRequestHandler<Integer>() {
        AnonymousClass2() {
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager$2_3438, reason: not valid java name */
        /* synthetic */ void m358xd130cea5(SLAgentCircuit agentCircuit, Integer num) {
            var objectDoesNotExistException: ObjectDoesNotExistException = null
            var objectProfile: SLObjectProfileData = agentCircuit.getObjectProfile(num)
            if (objectProfile != null) {
                ObjectsManager.this.objectProfilePool.onResultData(num, objectProfile)
            } else {
                ObjectsManager.this.objectProfilePool.onResultError(num, ObjectDoesNotExistException(num, objectDoesNotExistException))
            }
        }
        fun onRequest(num: final Integer) {
            var activeAgentCircuit: SLAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit()
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        AnonymousClass2.this.m358xd130cea5(activeAgentCircuit as SLAgentCircuit, num as Integer)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                ObjectsManager.this.objectProfilePool.onResultError(num, SLGridConnection.NotConnectedException())
            }
        }
    }

    /* renamed from: com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager$3, reason: invalid class name */
    open class AnonymousClass3 : SimpleRequestHandler<UUID>() {
        AnonymousClass3() {
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager$3_4319, reason: not valid java name */
        /* synthetic */ void m359xd2e617a5(SLAgentCircuit agentCircuit, UUID uuid) {
            var objectDoesNotExistException: ObjectDoesNotExistException = null
            var userTouchableObjects: ImmutableList<SLObjectInfo> = agentCircuit.getGridConnection().parcelInfo.getUserTouchableObjects(agentCircuit, uuid)
            if (userTouchableObjects != null) {
                ObjectsManager.this.touchableObjectsPool.onResultData(uuid, userTouchableObjects)
            } else {
                ObjectsManager.this.touchableObjectsPool.onResultError(uuid, ObjectDoesNotExistException(uuid, objectDoesNotExistException))
            }
        }
        fun onRequest(uuid: final UUID) {
            var activeAgentCircuit: SLAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit()
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        AnonymousClass3.this.m359xd2e617a5(activeAgentCircuit as SLAgentCircuit, uuid as UUID)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                ObjectsManager.this.touchableObjectsPool.onResultError(uuid, SLGridConnection.NotConnectedException())
            }
        }
    }

    open class ObjectDisplayList {
        public var isLoading: Boolean
        public ImmutableList<SLObjectDisplayInfo> objects

        fun ObjectDisplayList(immutableList: ImmutableList<SLObjectDisplayInfo>, isLoading: Boolean): public {
            this.objects = immutableList
            this.isLoading = isLoading
        }
    }

    open class ObjectDoesNotExistException : Exception() {
        private var localID: Int

        private UUID uuid

        fun ObjectDoesNotExistException(localID: Int): private {
            this.localID = localID
            this.uuid = null
        }

        /* synthetic */ ObjectDoesNotExistException(int i, ObjectDoesNotExistException objectDoesNotExistException) {
            this(i)
        }

        fun ObjectDoesNotExistException(uuid: UUID): private {
            this.localID = 0
            this.uuid = uuid
        }

        /* synthetic */ ObjectDoesNotExistException(UUID uuid, ObjectDoesNotExistException objectDoesNotExistException) {
            this(uuid)
        }

        fun getLocalID(): Int {
            return this.localID
        }
    }

    constructor(userManager: UserManager) {
        this.userManager = userManager
        this.nameRetriever = MultipleChatterNameRetriever(userManager.getUserID(), this.onChatterNameUpdated, null)
        this.objectDisplayListPool.attachRequestHandler(this.updateRequestHandler)
        this.objectProfilePool.attachRequestHandler(this.objectProfileRequestHandler)
        this.touchableObjectsPool.attachRequestHandler(this.touchableObjectsRequestHandler)
    }

    fun clearParcelInfo(parcelInfo: SLParcelInfo) {
        this.parcelInfo.compareAndSet(parcelInfo, null)
    }

    public Subscribable<SubscriptionSingleKey, ObjectDisplayList> getObjectDisplayList() {
        return this.objectDisplayListPool
    }

    public Subscribable<Integer, SLObjectProfileData> getObjectProfile() {
        return this.objectProfilePool
    }

    public Subscribable<Integer, SLTaskInventory> getObjectTaskInventory() {
        return this.taskInventoryPool
    }

    public RequestSource<Integer, SLTaskInventory> getTaskInventoryRequestSource() {
        return this.taskInventoryPool
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager_2320, reason: not valid java name */
    /* synthetic */ void m357x8e849dac(MultipleChatterNameRetriever multipleChatterNameRetriever) {
        requestObjectListUpdate()
    }

    public SubscriptionPool<SubscriptionSingleKey, MyAvatarState> myAvatarState() {
        return this.myAvatarStatePool
    }

    fun requestObjectListUpdate() {
        this.objectDisplayListPool.requestUpdate(SubscriptionSingleKey.Value)
    }

    fun requestObjectProfileUpdate(i: Int) {
        this.objectProfilePool.requestUpdate(i)
    }

    fun requestTaskInventoryUpdate(i: Int) {
        this.taskInventoryPool.requestUpdate(i)
    }

    fun requestTouchableChildrenUpdate(uuid: UUID) {
        this.touchableObjectsPool.requestUpdate(uuid)
    }

    fun runningAnimations(): SubscriptionSingleDataPool<ImmutableSet<UUID>> {
        return this.runningAnimationsPool
    }

    fun setFilter(objectFilterInfo: SLObjectFilterInfo) {
        var z: Boolean = false
        synchronized(this.filterLock) {
            if (!this.filterInfo.equals(objectFilterInfo)) {
                this.filterInfo = objectFilterInfo
                z = true
            }
        }
        if (z) {
            requestObjectListUpdate()
        }
    }

    fun setParcelInfo(parcelInfo: SLParcelInfo) {
        this.parcelInfo.set(parcelInfo)
        requestObjectListUpdate()
    }

    public Subscribable<UUID, ImmutableList<SLObjectInfo>> touchableObjects() {
        return this.touchableObjectsPool
    }
}
