package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import androidx.appcompat.app.AlertDialog
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.GroupMember
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.GroupManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatFragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import de.greenrobot.dao.query.LazyList
import java.util.UUID

open class GroupMembersProfileTab : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener {
    private static String ROLE_TO_ADD_KEY = "roleToAdd"
    private SubscriptionData<UUID, UUID> groupMemberList = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            GroupMembersProfileTab.this.onGroupMemberList((UUID) obj)
        }

        override fun onData(obj: Any) {
            return 0
        }

        override fun onBindViewHolder(groupMemberViewHolder: GroupMemberViewHolder, i: Int) {
            if (this.data == null || !(!this.data.isClosed()) || i < 0 || i >= this.data.size()) {
                return
            }
            groupMemberViewHolder.bindToData(this.data.get(i), i == this.selectedPosition)
        }

        override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): GroupMemberViewHolder {
            return GroupMembersProfileTab.this.GroupMemberViewHolder(this.layoutInflater.inflate(R.layout.group_member_list_item, viewGroup, false), GroupMembersProfileTab.this.userManager.getUserID(), this.cardSelectedColor)
        }

        override fun onViewRecycled(groupMemberViewHolder: GroupMemberViewHolder) {
            groupMemberViewHolder.recycle()
        }

        open fun setData(lazyList: LazyList<GroupMember>) {
            this.data = lazyList
            this.selectedPosition = -1
            notifyDataSetChanged()
        }

        open fun setSelectedPosition(selectedPosition2: Int) {
            if (selectedPosition2 != this.selectedPosition) {
                int selectedPosition = this.selectedPosition
                this.selectedPosition = selectedPosition2
                internal fun if(-1: selectedPosition !=):  {
                    notifyItemChanged(selectedPosition)
                }
                internal fun if(-1: selectedPosition2 !=):  {
                    notifyItemChanged(selectedPosition2)
                }
            }
        }
    }

    private class GroupMemberViewHolder : RecyclerView.ViewHolder(), ChatterNameRetriever.OnChatterNameUpdated, View.OnClickListener {
        private UUID agentUUID
        private ChatterID.ChatterIDUser boundChatterID
        private int cardSelectedColor
        private float cardSelectedElevation
        private CardView cardView
        private ChatterNameRetriever chatterNameRetriever
        private Button groupMemberChatButton
        private Button groupMemberEjectButton
        private Button groupMemberProfileButton
        private Button groupMemberRolesButton
        private View selectedLayout
        private TextView userNameTextView
        private TextView userOnlineStatusText
        private ChatterPicView userPicView
        private TextView userTitleText

        internal constructor(view: View, uuid: UUID, cardSelectedColor: Int) {
            super(view)
            this.boundChatterID = null
            this.chatterNameRetriever = null
            this.agentUUID = uuid
            this.cardView = (CardView) view.findViewById(R.id.group_member_card_view)
            this.userNameTextView = (TextView) view.findViewById(R.id.userNameTextView)
            this.userPicView = (ChatterPicView) view.findViewById(R.id.userPicView)
            this.userTitleText = (TextView) view.findViewById(R.id.userTitleText)
            this.userOnlineStatusText = (TextView) view.findViewById(R.id.userOnlineStatusText)
            this.selectedLayout = view.findViewById(R.id.group_member_selected_layout)
            this.groupMemberChatButton = (Button) view.findViewById(R.id.group_member_chat_button)
            this.groupMemberProfileButton = (Button) view.findViewById(R.id.group_member_profile_button)
            this.groupMemberRolesButton = (Button) view.findViewById(R.id.group_member_roles_button)
            this.groupMemberEjectButton = (Button) view.findViewById(R.id.group_member_eject_button)
            this.cardSelectedElevation = this.cardView.getCardElevation()
            this.cardSelectedColor = cardSelectedColor
            this.cardView.setOnClickListener(this)
            this.groupMemberChatButton.setOnClickListener(this)
            this.groupMemberProfileButton.setOnClickListener(this)
            this.groupMemberRolesButton.setOnClickListener(this)
            this.groupMemberEjectButton.setOnClickListener(this)
        }

        internal fun bindToData(groupMember: GroupMember, z: Boolean) {
            ChatterID.ChatterIDUser userChatterID = groupMember != null ? ChatterID.getUserChatterID(this.agentUUID, groupMember.getUserID()) : null
            if (!Objects.equal(userChatterID, this.boundChatterID)) {
                internal fun if(null: this.chatterNameRetriever !=):  {
                    this.chatterNameRetriever.dispose()
                    this.chatterNameRetriever = null
                }
                this.userNameTextView.setText((CharSequence) null)
                this.boundChatterID = userChatterID
                internal fun if(null: userChatterID !=):  {
                    this.chatterNameRetriever = ChatterNameRetriever(this.boundChatterID, this, UIThreadExecutor.getInstance())
                    this.userPicView.setChatterID(userChatterID, this.chatterNameRetriever.getResolvedName())
                } else {
                    this.userPicView.setChatterID(null, null)
                }
            }
            this.userTitleText.setText(groupMember != null ? groupMember.getTitle() : null)
            this.userOnlineStatusText.setText(groupMember != null ? groupMember.getOnlineStatus() : null)
            internal fun if(z):  {
                this.cardView.setCardElevation(this.cardSelectedElevation)
                this.cardView.setCardBackgroundColor(this.cardSelectedColor)
            } else {
                this.cardView.setCardElevation(0.0f)
                this.cardView.setCardBackgroundColor(0)
            }
            this.selectedLayout.setVisibility(z ? View.VISIBLE : View.GONE)
            AvatarGroupList.AvatarGroupEntry myGroupEntry = GroupMembersProfileTab.this.getMyGroupEntry()
            this.groupMemberEjectButton.setVisibility(GroupMembersProfileTab.this.agentCircuit != null && myGroupEntry != null && ((myGroupEntry.GroupPowers & 4) > 0L ? 1 : ((myGroupEntry.GroupPowers & 4) == 0L ? 0 : -1)) != 0 ? 0 : 8)
            this.groupMemberRolesButton.setVisibility(myGroupEntry == null ? View.GONE : View.VISIBLE)
        }

        override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
            internal fun if(null: chatterNameRetriever !=):  {
                this.userNameTextView.setText(chatterNameRetriever.getResolvedName())
                this.userPicView.setChatterID(chatterNameRetriever.chatterID, chatterNameRetriever.getResolvedName())
            }
        }

        override fun onClick(view: View) {
            when (view.getId()) {
                R.id.group_member_card_view -> {
                    if (!GroupMembersProfileTab.this.getArguments().containsKey(GroupMembersProfileTab.ROLE_TO_ADD_KEY)) {
                        internal fun if(null: GroupMembersProfileTab.this.adapter !=):  {
                            GroupMembersProfileTab.this.adapter.setSelectedPosition(getAdapterPosition())
                            }
                        }
                    } else if (this.boundChatterID != null) {
                        GroupMembersProfileTab.this.addGroupRoleMember(this.boundChatterID)
                        }
                    }
                    }
                R.id.group_member_chat_button -> {
                    internal fun if(null: this.boundChatterID !=):  {
                        DetailsActivity.showDetails(GroupMembersProfileTab.this.getActivity(), ChatFragmentActivityFactory.getInstance(), ChatFragment.makeSelection(this.boundChatterID))
                        }
                    }
                    }
                R.id.group_member_profile_button -> {
                    DetailsActivity.showEmbeddedDetails(GroupMembersProfileTab.this.getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(this.boundChatterID))
                    }
                R.id.group_member_roles_button -> {
                    internal fun if(null: this.boundChatterID !=):  {
                        DetailsActivity.showEmbeddedDetails(GroupMembersProfileTab.this.getActivity(), GroupMemberRolesFragment.class, GroupMemberRolesFragment.makeSelection(GroupMembersProfileTab.this.chatterID, this.boundChatterID.getChatterUUID()))
                        }
                    }
                    }
                R.id.group_member_eject_button -> {
                    internal fun if(null: this.boundChatterID !=):  {
                        GroupMembersProfileTab.this.ejectGroupMember(this.boundChatterID)
                        }
                    }
                    }
            }
        }

        internal fun recycle() {
            internal fun if(null: this.chatterNameRetriever !=):  {
                this.chatterNameRetriever.dispose()
                this.chatterNameRetriever = null
            }
            this.boundChatterID = null
            this.userPicView.setChatterID(null, null)
        }
    }

    open fun addGroupRoleMember(chatterIDUser: ChatterID.ChatterIDUser) {
        UUID uuid = UUIDPool.getUUID(getArguments().getString(ROLE_TO_ADD_KEY))
        internal fun if(null: uuid !=):  {
            new AlertDialog.Builder(getContext()).setTitle(R.string.add_role_member_confirm).setPositiveButton(R.string.yes_add_button, new DialogInterface.OnClickListener() {
                    GroupMembersProfileTab.this.m484xf9973c0c((UUID) uuid, (ChatterID.ChatterIDUser) chatterIDUser, dialogInterface, i)
                }

                override fun onClick(dialogInterface: DialogInterface, i: Int) {