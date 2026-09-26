package com.lumiyaviewer.lumiya.ui.common

import android.content.DialogInterface
import android.os.Bundle
import androidx.annotation.CallSuper
import androidx.fragment.app.FragmentActivity
import androidx.appcompat.app.AlertDialog
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.StreamingMediaService
import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.dao.Friend
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteType
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.SLGroupInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.ChatNewActivity
import com.lumiyaviewer.lumiya.ui.chat.GroupNoticeFragment
import com.lumiyaviewer.lumiya.ui.chat.PayUserFragment
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatFragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.ParcelPropertiesFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.TextFieldDialogBuilder
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo
import java.util.concurrent.atomic.AtomicInteger

abstract class UserFunctionsFragment : ChatterReloadableFragment(), ReloadableFragment {

    private SubscriptionData<SubscriptionSingleKey, Boolean> voiceLoggedIn = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            UserFunctionsFragment.this.onVoiceLoginStatusChanged((Boolean) obj)
        }

        override fun onData(obj: Any) {

            override fun onClick(dialogInterface: DialogInterface, i: Int) {

                override fun onClick(dialogInterface: DialogInterface, i: Int) {