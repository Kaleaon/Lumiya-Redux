package com.lumiyaviewer.lumiya.slproto.users;

import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.dao.UserName;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.lang.ref.WeakReference;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;

public class ChatterNameRetriever {
    public final ChatterID chatterID;

    @Nullable
    private final Executor executor;
    private final WeakReference<OnChatterNameUpdated> listener;
    private volatile String resolvedName;
    private volatile String resolvedSecondaryName;
    private Subscription subscription = null;

    public interface OnChatterNameUpdated {
        void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever);
    }

    public ChatterNameRetriever(ChatterID chatterID, OnChatterNameUpdated onChatterNameUpdated, @Nullable Executor executor) {
        this.chatterID = chatterID;
        this.listener = new WeakReference<>(onChatterNameUpdated);
        this.executor = executor;
        subscribe();
    }

    public ChatterNameRetriever(ChatterID chatterID, OnChatterNameUpdated onChatterNameUpdated, @Nullable Executor executor, boolean z) {
        this.chatterID = chatterID;
        this.listener = new WeakReference<>(onChatterNameUpdated);
        this.executor = executor;
        if (z) {
            subscribe();
        }
    }

    public void onCurrentLocation(CurrentLocationInfo currentLocationInfo) {
        ParcelData parcelData = currentLocationInfo.parcelData();
        String name = parcelData != null ? parcelData.getName() : null;
        if (Objects.equal(this.resolvedName, name)) {
            return;
        }
        this.resolvedName = name;
        OnChatterNameUpdated onChatterNameUpdated = this.listener.get();
        if (onChatterNameUpdated != null) {
            onChatterNameUpdated.onChatterNameUpdated(this);
        }
    }

    public void onGroupProfile(GroupProfileReply groupProfileReply) {
        this.resolvedName = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name);
        this.resolvedSecondaryName = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name);
        OnChatterNameUpdated onChatterNameUpdated = this.listener.get();
        if (onChatterNameUpdated != null) {
            onChatterNameUpdated.onChatterNameUpdated(this);
        }
    }

    public void onUserName(UserName userName) {
        Debug.Printf("Resolved name for %s", userName.getUuid());
        if (GlobalOptions.getInstance().isLegacyUserNames()) {
            this.resolvedName = userName.getUserName();
            this.resolvedSecondaryName = userName.getDisplayName();
        } else {
            this.resolvedName = userName.getDisplayName();
            this.resolvedSecondaryName = userName.getUserName();
        }
        OnChatterNameUpdated onChatterNameUpdated = this.listener.get();
        if (onChatterNameUpdated != null) {
            onChatterNameUpdated.onChatterNameUpdated(this);
        }
    }

    public void dispose() {
        if (this.subscription != null) {
            this.subscription.unsubscribe();
        }
    }

    public String getResolvedName() {
        return this.resolvedName;
    }

    public String getResolvedSecondaryName() {
        return this.resolvedSecondaryName;
    }

    public void subscribe() {
        UserManager userManager = this.chatterID.getUserManager();
        if (userManager == null) {
            this.subscription = null;
            return;
        }
        if (this.chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            this.subscription = userManager.getCurrentLocationInfo().subscribe(SubscriptionSingleDataPool.getSingleDataKey(), this.executor, currentLocationInfo -> onCurrentLocation(currentLocationInfo));
            return;
        }
        if (this.chatterID instanceof ChatterID.ChatterIDUser) {
            this.subscription = userManager.getUserNames().subscribe(((ChatterID.ChatterIDUser) this.chatterID).getChatterUUID(), this.executor, userName -> onUserName(userName));
        } else if (this.chatterID instanceof ChatterID.ChatterIDGroup) {
            this.subscription = userManager.getCachedGroupProfiles().getPool().subscribe(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID(), this.executor, groupProfileReply -> onGroupProfile(groupProfileReply));
        } else {
            this.subscription = null;
        }
    }
}
