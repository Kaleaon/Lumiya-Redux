package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.Context
import android.os.Bundle
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.AvatarPickKey
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.TextFieldEditFragment

open class PickDescriptionEditFragment : TextFieldEditFragment() {
    private static String AVATAR_PICK_KEY = "avatarPickKey"
    private SubscriptionData<AvatarPickKey, PickInfoReply> pickInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            PickDescriptionEditFragment.this.onPickInfoReply((PickInfoReply) obj)
        }

        override fun onData(obj: Any) {