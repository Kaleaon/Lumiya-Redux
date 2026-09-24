package com.lumiyaviewer.lumiya.ui.chat.profiles;

import android.os.Bundle;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.ui.common.binding.Unbinder;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.ImageAssetView;
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout;
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import java.util.UUID;
import javax.annotation.Nullable;

public class UserFirstLifeProfileTab extends ChatterReloadableFragment implements LoadableMonitor.OnLoadableDataChangedListener {

    Button aboutEditButton;

    Button changePicButton;

    LoadingLayout loadingLayout;

    SwipeRefreshLayout swipeRefreshLayout;
    private Unbinder unbinder;

    ImageAssetView userPicView;

    TextView userProfileAboutText;

    TextView userProfilePaymentInfo;
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
        View inflate = layoutInflater.inflate(R.layout.user_profile_tab_first, viewGroup, false);
        this.unbinder = new UserFirstLifeProfileTab_ViewBinding(this, inflate);
        this.loadingLayout.setSwipeRefreshLayout(this.swipeRefreshLayout);
        this.loadableMonitor.setLoadingLayout(this.loadingLayout, getString(R.string.no_user_selected), getString(R.string.user_profile_fail));
        this.loadableMonitor.setSwipeRefreshLayout(this.swipeRefreshLayout);
        return inflate;
    }

    @Override
    public void onDestroyView() {
        if (this.unbinder != null) {
            this.unbinder.unbind();
            this.unbinder = null;
        }
        super.onDestroyView();
    }

    @Override
    public void onLoadableDataChanged() {
        if (getView() != null) {
            try {
                AvatarPropertiesReply avatarPropertiesReply = this.avatarProperties.get();
                boolean z = (avatarPropertiesReply.PropertiesData_Field.Flags & 8) != 0;
                boolean z2 = (avatarPropertiesReply.PropertiesData_Field.Flags & 4) != 0;
                this.userPicView.setAssetID(avatarPropertiesReply.PropertiesData_Field.FLImageID);
                this.userProfileAboutText.setText(SLMessage.stringFromVariableUTF(avatarPropertiesReply.PropertiesData_Field.FLAboutText));
                this.userProfilePaymentInfo.setText(z ? R.string.payment_info_used : z2 ? R.string.payment_info_identified : R.string.payment_info_none);
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
        if (this.unbinder != null) {
            boolean equals = chatterUUID.equals(this.userManager.getUserID());
            this.aboutEditButton.setVisibility(equals ? View.VISIBLE : View.GONE);
            this.changePicButton.setVisibility(equals ? View.VISIBLE : View.GONE);
        }
    }
}
