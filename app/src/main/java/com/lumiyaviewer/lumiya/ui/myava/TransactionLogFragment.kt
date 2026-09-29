package com.lumiyaviewer.lumiya.ui.myava

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.recyclerview.widget.RecyclerView
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.TransactionLogBinding
import com.lumiyaviewer.lumiya.dao.MoneyTransaction
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.ui.myava.TransactionLogAdapter
import de.greenrobot.dao.query.LazyList
import java.util.UUID

open class TransactionLogFragment : FragmentWithTitle(), LoadableMonitor.OnLoadableDataChangedListener, TransactionLogAdapter.OnTransactionClickListener {
    private TransactionLogAdapter adapter
    private TransactionLogBinding binding
    private SubscriptionData<SubscriptionSingleKey, LazyList<MoneyTransaction>> moneyTransactions = SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.moneyTransactions).withDataChangedListener(this)
    private boolean scrollToBottomRunnablePosted = false
    private Handler mHandler = Handler(Looper.getMainLooper())
    private Runnable scrollToBottomRunnable = Runnable() {
        override fun run() {
            int itemCount
            TransactionLogFragment.this.scrollToBottomRunnablePosted = false
            if (TransactionLogFragment.this.binding != null) {
                RecyclerView recyclerView = TransactionLogFragment.this.binding.transactionLogView
                if (recyclerView.hasPendingAdapterUpdates()) {
                    TransactionLogFragment.this.scrollToBottomRunnablePosted = true
                    TransactionLogFragment.this.mHandler.post(TransactionLogFragment.this.scrollToBottomRunnable)
                } else {
                    if (TransactionLogFragment.this.adapter == null || (itemCount = TransactionLogFragment.this.adapter.getItemCount()) <= 0) {
                        return
                    }
                    recyclerView.scrollToPosition(itemCount - 1)
                }
            }
        }
    }

    private fun clearTransactionLog() {
        AlertDialog.Builder builder = AlertDialog.Builder(getActivity())
        builder.setMessage(R.string.clear_transaction_log_message).setCancelable(true).setPositiveButton("Yes", DialogInterface.OnClickListener() {
                TransactionLogFragment.this.m675xf57d8a84(dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {