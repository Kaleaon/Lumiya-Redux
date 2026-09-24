package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.react.RequestSource;
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler;
import com.lumiyaviewer.lumiya.react.Subscribable;
import com.lumiyaviewer.lumiya.react.SubscriptionPool;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLGridConnection;
import com.lumiyaviewer.lumiya.slproto.SLParcelInfo;
import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectFilterInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData;
import com.lumiyaviewer.lumiya.slproto.types.AgentPosition;
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector;
import com.lumiyaviewer.lumiya.slproto.users.MultipleChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class ObjectsManager {
    private final MultipleChatterNameRetriever nameRetriever;
    private final UserManager userManager;
    private final AtomicReference<SLParcelInfo> parcelInfo = new AtomicReference<>(null);
    private final Object filterLock = new Object();
    private SLObjectFilterInfo filterInfo = SLObjectFilterInfo.create();
    private final MultipleChatterNameRetriever.OnChatterNameUpdated onChatterNameUpdated = new MultipleChatterNameRetriever.OnChatterNameUpdated() {
        private final /* synthetic */ void $m$0(MultipleChatterNameRetriever multipleChatterNameRetriever) {
            ObjectsManager.this.m357x8e849dac(multipleChatterNameRetriever);
        }

        @Override
        public final void onChatterNameUpdated(MultipleChatterNameRetriever multipleChatterNameRetriever) {
            $m$0(multipleChatterNameRetriever);
        }
    };
    private final SimpleRequestHandler<SubscriptionSingleKey> updateRequestHandler = new SimpleRequestHandler<SubscriptionSingleKey>() {
        @Override
        public void onRequest(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
            SLAgentCircuit activeAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit();
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(ObjectsManager.this.updateObjectListRunnable);
            } else {
                ObjectsManager.this.objectDisplayListPool.onResultError(SubscriptionSingleKey.Value, new SLGridConnection.NotConnectedException());
            }
        }

        @Override
        public void onRequestCancelled(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
            ObjectsManager.this.nameRetriever.clearChatters();
        }
    };
    private final SimpleRequestHandler<Integer> objectProfileRequestHandler = new AnonymousClass2();
    private final SimpleRequestHandler<UUID> touchableObjectsRequestHandler = new AnonymousClass3();
    private final Runnable updateObjectListRunnable = new Runnable() {
        @Override
        public void run() {
            SLObjectFilterInfo filterInfo;
            synchronized (ObjectsManager.this.filterLock) {
                filterInfo = ObjectsManager.this.filterInfo;
            }
            SLAgentCircuit activeAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit();
            AgentPosition agentPosition = activeAgentCircuit != null ? activeAgentCircuit.getModules().avatarControl.getAgentPosition() : null;
            ImmutableVector immutablePosition = agentPosition != null ? agentPosition.getImmutablePosition() : null;
            SLParcelInfo parcelInfo = (SLParcelInfo) ObjectsManager.this.parcelInfo.get();
            Debug.Printf("ObjectList: updating object list, parcelInfo %s, agentPosVector %s", parcelInfo, immutablePosition);
            ObjectsManager.this.objectDisplayListPool.onResultData(SubscriptionSingleKey.Value, (parcelInfo == null || immutablePosition == null) ? new ObjectDisplayList(ImmutableList.of(), false) : parcelInfo.getDisplayObjects(immutablePosition, filterInfo, ObjectsManager.this.nameRetriever));
        }
    };
    private final SubscriptionPool<SubscriptionSingleKey, ObjectDisplayList> objectDisplayListPool = new SubscriptionPool<>();
    private final SubscriptionPool<Integer, SLObjectProfileData> objectProfilePool = new SubscriptionPool<>();
    private final SubscriptionPool<Integer, SLTaskInventory> taskInventoryPool = new SubscriptionPool<>();
    private final SubscriptionPool<SubscriptionSingleKey, MyAvatarState> myAvatarStatePool = new SubscriptionPool<>();
    private final SubscriptionSingleDataPool<ImmutableSet<UUID>> runningAnimationsPool = new SubscriptionSingleDataPool<>();
    private final SubscriptionPool<UUID, ImmutableList<SLObjectInfo>> touchableObjectsPool = new SubscriptionPool<>();

    /* renamed from: com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager$2, reason: invalid class name */
    class AnonymousClass2 extends SimpleRequestHandler<Integer> {
        AnonymousClass2() {
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager$2_3438, reason: not valid java name */
        /* synthetic */ void m358xd130cea5(SLAgentCircuit agentCircuit, Integer num) {
            ObjectDoesNotExistException objectDoesNotExistException = null;
            SLObjectProfileData objectProfile = agentCircuit.getObjectProfile(num.intValue());
            if (objectProfile != null) {
                ObjectsManager.this.objectProfilePool.onResultData(num, objectProfile);
            } else {
                ObjectsManager.this.objectProfilePool.onResultError(num, new ObjectDoesNotExistException(num.intValue(), objectDoesNotExistException));
            }
        }

        @Override
        public void onRequest(@Nonnull final Integer num) {
            final SLAgentCircuit activeAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit();
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        AnonymousClass2.this.m358xd130cea5((SLAgentCircuit) activeAgentCircuit, (Integer) num);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            } else {
                ObjectsManager.this.objectProfilePool.onResultError(num, new SLGridConnection.NotConnectedException());
            }
        }
    }

    /* renamed from: com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager$3, reason: invalid class name */
    class AnonymousClass3 extends SimpleRequestHandler<UUID> {
        AnonymousClass3() {
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager$3_4319, reason: not valid java name */
        /* synthetic */ void m359xd2e617a5(SLAgentCircuit agentCircuit, UUID uuid) {
            ObjectDoesNotExistException objectDoesNotExistException = null;
            ImmutableList<SLObjectInfo> userTouchableObjects = agentCircuit.getGridConnection().parcelInfo.getUserTouchableObjects(agentCircuit, uuid);
            if (userTouchableObjects != null) {
                ObjectsManager.this.touchableObjectsPool.onResultData(uuid, userTouchableObjects);
            } else {
                ObjectsManager.this.touchableObjectsPool.onResultError(uuid, new ObjectDoesNotExistException(uuid, objectDoesNotExistException));
            }
        }

        @Override
        public void onRequest(@Nonnull final UUID uuid) {
            final SLAgentCircuit activeAgentCircuit = ObjectsManager.this.userManager.getActiveAgentCircuit();
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        AnonymousClass3.this.m359xd2e617a5((SLAgentCircuit) activeAgentCircuit, (UUID) uuid);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            } else {
                ObjectsManager.this.touchableObjectsPool.onResultError(uuid, new SLGridConnection.NotConnectedException());
            }
        }
    }

    public static class ObjectDisplayList {
        public final boolean isLoading;
        public final ImmutableList<SLObjectDisplayInfo> objects;

        public ObjectDisplayList(ImmutableList<SLObjectDisplayInfo> immutableList, boolean isLoading) {
            this.objects = immutableList;
            this.isLoading = isLoading;
        }
    }

    public static class ObjectDoesNotExistException extends Exception {
        private final int localID;

        @Nullable
        private final UUID uuid;

        private ObjectDoesNotExistException(int localID) {
            this.localID = localID;
            this.uuid = null;
        }

        /* synthetic */ ObjectDoesNotExistException(int i, ObjectDoesNotExistException objectDoesNotExistException) {
            this(i);
        }

        private ObjectDoesNotExistException(@Nullable UUID uuid) {
            this.localID = 0;
            this.uuid = uuid;
        }

        /* synthetic */ ObjectDoesNotExistException(UUID uuid, ObjectDoesNotExistException objectDoesNotExistException) {
            this(uuid);
        }

        public int getLocalID() {
            return this.localID;
        }
    }

    ObjectsManager(UserManager userManager) {
        this.userManager = userManager;
        this.nameRetriever = new MultipleChatterNameRetriever(userManager.getUserID(), this.onChatterNameUpdated, null);
        this.objectDisplayListPool.attachRequestHandler(this.updateRequestHandler);
        this.objectProfilePool.attachRequestHandler(this.objectProfileRequestHandler);
        this.touchableObjectsPool.attachRequestHandler(this.touchableObjectsRequestHandler);
    }

    public void clearParcelInfo(@Nullable SLParcelInfo parcelInfo) {
        this.parcelInfo.compareAndSet(parcelInfo, null);
    }

    public Subscribable<SubscriptionSingleKey, ObjectDisplayList> getObjectDisplayList() {
        return this.objectDisplayListPool;
    }

    public Subscribable<Integer, SLObjectProfileData> getObjectProfile() {
        return this.objectProfilePool;
    }

    public Subscribable<Integer, SLTaskInventory> getObjectTaskInventory() {
        return this.taskInventoryPool;
    }

    public RequestSource<Integer, SLTaskInventory> getTaskInventoryRequestSource() {
        return this.taskInventoryPool;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager_2320, reason: not valid java name */
    /* synthetic */ void m357x8e849dac(MultipleChatterNameRetriever multipleChatterNameRetriever) {
        requestObjectListUpdate();
    }

    public SubscriptionPool<SubscriptionSingleKey, MyAvatarState> myAvatarState() {
        return this.myAvatarStatePool;
    }

    public void requestObjectListUpdate() {
        this.objectDisplayListPool.requestUpdate(SubscriptionSingleKey.Value);
    }

    public void requestObjectProfileUpdate(int i) {
        this.objectProfilePool.requestUpdate(Integer.valueOf(i));
    }

    public void requestTaskInventoryUpdate(int i) {
        this.taskInventoryPool.requestUpdate(Integer.valueOf(i));
    }

    public void requestTouchableChildrenUpdate(UUID uuid) {
        this.touchableObjectsPool.requestUpdate(uuid);
    }

    public SubscriptionSingleDataPool<ImmutableSet<UUID>> runningAnimations() {
        return this.runningAnimationsPool;
    }

    public void setFilter(SLObjectFilterInfo objectFilterInfo) {
        boolean z = false;
        synchronized (this.filterLock) {
            if (!this.filterInfo.equals(objectFilterInfo)) {
                this.filterInfo = objectFilterInfo;
                z = true;
            }
        }
        if (z) {
            requestObjectListUpdate();
        }
    }

    public void setParcelInfo(@Nullable SLParcelInfo parcelInfo) {
        this.parcelInfo.set(parcelInfo);
        requestObjectListUpdate();
    }

    public Subscribable<UUID, ImmutableList<SLObjectInfo>> touchableObjects() {
        return this.touchableObjectsPool;
    }
}
