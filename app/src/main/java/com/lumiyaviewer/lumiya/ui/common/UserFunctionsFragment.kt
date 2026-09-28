package com.lumiyaviewer.lumiya.ui.common

import android.os.Bundle
import androidx.annotation.CallSuper
import androidx.appcompat.app.AlertDialog
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.StreamingMediaService
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteType
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.SLGroupInfo
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
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import java.util.concurrent.atomic.AtomicInteger

abstract class UserFunctionsFragment : ChatterReloadableFragment(), ReloadableFragment {

    private val voiceLoggedIn = SubscriptionData<SubscriptionSingleKey, Boolean>(
        UIThreadExecutor.getInstance(),
        onData = { obj -> onVoiceLoginStatusChanged(obj) }
    )
    protected val currentLocationInfo = SubscriptionData<SubscriptionSingleKey, CurrentLocationInfo>(
        UIThreadExecutor.getInstance(),
        onData = { obj -> onCurrentLocationChanged(obj) }
    )

    private fun handleEnableVoice() {
        AlertDialog.Builder(requireContext()).setMessage(getString(R.string.enable_voice_question))
            .setPositiveButton("Yes") { dialogInterface, _ ->
                dialogInterface.dismiss()
                GlobalOptions.getInstance().enableVoice()
            }
            .setNegativeButton("No") { dialogInterface, _ -> dialogInterface.cancel() }
            .setCancelable(true).create().show()
    }

    private fun handlePlayParcelMedia() {
        StreamingMediaService.startStreamingMediaService(requireContext(), this.userManager)
    }

    private fun handleTeleportTo(agentCircuit: SLAgentCircuit?, chatterIDUser: ChatterID.ChatterIDUser) {
        if (agentCircuit != null) {
            val builder = android.app.AlertDialog.Builder(activity)
            builder.setMessage(getString(R.string.teleport_to_user_title)).setCancelable(true)
                .setPositiveButton("Yes") { dialogInterface, _ ->
                    dialogInterface.dismiss()
                    performTeleportTo(agentCircuit, chatterIDUser)
                }
                .setNegativeButton("No") { dialogInterface, _ -> dialogInterface.cancel() }
            builder.create().show()
        }
    }

    private fun handleUserAddFriend(agentCircuit: SLAgentCircuit, chatterIDUser: ChatterID.ChatterIDUser) {
        val textFieldDialogBuilder = TextFieldDialogBuilder(requireContext())
        textFieldDialogBuilder.setTitle(getString(R.string.offer_friendship_title))
        textFieldDialogBuilder.setDefaultText(getString(R.string.default_friendship_message))
        textFieldDialogBuilder.setOnTextEnteredListener(object : TextFieldDialogBuilder.OnTextEnteredListener {
            override fun onTextEntered(str: String) {
                agentCircuit.AddFriend(chatterIDUser.getChatterUUID(), str)
            }
        })
        textFieldDialogBuilder.show()
    }

    private fun handleUserCloseChat(chatterID: ChatterID?, z: Boolean) {
        if (chatterID == null) return
        val userManager = chatterID.getUserManager() ?: return
        val activeChattersManager = userManager.getChatterList().getActiveChattersManager()
        val z2 = z || chatterID.getChatterType() == ChatterID.ChatterType.Group
        activeChattersManager.markChatterInactive(chatterID, z2)
        if (this is ChatFragment) {
            val activity = activity
            if (activity is DetailsActivity && !activity.closeDetailsFragment(this) && activity is ChatNewActivity) {
                DetailsActivity.showDetails(activity, ChatFragmentActivityFactory.getInstance(), ChatFragment.makeSelection(ChatterID.getLocalChatterID(userManager.getUserID())))
            }
        }
    }

    private fun handleUserMute(chatterID: ChatterID?) {
        val userManager = this.userManager
        if (chatterID == null || userManager == null) {
            return
        }
        val retrievedName = this.nameRetriever?.getResolvedName()
        val resolvedName = retrievedName ?: getString(R.string.name_loading_title)
        val builder = android.app.AlertDialog.Builder(requireContext())
        builder.setTitle(getString(R.string.block_confirm_message, resolvedName)).setCancelable(true)
        val charSequenceArr: Array<CharSequence> = if (userManager.getActiveAgentCircuit() != null)
            arrayOf(getString(R.string.mute_action_description), getString(R.string.block_action_description))
        else
            arrayOf(getString(R.string.mute_action_description))
        val choice = AtomicInteger(0)
        builder.setSingleChoiceItems(charSequenceArr, 0) { _, i -> choice.set(i) }
        builder.setPositiveButton("OK") { dialogInterface, _ ->
            if (choice.get() == 0) {
                handleUserCloseChat(chatterID, true)
            } else if (choice.get() == 1) {
                val activeAgentCircuit = userManager.getActiveAgentCircuit()
                if (activeAgentCircuit != null) {
                    if (chatterID is ChatterID.ChatterIDUser) {
                        activeAgentCircuit.getModules().muteList.Block(MuteListEntry(MuteType.AGENT, chatterID.getChatterUUID(), resolvedName, 15))
                    } else if (chatterID is ChatterID.ChatterIDGroup) {
                        activeAgentCircuit.getModules().muteList.Block(MuteListEntry(MuteType.GROUP, chatterID.getChatterUUID(), resolvedName, 15))
                    }
                }
                handleUserCloseChat(chatterID, true)
            }
        }
        builder.setNegativeButton("Cancel") { dialogInterface, _ -> dialogInterface.cancel() }
        builder.create().show()
    }

    private fun handleUserOfferTeleport(userManager: UserManager, agentCircuit: SLAgentCircuit, chatterIDUser: ChatterID.ChatterIDUser) {
        val currentLocationInfoSnapshot = userManager.getCurrentLocationInfoSnapshot()
        var str = ""
        if (currentLocationInfoSnapshot != null) {
            val parcelData = currentLocationInfoSnapshot.parcelData()
            if (parcelData != null) {
                str = Strings.nullToEmpty(parcelData.getName())
            }
        }
        val textFieldDialogBuilder = TextFieldDialogBuilder(requireContext())
        textFieldDialogBuilder.setTitle(getString(R.string.offer_teleport_title))
        textFieldDialogBuilder.setDefaultText("Join me in $str")
        textFieldDialogBuilder.setOnTextEnteredListener(object : TextFieldDialogBuilder.OnTextEnteredListener {
            override fun onTextEntered(str2: String) {
                agentCircuit.OfferTeleport(chatterIDUser.getChatterUUID(), str2)
            }
        })
        textFieldDialogBuilder.show()
    }

    private fun handleUserOpenChat(chatterID: ChatterID?) {
        DetailsActivity.showDetails(activity, ChatFragmentActivityFactory.getInstance(), ChatFragment.makeSelection(chatterID))
    }

    private fun handleUserPayUser(chatterIDUser: ChatterID.ChatterIDUser) {
        val activity = activity ?: return
        DetailsActivity.showEmbeddedDetails(activity, PayUserFragment::class.java, PayUserFragment.makeSelection(chatterIDUser))
    }

    private fun handleUserRemoveFriend(agentCircuit: SLAgentCircuit, chatterIDUser: ChatterID.ChatterIDUser) {
        val builder = android.app.AlertDialog.Builder(requireContext())
        val resolvedName = this.nameRetriever?.getResolvedName() ?: getString(R.string.name_loading_title)
        builder.setMessage(String.format(getString(R.string.delete_friend_title_format), resolvedName)).setCancelable(true)
            .setPositiveButton("Yes") { dialogInterface, _ ->
                dialogInterface.dismiss()
                agentCircuit.RemoveFriend(chatterIDUser.getChatterUUID())
            }
            .setNegativeButton("No") { dialogInterface, _ -> dialogInterface.cancel() }
        builder.create().show()
    }

    private fun handleUserRequestTeleport(agentCircuit: SLAgentCircuit, chatterIDUser: ChatterID.ChatterIDUser) {
        val textFieldDialogBuilder = TextFieldDialogBuilder(requireContext())
        textFieldDialogBuilder.setTitle(getString(R.string.request_teleport_title))
        textFieldDialogBuilder.setOnTextEnteredListener(object : TextFieldDialogBuilder.OnTextEnteredListener {
            override fun onTextEntered(str: String) {
                agentCircuit.RequestTeleport(chatterIDUser.getChatterUUID(), str)
            }
        })
        textFieldDialogBuilder.show()
    }

    private fun handleUserShareObject(chatterIDUser: ChatterID.ChatterIDUser) {
        startActivity(InventoryActivity.makeTransferIntent(context, chatterIDUser.agentUUID, chatterIDUser.getChatterUUID(), this.nameRetriever?.getResolvedName()))
    }

    private fun handleUserUnblock(chatterID: ChatterID?) {
        val userManager = this.userManager
        if (chatterID == null || userManager == null) {
            return
        }
        val retrievedName = this.nameRetriever?.getResolvedName()
        val resolvedName = retrievedName ?: getString(R.string.name_loading_title)
        android.app.AlertDialog.Builder(requireContext()).setMessage(getString(R.string.unblock_confirm_message, resolvedName)).setCancelable(true)
            .setPositiveButton("Yes") { dialogInterface, _ ->
                dialogInterface.dismiss()
                userManager.getChatterList().getActiveChattersManager().unmuteChatter(chatterID)
                val activeAgentCircuit = userManager.getActiveAgentCircuit()
                if (activeAgentCircuit != null) {
                    if (chatterID is ChatterID.ChatterIDUser) {
                        activeAgentCircuit.getModules().muteList.Unblock(MuteListEntry(MuteType.AGENT, chatterID.getChatterUUID(), resolvedName, 15))
                    } else if (chatterID is ChatterID.ChatterIDGroup) {
                        activeAgentCircuit.getModules().muteList.Unblock(MuteListEntry(MuteType.GROUP, chatterID.getChatterUUID(), resolvedName, 15))
                    }
                }
            }
            .setNegativeButton("No") { dialogInterface, _ -> dialogInterface.cancel() }
            .create().show()
    }

    private fun handleUserUnmute(chatterID: ChatterID?) {
        val userManager = this.userManager
        if (chatterID == null || userManager == null) {
            return
        }
        userManager.getChatterList().getActiveChattersManager().unmuteChatter(chatterID)
    }

    private fun handleViewLocationDetails() {
        val userManager = this.userManager ?: return
        val currentLocationInfoSnapshot = userManager.getCurrentLocationInfoSnapshot() ?: return
        val parcelData = currentLocationInfoSnapshot.parcelData() ?: return
        val activity = activity ?: return
        DetailsActivity.showEmbeddedDetails(activity, ParcelPropertiesFragment::class.java, ParcelPropertiesFragment.makeSelection(userManager.getUserID(), parcelData))
    }

    private fun performTeleportTo(agentCircuit: SLAgentCircuit?, chatterIDUser: ChatterID.ChatterIDUser) {
        if (agentCircuit != null) {
            val nearbyAgentLocation = agentCircuit.getModules().minimap.getNearbyAgentLocation(chatterIDUser.getChatterUUID())
            if (nearbyAgentLocation != null) {
                if (agentCircuit.TeleportToLocalPosition(nearbyAgentLocation)) {
                    TeleportProgressDialog(requireContext(), this.userManager, R.string.teleporting_progress_message).show()
                }
            } else if (agentCircuit.getModules().worldMap.TeleportToAgent(chatterIDUser.getChatterUUID())) {
                TeleportProgressDialog(requireContext(), this.userManager, R.string.teleporting_progress_message).show()
            }
        }
    }

    protected fun handleStartVoice(chatterID: ChatterID?) {
        val userManager = chatterID?.getUserManager()
        val activeAgentCircuit = userManager?.getActiveAgentCircuit()
        if (chatterID == null || userManager == null || activeAgentCircuit == null) {
            return
        }
        if (chatterID.getChatterType() == ChatterID.ChatterType.User) {
            activeAgentCircuit.getModules().voice.userVoiceChatRequest(chatterID.getOptionalChatterUUID())
            return
        }
        if (chatterID.getChatterType() == ChatterID.ChatterType.Group) {
            activeAgentCircuit.getModules().voice.groupVoiceChatRequest(chatterID.getOptionalChatterUUID())
        } else {
            if (chatterID.getChatterType() != ChatterID.ChatterType.Local) {
                return
            }
            val currentLocationInfoSnapshot = userManager.getCurrentLocationInfoSnapshot() ?: return
            val parcelVoiceChannel = currentLocationInfoSnapshot.parcelVoiceChannel() ?: return
            activeAgentCircuit.getModules().voice.nearbyVoiceChatRequest(parcelVoiceChannel)
        }
    }

    protected fun handleUserViewProfile(chatterID: ChatterID?) {
        if (chatterID == null || !chatterID.isValidUUID()) {
            return
        }
        val activity = activity ?: return
        when (chatterID.getChatterType()) {
            ChatterID.ChatterType.Group -> DetailsActivity.showEmbeddedDetails(activity, GroupProfileFragment::class.java, GroupProfileFragment.makeSelection(chatterID))
            ChatterID.ChatterType.User -> DetailsActivity.showEmbeddedDetails(activity, UserProfileFragment::class.java, UserProfileFragment.makeSelection(chatterID))
            else -> {}
        }
    }

    protected fun isVoiceLoggedIn(): Boolean {
        val data = this.voiceLoggedIn.getData()
        if (data != null) {
            return data
        }
        return false
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
    }

    override fun onCreateOptionsMenu(menu: Menu, menuInflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater.inflate(R.menu.user_list_context_menu, menu)
    }

    @CallSuper
    open fun onCurrentLocationChanged(currentLocationInfo: CurrentLocationInfo?) {
        activity?.supportInvalidateOptionsMenu()
    }

    @EventHandler
    fun onGlobalOptionsChanged(globalOptionsChangedEvent: GlobalOptions.GlobalOptionsChangedEvent) {
        activity?.supportInvalidateOptionsMenu()
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        val chatterID = this.chatterID
        val userManager = chatterID?.getUserManager()
        if (chatterID != null && userManager != null) {
            val activeAgentCircuit = userManager.getActiveAgentCircuit()
            when (menuItem.itemId) {
                R.id.item_close -> {
                    if (chatterID is ChatterID.ChatterIDUser || chatterID is ChatterID.ChatterIDGroup) {
                        handleUserCloseChat(chatterID, false)
                    }
                    return true
                }
                R.id.item_unmute -> {
                    if (chatterID is ChatterID.ChatterIDUser || chatterID is ChatterID.ChatterIDGroup) {
                        handleUserUnmute(chatterID)
                    }
                    return true
                }
                R.id.item_close_and_mute -> {
                    if (chatterID is ChatterID.ChatterIDUser || chatterID is ChatterID.ChatterIDGroup) {
                        handleUserMute(chatterID)
                    }
                    return true
                }
                R.id.item_open_chat -> {
                    handleUserOpenChat(chatterID)
                    return true
                }
                R.id.item_view_profile -> {
                    handleUserViewProfile(chatterID)
                    return true
                }
                R.id.item_start_voice -> {
                    handleStartVoice(chatterID)
                    return true
                }
                R.id.item_location_details -> {
                    handleViewLocationDetails()
                    return true
                }
                R.id.item_play_parcel_media -> {
                    handlePlayParcelMedia()
                    return true
                }
                R.id.item_send_group_notice -> {
                    val activity = activity
                    if (activity != null) {
                        DetailsActivity.showEmbeddedDetails(activity, GroupNoticeFragment::class.java, GroupNoticeFragment.makeSelection(chatterID))
                    }
                    return true
                }
                R.id.item_offer_teleport -> {
                    if (chatterID is ChatterID.ChatterIDUser && activeAgentCircuit != null) {
                        handleUserOfferTeleport(userManager, activeAgentCircuit, chatterID)
                    }
                    return true
                }
                R.id.item_request_teleport -> {
                    if (chatterID is ChatterID.ChatterIDUser && activeAgentCircuit != null) {
                        handleUserRequestTeleport(activeAgentCircuit, chatterID)
                    }
                    return true
                }
                R.id.item_teleport_to -> {
                    if (chatterID is ChatterID.ChatterIDUser && activeAgentCircuit != null) {
                        handleTeleportTo(activeAgentCircuit, chatterID)
                    }
                    return true
                }
                R.id.item_pay_user -> {
                    if (chatterID is ChatterID.ChatterIDUser && activeAgentCircuit != null) {
                        handleUserPayUser(chatterID)
                    }
                    return true
                }
                R.id.item_share_object -> {
                    if (chatterID is ChatterID.ChatterIDUser && activeAgentCircuit != null) {
                        handleUserShareObject(chatterID)
                    }
                    return true
                }
                R.id.item_add_friend -> {
                    if (chatterID is ChatterID.ChatterIDUser && activeAgentCircuit != null) {
                        handleUserAddFriend(activeAgentCircuit, chatterID)
                    }
                    return true
                }
                R.id.item_remove_friend -> {
                    if (chatterID is ChatterID.ChatterIDUser && activeAgentCircuit != null) {
                        handleUserRemoveFriend(activeAgentCircuit, chatterID)
                    }
                    return true
                }
                R.id.item_enable_voice -> {
                    handleEnableVoice()
                    return true
                }
                R.id.item_unblock -> {
                    if (chatterID is ChatterID.ChatterIDUser || chatterID is ChatterID.ChatterIDGroup) {
                        handleUserUnblock(chatterID)
                    }
                    return true
                }
            }
        }
        return super.onOptionsItemSelected(menuItem)
    }

    override fun onPrepareOptionsMenu(menu: Menu) {
        super.onPrepareOptionsMenu(menu)
        val iArr = intArrayOf(
            R.id.item_open_chat, R.id.item_view_profile, R.id.item_location_details, R.id.item_play_parcel_media,
            R.id.item_send_group_notice, R.id.item_offer_teleport, R.id.item_request_teleport, R.id.item_teleport_to,
            R.id.item_pay_user, R.id.item_share_object, R.id.item_add_friend, R.id.item_remove_friend, R.id.item_close,
            R.id.item_close_and_mute, R.id.item_unmute, R.id.item_unblock, R.id.item_start_voice, R.id.item_enable_voice
        )
        val chatterID = this.chatterID
        val userManager = chatterID?.getUserManager()
        if (chatterID == null || userManager == null) {
            for (i in iArr) {
                menu.findItem(i)?.isVisible = false
            }
            return
        }
        Debug.Printf("UserMenu: item type %s", chatterID.getChatterType())
        val activeAgentCircuit = userManager.getActiveAgentCircuit()
        val data = this.currentLocationInfo.getData()
        val z4 = activeAgentCircuit != null
        val z5 = chatterID is ChatterID.ChatterIDLocal
        val z6 = chatterID is ChatterID.ChatterIDUser
        val z7 = chatterID is ChatterID.ChatterIDGroup
        var z8: Boolean
        var z9 = false
        var z10 = false
        val voiceEnabled = GlobalOptions.getInstance().getVoiceEnabled()
        val isVoiceLoggedIn = isVoiceLoggedIn()
        var z11 = false
        val showEnableVoice = !voiceEnabled
        val z: Boolean
        val z2: Boolean
        if (!z5 || data == null) {
            z = showEnableVoice
            z2 = false
        } else {
            val parcelData = data.parcelData()
            if (parcelData != null) {
                z9 = true
                z10 = !Strings.isNullOrEmpty(parcelData.getMediaURL())
            }
            z11 = voiceEnabled && isVoiceLoggedIn && data.parcelVoiceChannel() != null
            if (!showEnableVoice || data.parcelVoiceChannel() == null) {
                z = false
                z2 = z9
            } else {
                z = true
                z2 = z9
            }
        }
        if (z7 || z6) {
            z11 = if (voiceEnabled) isVoiceLoggedIn else false
        }
        val friend = if (z6) userManager.getChatterList().getFriendManager().getFriend(chatterID.getOptionalChatterUUID()) else null
        var z12 = false
        val z3: Boolean
        if (z6 || z7) {
            val chatter = userManager.getChatterList().getActiveChattersManager().getChatter(chatterID)
            z12 = if (chatter != null) chatter.getActive() else false
            val muted = if (chatter != null) chatter.getMuted() else false
            if (activeAgentCircuit != null) {
                z8 = activeAgentCircuit.getModules().muteList.isMuted(chatterID.getOptionalChatterUUID(), if (z7) MuteType.GROUP else MuteType.AGENT)
                z3 = muted
            } else {
                z8 = false
                z3 = muted
            }
        } else {
            z8 = false
            z3 = false
        }
        val z13 = z6 && friend != null
        val isInstance = this is ChatFragment
        val isInstance2 = if (z6) this is UserProfileFragment else if (z7) this is GroupProfileFragment else false
        val canTeleportToLocation = if (z6 && z4) activeAgentCircuit!!.getModules().rlvController.canTeleportToLocation() else false
        var z14 = false
        if (z6 && z4 && canTeleportToLocation) {
            z14 = activeAgentCircuit!!.getModules().minimap.getNearbyAgentLocation(chatterID.getOptionalChatterUUID()) != null
            if (friend != null) {
                z14 = z14 || (friend.getRightsHas() and 2) != 0
            }
        }
        val z15: Boolean = if (z7) {
            if (!z4) {
                false
            } else {
                val avatarGroupList = userManager.getChatterList().getGroupManager().getAvatarGroupList()
                val avatarGroupEntry = avatarGroupList?.Groups?.get(chatterID.getOptionalChatterUUID())
                avatarGroupEntry != null && (avatarGroupEntry.GroupPowers and SLGroupInfo.GP_NOTICES_SEND) != 0
            }
        } else {
            false
        }
        for (i4 in iArr) {
            val findItem2 = menu.findItem(i4)
            if (findItem2 != null) {
                when (i4) {
                    R.id.item_close -> findItem2.isVisible = if ((z6 || z7) && isInstance) z12 else false
                    R.id.item_unmute -> findItem2.isVisible = if ((z6 || z7) && z3) !z8 else false
                    R.id.item_close_and_mute -> findItem2.isVisible = if ((z6 || z7) && isInstance && z12) !(if (z3) z8 else false) else false
                    R.id.item_open_chat -> findItem2.isVisible = if (z6 || z7) !isInstance else false
                    R.id.item_view_profile -> findItem2.isVisible = if (z6 || z7) !isInstance2 else false
                    R.id.item_start_voice -> findItem2.isVisible = if (z4) z11 else false
                    R.id.item_location_details -> findItem2.isVisible = if (z5) z2 else false
                    R.id.item_play_parcel_media -> findItem2.isVisible = if (z5 && z2) z10 else false
                    R.id.item_send_group_notice -> findItem2.isVisible = if (z7 && z4) z15 else false
                    R.id.item_offer_teleport -> findItem2.isVisible = if (z6) z4 else false
                    R.id.item_request_teleport -> findItem2.isVisible = if (z6) z4 else false
                    R.id.item_teleport_to -> findItem2.isVisible = if (z6 && z4 && canTeleportToLocation) z14 else false
                    R.id.item_pay_user -> findItem2.isVisible = if (z6) z4 else false
                    R.id.item_share_object -> findItem2.isVisible = if (z6) z4 else false
                    R.id.item_add_friend -> findItem2.isVisible = if (z6 && z4) !z13 else false
                    R.id.item_remove_friend -> findItem2.isVisible = if (z6 && z4) z13 else false
                    R.id.item_enable_voice -> findItem2.isVisible = z
                    R.id.item_unblock -> findItem2.isVisible = if ((z6 || z7) && z8) z4 else false
                }
            }
        }
    }

    override fun onStart() {
        super.onStart()
        val userManager = this.chatterID?.getUserManager()
        if (userManager != null) {
            this.voiceLoggedIn.subscribe(userManager.getVoiceLoggedIn(), SubscriptionSingleKey.Value)
            this.currentLocationInfo.subscribe(userManager.getCurrentLocationInfo(), SubscriptionSingleKey.Value)
        } else {
            this.voiceLoggedIn.unsubscribe()
            this.currentLocationInfo.unsubscribe()
        }
        EventBus.getInstance().subscribe(this)
    }

    override fun onStop() {
        this.voiceLoggedIn.unsubscribe()
        this.currentLocationInfo.unsubscribe()
        EventBus.getInstance().unsubscribe(this)
        super.onStop()
    }

    @CallSuper
    open fun onVoiceLoginStatusChanged(bool: Boolean?) {
        activity?.supportInvalidateOptionsMenu()
    }
}
