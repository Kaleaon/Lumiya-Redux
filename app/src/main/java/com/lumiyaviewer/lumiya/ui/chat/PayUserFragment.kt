package com.lumiyaviewer.lumiya.ui.chat

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.TextView
import com.lumiyaviewer.lumiya.databinding.PayUserBinding
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity

open class PayUserFragment : ChatterFragment() {
    private ChatterNameDisplayer chatterNameDisplayer = ChatterNameDisplayer()
    private SubscriptionData<SubscriptionSingleKey, Integer> myBalance = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            PayUserFragment.this.onMyBalance((Integer) obj)
        }

        override fun onData(obj: Any) {
                this.binding.paymentDetailsBalance.setText(getString(R.string.object_balance_format, num))
                this.binding.paymentDetailsBalance.setVisibility(View.VISIBLE)
            }
        }
    }

    private fun payUser(i: Int, str: String) {
        ChatterID chatterID = this.chatterID
        internal fun if(ChatterID.ChatterIDUser: chatterID instanceof):  {
            String resolvedName = this.chatterNameDisplayer.getResolvedName(getContext())
            AlertDialog.Builder builder = new AlertDialog.Builder(getActivity())
            builder.setMessage(String.format(getString(R.string.user_pay_confirm), resolvedName, Integer.valueOf(i))).setCancelable(false).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    PayUserFragment.this.m434lambda$com_lumiyaviewer_lumiya_ui_chat_PayUserFragment_3721((ChatterID) chatterID, i, (String) str, dialogInterface, i2)
                }

                override fun onClick(dialogInterface: DialogInterface, i2: Int) {