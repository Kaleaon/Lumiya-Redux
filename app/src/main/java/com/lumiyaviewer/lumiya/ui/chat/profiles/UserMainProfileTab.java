package com.lumiyaviewer.lumiya.ui.chat.profiles;

import android.content.ClipData;
import android.os.Bundle;
import android.text.util.Linkify;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.databinding.UserProfileTabMainBinding;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarNotesReply;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import javax.annotation.Nullable;

public class UserMainProfileTab extends ChatterReloadableFragment implements LoadableMonitor.OnLoadableDataChangedListener {

    private UserProfileTabMainBinding binding;

    private final SubscriptionData<UUID, AvatarPropertiesReply> avatarProperties = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final SubscriptionData<UUID, AvatarNotesReply> avatarNotes = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final SubscriptionData<UUID, Boolean> onlineStatus = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final LoadableMonitor loadableMonitor = new LoadableMonitor(this.avatarProperties, this.avatarNotes, this.onlineStatus).withDataChangedListener(this);
    private ChatterNameRetriever partnerNameRetriever = null;
    private final ChatterNameRetriever.OnChatterNameUpdated onPartnerNameReady = new ChatterNameRetriever.OnChatterNameUpdated() {
        private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
            UserMainProfileTab.this.m519x9d89034f(chatterNameRetriever);
        }

        @Override
        public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
            $m$0(chatterNameRetriever);
        }
    };

    private String getAge(AvatarPropertiesReply avatarPropertiesReply) {
        String trim = SLMessage.stringFromVariableOEM(avatarPropertiesReply.PropertiesData_Field.BornOn).trim();
        if (trim.equals("")) {
            return trim;
        }
        String format = String.format(getString(R.string.born_since), trim);
        try {
            return String.format(getString(R.string.age_days), Long.valueOf((new Date().getTime() - new SimpleDateFormat("MM/dd/yyyy").parse(trim).getTime()) / 86400000));
        } catch (ParseException e) {
            return format;
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserMainProfileTab_9585, reason: not valid java name */
    /* synthetic */ void m519x9d89034f(ChatterNameRetriever chatterNameRetriever) {
        if (getView() != null) {
            binding.userProfilePartnerName.setText(chatterNameRetriever.getResolvedName());
            binding.userProfilePartnerPic.setChatterID(chatterNameRetriever.chatterID, chatterNameRetriever.getResolvedName());
        }
    }

    protected void onAboutEditClicked(View view) {
        if (this.chatterID != null) {
            DetailsActivity.showEmbeddedDetails(getActivity(), UserAboutTextEditFragment.class, UserAboutTextEditFragment.makeSelection(this.chatterID, false));
        }
    }

    protected void onChangePicClicked(View view) {
        AvatarPropertiesReply data = this.avatarProperties.getData();
        if (this.chatterID == null || data == null) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putParcelable("oldProfileData", data);
        getContext().startActivity(InventoryActivity.makeSelectActionIntent(getContext(), this.chatterID.agentUUID, InventoryActivity.SelectAction.applyUserProfile, bundle, SLAssetType.AT_TEXTURE));
    }

    @Override
    public void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
        super.onChatterNameUpdated(chatterNameRetriever);
        View view = getView();
        if (this.chatterID == null || !Objects.equal(chatterNameRetriever.chatterID, this.chatterID) || view == null) {
            return;
        }
        binding.textProfilePrimaryName.setText(chatterNameRetriever.getResolvedName());
        binding.textProfileSecondaryName.setText(chatterNameRetriever.getResolvedSecondaryName());
    }

    protected void onCopyAgentKeyClicked(View view) {
        if (this.chatterID instanceof ChatterID.ChatterIDUser) {
            String uuid = ((ChatterID.ChatterIDUser) this.chatterID).getChatterUUID().toString();
            ((android.content.ClipboardManager) getActivity().getSystemService("clipboard")).setPrimaryClip(ClipData.newPlainText("Agent key", uuid));
            Toast.makeText(getActivity(), "Agent key copied to clipboard", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        binding = UserProfileTabMainBinding.inflate(layoutInflater, viewGroup, false);
        binding.aboutEditButton.setOnClickListener(v -> onAboutEditClicked(v));
        binding.changePicButton.setOnClickListener(v -> onChangePicClicked(v));
        binding.buttonCopyAgentKey.setOnClickListener(v -> onCopyAgentKeyClicked(v));
        binding.buttonEditNotes.setOnClickListener(v -> onEditNotesClicked(v));
        binding.userProfileViewPartnerButton.setOnClickListener(v -> onViewProfileClicked(v));
        binding.userPicView.setAlignTop(true);
        binding.userPicView.setVerticalFit(true);
        binding.loadingLayout.setSwipeRefreshLayout(binding.swipeRefreshLayout);
        this.loadableMonitor.setLoadingLayout(binding.loadingLayout, getString(R.string.no_user_selected), getString(R.string.user_profile_fail));
        this.loadableMonitor.setSwipeRefreshLayout(binding.swipeRefreshLayout);
        return binding.getRoot();
    }

    @Override
    public void onDestroyView() {
        binding = null;
        super.onDestroyView();
    }

    protected void onEditNotesClicked(View view) {
        if (this.chatterID != null) {
            DetailsActivity.showEmbeddedDetails(getActivity(), UserNotesEditFragment.class, UserNotesEditFragment.makeSelection(this.chatterID));
        }
    }

    @Override
    public void onLoadableDataChanged() {
        if (getView() != null) {
            try {
                AvatarPropertiesReply avatarPropertiesReply = this.avatarProperties.get();
                binding.userPicView.setAssetID(avatarPropertiesReply.PropertiesData_Field.ImageID);
                binding.userProfileAboutText.setText(SLMessage.stringFromVariableUTF(avatarPropertiesReply.PropertiesData_Field.AboutText));
                binding.textProfileAge.setText(getAge(avatarPropertiesReply));
                if (this.partnerNameRetriever != null) {
                    this.partnerNameRetriever.dispose();
                    this.partnerNameRetriever = null;
                }
                UUID uuid = avatarPropertiesReply.PropertiesData_Field.PartnerID;
                if (uuid == null || !(!uuid.equals(UUIDPool.ZeroUUID)) || this.chatterID == null) {
                    binding.userPartnerCardView.setVisibility(View.GONE);
                    binding.userProfilePartnerPic.setChatterID(null, null);
                } else {
                    ChatterID.ChatterIDUser userChatterID = ChatterID.getUserChatterID(this.chatterID.agentUUID, uuid);
                    binding.userPartnerCardView.setVisibility(View.VISIBLE);
                    this.partnerNameRetriever = new ChatterNameRetriever(userChatterID, this.onPartnerNameReady, UIThreadExecutor.getInstance());
                }
                String trim = SLMessage.stringFromVariableOEM(avatarPropertiesReply.PropertiesData_Field.ProfileURL).trim();
                if (trim.isEmpty()) {
                    binding.userWebProfileCardView.setVisibility(View.GONE);
                } else {
                    binding.userWebProfileLink.setText(trim);
                    Linkify.addLinks(binding.userWebProfileLink, 15);
                    binding.userWebProfileCardView.setVisibility(View.VISIBLE);
                }
                String trimmed = SLMessage.stringFromVariableUTF(this.avatarNotes.get().Data_Field.Notes).trim();
                if (trimmed.isEmpty()) {
                    binding.textProfileNotesText.setText(R.string.user_notes_no_notes);
                    binding.textProfileNotesText.setTypeface(null, 2);
                    binding.userProfileNotesCaption.setVisibility(View.GONE);
                } else {
                    binding.textProfileNotesText.setText(trimmed);
                    binding.textProfileNotesText.setTypeface(null, 0);
                    binding.userProfileNotesCaption.setVisibility(View.VISIBLE);
                }
                binding.textProfileOnline.setText(getString(this.onlineStatus.get().booleanValue() ? R.string.profile_user_online : R.string.profile_user_offline));
            } catch (SubscriptionData.DataNotReadyException e) {
                Debug.Warning(e);
            }
        }
    }

    @Override
    protected void onShowUser(@Nullable ChatterID chatterID) {
        View view = getView();
        this.loadableMonitor.unsubscribeAll();
        if (this.partnerNameRetriever != null) {
            this.partnerNameRetriever.dispose();
            this.partnerNameRetriever = null;
        }
        if (this.userManager == null || !(chatterID instanceof ChatterID.ChatterIDUser)) {
            if (view != null) {
                binding.textProfileAgentKey.setText("");
                binding.aboutEditButton.setVisibility(View.GONE);
                binding.changePicButton.setVisibility(View.GONE);
                return;
            }
            return;
        }
        UUID chatterUUID = ((ChatterID.ChatterIDUser) chatterID).getChatterUUID();
        this.avatarProperties.subscribe(this.userManager.getAvatarProperties().getPool(), chatterUUID);
        this.onlineStatus.subscribe(this.userManager.getChatterList().getFriendManager().getOnlineStatus(), chatterUUID);
        this.avatarNotes.subscribe(this.userManager.getAvatarNotes().getPool(), chatterUUID);
        if (view != null) {
            binding.textProfileAgentKey.setText(chatterUUID.toString());
            boolean equals = chatterUUID.equals(this.userManager.getUserID());
            binding.aboutEditButton.setVisibility(equals ? View.VISIBLE : View.GONE);
            binding.changePicButton.setVisibility(equals ? View.VISIBLE : View.GONE);
        }
    }

    protected void onViewProfileClicked(View view) {
        if (this.chatterID != null) {
            try {
                UUID uuid = this.avatarProperties.get().PropertiesData_Field.PartnerID;
                if (uuid == null || !(!uuid.equals(UUIDPool.ZeroUUID)) || this.chatterID == null) {
                    return;
                }
                DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(this.chatterID.agentUUID, uuid)));
            } catch (SubscriptionData.DataNotReadyException e) {
                Debug.Warning(e);
            }
        }
    }
}
