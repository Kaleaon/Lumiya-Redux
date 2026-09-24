package com.lumiyaviewer.lumiya.ui.chat;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatFragmentActivityFactory;
import com.lumiyaviewer.lumiya.ui.chat.profiles.ParcelPropertiesFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory;
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity;
import java.util.UUID;
import javax.annotation.Nonnull;

public class ChatNewActivity extends MasterDetailsActivity implements UnreadNotificationManager.NotifyCapture {
    private Subscription<SubscriptionSingleKey, CurrentLocationInfo> currentLocationInfoSubscription;
    private final Subscription.OnData<CurrentLocationInfo> onCurrentLocation = new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            ChatNewActivity.this.m424lambda$com_lumiyaviewer_lumiya_ui_chat_ChatNewActivity_4384((CurrentLocationInfo) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    };

    @Override
    protected FragmentActivityFactory getDetailsFragmentFactory() {
        return ChatFragmentActivityFactory.getInstance();
    }

    @Override
    protected Bundle getNewDetailsFragmentArguments(@Nullable Bundle bundle, @Nullable Bundle bundle2) {
        if (bundle2 != null) {
            return super.getNewDetailsFragmentArguments(bundle, bundle2);
        }
        UUID activeAgentID = ActivityUtils.getActiveAgentID(getIntent());
        return activeAgentID != null ? ChatFragment.makeSelection(ChatterID.getLocalChatterID(activeAgentID)) : super.getNewDetailsFragmentArguments(bundle, null);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_ChatNewActivity_4384, reason: not valid java name */
    /* synthetic */ void m424lambda$com_lumiyaviewer_lumiya_ui_chat_ChatNewActivity_4384(CurrentLocationInfo currentLocationInfo) {
        ParcelData parcelData = currentLocationInfo.parcelData();
        String name = parcelData != null ? parcelData.getName() : null;
        if (name == null) {
            name = getString(R.string.name_loading_title);
        }
        setDefaultTitle(name, null);
    }

    @Override
    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setDefaultTitle(getString(R.string.app_name), null);
    }

    @Override
    protected Fragment onCreateMasterFragment(Intent intent, @Nullable Bundle bundle) {
        return ContactsFragment.newInstance(ActivityUtils.makeFragmentArguments(ActivityUtils.getActiveAgentID(intent), null));
    }

    @Override
    @javax.annotation.Nullable
    public Intent onGetNotifyCaptureIntent(@Nonnull UnreadNotificationInfo unreadNotificationInfo, Intent intent) {
        intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        intent.putExtra("fromSameActivity", true);
        return intent;
    }

    @Override
    protected void onPause() {
        UserManager userManager = ActivityUtils.getUserManager(getIntent());
        if (userManager != null) {
            userManager.getUnreadNotificationManager().clearNotifyCapture(this);
        }
        super.onPause();
    }

    @Override
    protected void onResume() {
        super.onResume();
        UserManager userManager = ActivityUtils.getUserManager(getIntent());
        if (userManager != null) {
            userManager.getUnreadNotificationManager().setNotifyCapture(this);
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        UserManager userManager = ActivityUtils.getUserManager(getIntent());
        if (userManager != null) {
            this.currentLocationInfoSubscription = userManager.getCurrentLocationInfo().subscribe(SubscriptionSingleDataPool.getSingleDataKey(), UIThreadExecutor.getInstance(), this.onCurrentLocation);
        }
        Intent intent = getIntent();
        if (intent.hasExtra(ParcelPropertiesFragment.PARCEL_DATA_KEY)) {
            ParcelData parcelData = (ParcelData) intent.getSerializableExtra(ParcelPropertiesFragment.PARCEL_DATA_KEY);
            intent.removeExtra(ParcelPropertiesFragment.PARCEL_DATA_KEY);
            if (userManager != null) {
                DetailsActivity.showEmbeddedDetails(this, ParcelPropertiesFragment.class, ParcelPropertiesFragment.makeSelection(userManager.getUserID(), parcelData));
            }
        }
    }

    @Override
    protected void onStop() {
        if (this.currentLocationInfoSubscription != null) {
            this.currentLocationInfoSubscription.unsubscribe();
            this.currentLocationInfoSubscription = null;
        }
        super.onStop();
    }
}
