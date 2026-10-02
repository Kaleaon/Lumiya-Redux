package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.UserPickBinding
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.AvatarPickKey
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.TeleportProgressDialog
import com.lumiyaviewer.lumiya.ui.common.TextFieldDialogBuilder
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import java.util.UUID

open class UserPickFragment : FragmentWithTitle() {
    private static String PICK_ID_KEY = "pickID"

    private UserPickBinding binding

    private SubscriptionData<AvatarPickKey, PickInfoReply> pickInfo = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            UserPickFragment.this.onPickInfo((PickInfoReply) obj)
        }

        override fun onData(obj: Any) {

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
