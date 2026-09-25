package com.lumiyaviewer.lumiya.ui.chat.profiles;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.cardview.widget.CardView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import com.lumiyaviewer.lumiya.ui.common.binding.Unbinder;
import com.google.common.base.Strings;
import com.google.common.logging.nano.Vr;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.StreamingMediaService;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.common.ImageAssetView;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;

public class ParcelPropertiesFragment extends FragmentWithTitle {
    public static final String PARCEL_DATA_KEY = "parcelData";

    Button mediaPlayButton;

    Button mediaStopButton;

    TextView parcelArea;

    TextView parcelDescription;

    ImageAssetView parcelImageView;

    CardView parcelMediaCardView;

    TextView parcelMediaURL;

    TextView parcelName;

    TextView parcelOwnerName;

    ChatterPicView parcelOwnerPic;

    CardView simRestartCardView;
    private Unbinder unbinder = null;
    private ParcelData parcelData = null;
    private UserManager userManager = null;
    private final ChatterNameDisplayer ownerNameDisplayer = new ChatterNameDisplayer();
    private final ExecutorService homeLocationExecutor = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "SetHomeLocation");
        thread.setDaemon(true);
        return thread;
    });
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private Future<?> setHomeFuture;
    private ProgressDialog setHomeProgressDialog;
    private final AtomicInteger setHomeGeneration = new AtomicInteger();
    private final SubscriptionData<SubscriptionSingleKey, Boolean> isPlayingMedia = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            ParcelPropertiesFragment.this.onIsPlayingMedia((Boolean) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            ParcelPropertiesFragment.this.onAgentCircuit((SLAgentCircuit) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });

    public static Bundle makeSelection(UUID uuid, ParcelData parcelData) {
        Bundle bundle = new Bundle();
        bundle.putString("activeAgentUUID", uuid.toString());
        bundle.putSerializable(PARCEL_DATA_KEY, parcelData);
        return bundle;
    }

    public void onAgentCircuit(SLAgentCircuit agentCircuit) {
        updateSimOptions();
    }

    public void onIsPlayingMedia(Boolean bool) {
        updatePlayingStatus();
    }

    private void updatePlayingStatus() {
        if (this.unbinder != null) {
            Boolean data = this.isPlayingMedia.getData();
            boolean booleanValue = data != null ? data.booleanValue() : false;
            this.mediaPlayButton.setVisibility(booleanValue ? View.GONE : View.VISIBLE);
            this.mediaStopButton.setVisibility(booleanValue ? View.VISIBLE : View.GONE);
        }
    }

    private void updateSimOptions() {
        if (this.unbinder != null) {
            SLAgentCircuit data = this.agentCircuit.getData();
            this.simRestartCardView.setVisibility(data != null && data.getIsEstateManager() ? View.VISIBLE : View.GONE);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment_8181, reason: not valid java name */
    /* synthetic */ void m514x74bd5c0c(SLAgentCircuit agentCircuit, DialogInterface dialogInterface, int i) {
        agentCircuit.RestartRegion(Vr.VREvent.VrCore.ErrorCode.CONTROLLER_INFO_READ_ERROR);
        Toast.makeText(getContext(), R.string.region_restart_ok_message, Toast.LENGTH_LONG).show();
        dialogInterface.dismiss();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment_9097, reason: not valid java name */
    /* synthetic */ void m515x74bdcccf(DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        setHomeLocation();
    }

    private void setHomeLocation() {
        cancelSetHomeLocation();
        setHomeProgressDialog = ProgressDialog.show(getContext(), null, getString(R.string.setting_home_location), true);
        final SLAgentCircuit circuit = this.agentCircuit.getData();
        final int generation = setHomeGeneration.get();
        setHomeFuture = homeLocationExecutor.submit(() -> {
            final boolean succeeded = circuit != null && circuit.getModules().userProfiles.SetHomeLocation();
            mainHandler.post(() -> showSetHomeLocationResult(generation, succeeded));
        });
    }

    private void showSetHomeLocationResult(int generation, boolean succeeded) {
        if (generation != setHomeGeneration.get()) {
            return;
        }
        setHomeFuture = null;
        if (setHomeProgressDialog != null) {
            setHomeProgressDialog.dismiss();
            setHomeProgressDialog = null;
        }
        if (!isAdded() || getView() == null) {
            return;
        }
        new AlertDialog.Builder(requireContext())
                .setMessage(succeeded ? R.string.set_home_success : R.string.set_home_failed)
                .setCancelable(true)
                .create()
                .show();
    }

    private void cancelSetHomeLocation() {
        setHomeGeneration.incrementAndGet();
        if (setHomeFuture != null) {
            setHomeFuture.cancel(true);
            setHomeFuture = null;
        }
        mainHandler.removeCallbacksAndMessages(null);
        if (setHomeProgressDialog != null) {
            setHomeProgressDialog.dismiss();
            setHomeProgressDialog = null;
        }
    }

    @Override
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.parcel_properties_fragment, viewGroup, false);
        this.unbinder = new ParcelPropertiesFragment_ViewBinding(this, inflate);
        this.ownerNameDisplayer.bindViews(this.parcelOwnerName, this.parcelOwnerPic);
        this.parcelImageView.setVerticalFit(true);
        this.parcelImageView.setAlignTop(true);
        return inflate;
    }

    @Override
    public void onDestroyView() {
        cancelSetHomeLocation();
        if (this.unbinder != null) {
            this.unbinder.unbind();
            this.ownerNameDisplayer.unbindViews();
            this.unbinder = null;
        }
        super.onDestroyView();
    }

    @Override
    public void onDestroy() {
        homeLocationExecutor.shutdownNow();
        super.onDestroy();
    }

    public void onOwnerProfileButton() {
        if (this.parcelData != null) {
            if (this.parcelData.isGroupOwned()) {
                DetailsActivity.showEmbeddedDetails(getActivity(), GroupProfileFragment.class, GroupProfileFragment.makeSelection(this.ownerNameDisplayer.getChatterID()));
            } else {
                DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(this.ownerNameDisplayer.getChatterID()));
            }
        }
    }

    public void onParcelMediaPlay() {
        if (this.parcelData == null || !(!Strings.isNullOrEmpty(this.parcelData.getMediaURL())) || this.userManager == null) {
            return;
        }
        Intent intent = new Intent(getContext(), (Class<?>) StreamingMediaService.class);
        intent.setAction("com.lumiyaviewer.lumiya.ACTION_PLAY_MEDIA");
        ActivityUtils.setActiveAgentID(intent, this.userManager.getUserID());
        intent.putExtra(PARCEL_DATA_KEY, this.parcelData);
        intent.putExtra(StreamingMediaService.MEDIA_URL_KEY, this.parcelData.getMediaURL());
        intent.putExtra(StreamingMediaService.LOCATION_NAME_KEY, this.parcelData.getName());
        StreamingMediaService.startServiceCompat(getContext(), intent);
    }

    public void onParcelMediaStop() {
        Intent intent = new Intent(getContext(), (Class<?>) StreamingMediaService.class);
        intent.setAction("com.lumiyaviewer.lumiya.ACTION_STOP_MEDIA");
        StreamingMediaService.startServiceCompat(getContext(), intent);
    }

    public void onSetHomeButton() {
        if (this.agentCircuit.getData() != null) {
            new AlertDialog.Builder(getContext()).setMessage(R.string.set_home_confirm_title).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                    ParcelPropertiesFragment.this.m515x74bdcccf(dialogInterface, i);
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i) {
                    $m$0(dialogInterface, i);
                }
            }).setNegativeButton("No", new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                    dialogInterface.cancel();
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i) {
                    $m$0(dialogInterface, i);
                }
            }).create().show();
        }
    }

    public void onSimRestartButton() {
        final SLAgentCircuit data = this.agentCircuit.getData();
        if (data != null) {
            new AlertDialog.Builder(getContext()).setMessage(R.string.restart_region_confirm_title).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                    ParcelPropertiesFragment.this.m514x74bd5c0c((SLAgentCircuit) data, dialogInterface, i);
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i) {
                    $m$0(dialogInterface, i);
                }
            }).setNegativeButton("No", new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                    dialogInterface.cancel();
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i) {
                    $m$0(dialogInterface, i);
                }
            }).setCancelable(true).create().show();
        }
    }

    @Override
    public void onStart() {
        super.onStart();
        this.userManager = UserManager.getUserManager(UUIDPool.getUUID(getArguments().getString("activeAgentUUID")));
        this.parcelData = (ParcelData) getArguments().getSerializable(PARCEL_DATA_KEY);
        this.isPlayingMedia.subscribe(StreamingMediaService.isPlayingMedia, SubscriptionSingleKey.Value);
        if (this.userManager != null) {
            this.agentCircuit.subscribe(UserManager.agentCircuits(), this.userManager.getUserID());
        }
        if (this.parcelData == null || this.userManager == null || this.unbinder == null) {
            return;
        }
        this.ownerNameDisplayer.setChatterID(this.parcelData.isGroupOwned() ? ChatterID.getGroupChatterID(this.userManager.getUserID(), this.parcelData.getOwnerID()) : ChatterID.getUserChatterID(this.userManager.getUserID(), this.parcelData.getOwnerID()));
        this.parcelImageView.setAssetID(this.parcelData.getSnapshotUUID());
        this.parcelName.setText(this.parcelData.getName());
        this.parcelArea.setText(getString(R.string.parcel_area_format, Integer.valueOf(this.parcelData.getArea())));
        this.parcelDescription.setText(Strings.isNullOrEmpty(this.parcelData.getDescription()) ? getString(R.string.asset_no_description) : this.parcelData.getDescription());
        this.parcelMediaCardView.setVisibility(Strings.isNullOrEmpty(this.parcelData.getMediaURL()) ? View.GONE : View.VISIBLE);
        this.parcelMediaURL.setText(this.parcelData.getMediaURL());
        updatePlayingStatus();
        updateSimOptions();
    }

    @Override
    public void onStop() {
        this.userManager = null;
        this.parcelData = null;
        this.ownerNameDisplayer.setChatterID(null);
        this.parcelImageView.setAssetID(null);
        this.isPlayingMedia.unsubscribe();
        this.agentCircuit.unsubscribe();
        super.onStop();
    }
}
