package com.lumiyaviewer.lumiya.ui.chat.profiles;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.databinding.UserProfileTabFirstBinding;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import java.util.UUID;
import javax.annotation.Nullable;

public class UserFirstLifeProfileTab extends ChatterReloadableFragment implements LoadableMonitor.OnLoadableDataChangedListener {

    private UserProfileTabFirstBinding binding;

    private final SubscriptionData<UUID, AvatarPropertiesReply> avatarProperties = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final LoadableMonitor loadableMonitor = new LoadableMonitor(this.avatarProperties).withDataChangedListener(this);

    protected void onAboutEditClicked(View view) {
        if (this.chatterID != null) {
            DetailsActivity.showEmbeddedDetails(getActivity(), UserAboutTextEditFragment.class, UserAboutTextEditFragment.makeSelection(this.chatterID, true));
        }
    }

    protected void onChangePicClicked(View view) {
        AvatarPropertiesReply data = this.avatarProperties.getData();
        if (this.chatterID == null || data == null) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putParcelable("oldProfileData", data);
        getContext().startActivity(InventoryActivity.makeSelectActionIntent(getContext(), this.chatterID.agentUUID, InventoryActivity.SelectAction.applyFirstLife, bundle, SLAssetType.AT_TEXTURE));
    }

    @Override
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        binding = UserProfileTabFirstBinding.inflate(layoutInflater, viewGroup, false);
        binding.aboutEditButton.setOnClickListener(v -> onAboutEditClicked(v));
        binding.changePicButton.setOnClickListener(v -> onChangePicClicked(v));
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

    @Override
    public void onLoadableDataChanged() {
        if (getView() != null) {
            try {
                AvatarPropertiesReply avatarPropertiesReply = this.avatarProperties.get();
                boolean z = (avatarPropertiesReply.PropertiesData_Field.Flags & 8) != 0;
                boolean z2 = (avatarPropertiesReply.PropertiesData_Field.Flags & 4) != 0;
                binding.userPicView.setAssetID(avatarPropertiesReply.PropertiesData_Field.FLImageID);
                binding.userProfileAboutText.setText(SLMessage.stringFromVariableUTF(avatarPropertiesReply.PropertiesData_Field.FLAboutText));
                binding.textProfilePaymentInfo.setText(z ? R.string.payment_info_used : z2 ? R.string.payment_info_identified : R.string.payment_info_none);
            } catch (SubscriptionData.DataNotReadyException e) {
                Debug.Warning(e);
            }
        }
    }

    @Override
    protected void onShowUser(@Nullable ChatterID chatterID) {
        this.loadableMonitor.unsubscribeAll();
        if (this.userManager == null || !(chatterID instanceof ChatterID.ChatterIDUser)) {
            return;
        }
        UUID chatterUUID = ((ChatterID.ChatterIDUser) chatterID).getChatterUUID();
        this.avatarProperties.subscribe(this.userManager.getAvatarProperties().getPool(), chatterUUID);
        if (binding != null) {
            boolean equals = chatterUUID.equals(this.userManager.getUserID());
            binding.aboutEditButton.setVisibility(equals ? View.VISIBLE : View.GONE);
            binding.changePicButton.setVisibility(equals ? View.VISIBLE : View.GONE);
        }
    }
}
