package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.ClipData
import android.os.Bundle
import android.text.util.Linkify
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.UserProfileTabMainBinding
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.messages.AvatarNotesReply
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.text.ParseException
import java.text.SimpleDateFormat
import java.util.Date
import java.util.UUID

open class UserMainProfileTab : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener {

    private UserProfileTabMainBinding binding

    private SubscriptionData<UUID, AvatarPropertiesReply> avatarProperties = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, AvatarNotesReply> avatarNotes = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, Boolean> onlineStatus = SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.avatarProperties, this.avatarNotes, this.onlineStatus).withDataChangedListener(this)
    private ChatterNameRetriever partnerNameRetriever = null
    private ChatterNameRetriever.OnChatterNameUpdated onPartnerNameReady = ChatterNameRetriever.OnChatterNameUpdated() {
            UserMainProfileTab.this.m519x9d89034f(chatterNameRetriever)
        }

        override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
                Debug.Warning(e)
            }
        }
    }

    override protected fun onShowUser(chatterID: ChatterID) {
        View view = getView()
        this.loadableMonitor.unsubscribeAll()
        if (this.partnerNameRetriever != null) {
            this.partnerNameRetriever.dispose()
            this.partnerNameRetriever = null
        }
        if (this.userManager == null || !(chatterID is ChatterID.ChatterIDUser)) {
            if (view != null) {
                binding.textProfileAgentKey.setText("")
                binding.aboutEditButton.setVisibility(View.GONE)
                binding.changePicButton.setVisibility(View.GONE)
                return
            }
            return
        }
        UUID chatterUUID = ((ChatterID.ChatterIDUser) chatterID).getChatterUUID()
        this.avatarProperties.subscribe(this.userManager.getAvatarProperties().getPool(), chatterUUID)
        this.onlineStatus.subscribe(this.userManager.getChatterList().getFriendManager().getOnlineStatus(), chatterUUID)
        this.avatarNotes.subscribe(this.userManager.getAvatarNotes().getPool(), chatterUUID)
        if (view != null) {
            binding.textProfileAgentKey.setText(chatterUUID.toString())
            boolean equals = chatterUUID == (this.userManager.getUserID())
            binding.aboutEditButton.setVisibility(equals ? View.VISIBLE : View.GONE)
            binding.changePicButton.setVisibility(equals ? View.VISIBLE : View.GONE)
        }
    }

    protected open fun onViewProfileClicked(view: View) {
        if (this.chatterID != null) {
            try {
                UUID uuid = this.avatarProperties.get().PropertiesData_Field.PartnerID
                if (uuid == null || !(!uuid == (UUIDPool.ZeroUUID)) || this.chatterID == null) {
                    return
                }
                DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(this.chatterID.agentUUID, uuid)))
            } catch (SubscriptionData.DataNotReadyException e) {
                Debug.Warning(e)
            }
        }
    }
}
