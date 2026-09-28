package com.lumiyaviewer.lumiya.ui.myava

import android.annotation.SuppressLint
import android.content.Context
import androidx.recyclerview.widget.RecyclerView
import android.text.format.DateUtils
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.lumiyaviewer.lumiya.dao.MoneyTransaction
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer
import de.greenrobot.dao.query.LazyList
import java.util.Calendar
import java.util.UUID

open class TransactionLogAdapter : RecyclerView.Adapter<TransactionLogAdapter.TransactionViewHolder>() {
    private UUID agentUUID
    private Context context

    private LazyList<MoneyTransaction> data
    private LayoutInflater inflater
    private OnTransactionClickListener onTransactionClickListener

    internal interface OnTransactionClickListener {
        fun onTransactionClicked(moneyTransaction: MoneyTransaction)
    }

    internal open class TransactionViewHolder : RecyclerView.ViewHolder(), View.OnClickListener {
        TextView amountTextView
        private Calendar calendar
        private ChatterNameDisplayer chatterNameDisplayer
        TextView finalBalanceTextView
        private MoneyTransaction moneyTransaction
        TextView timestampTextView
        TextView userName
        ChatterPicView userPicView

        internal constructor(view: View) {
            super(view)
            this.chatterNameDisplayer = ChatterNameDisplayer()
            this.userName = view.findViewById(com.lumiyaviewer.lumiya.R.id.user_name)
            this.userPicView = view.findViewById(com.lumiyaviewer.lumiya.R.id.userPicView)
            this.timestampTextView = view.findViewById(com.lumiyaviewer.lumiya.R.id.timeStampTextView)
            this.amountTextView = view.findViewById(com.lumiyaviewer.lumiya.R.id.amountTextView)
            this.finalBalanceTextView = view.findViewById(com.lumiyaviewer.lumiya.R.id.finalBalanceTextView)
            this.chatterNameDisplayer.bindViews(this.userName, this.userPicView)
            view.setOnClickListener(this)
            this.calendar = Calendar.getInstance()
        }

        @SuppressLint({"DefaultLocale", "SetTextI18n"})
        internal fun bindToData(moneyTransaction: MoneyTransaction) {
            this.moneyTransaction = moneyTransaction
            this.chatterNameDisplayer.setChatterID(ChatterID.getUserChatterID(TransactionLogAdapter.this.agentUUID, moneyTransaction.getAgentUUID()))
            this.amountTextView.setText(TransactionLogAdapter.this.context.getString(com.lumiyaviewer.lumiya.R.string.transaction_amount_format, Integer.valueOf(moneyTransaction.getTransactionAmount())))
            this.finalBalanceTextView.setText(TransactionLogAdapter.this.context.getString(com.lumiyaviewer.lumiya.R.string.transaction_balance_amount, Integer.valueOf(moneyTransaction.getNewBalance())))
            this.calendar.setTime(moneyTransaction.getTimestamp())
            this.timestampTextView.setText(DateUtils.getRelativeTimeSpanString(TransactionLogAdapter.this.context, this.calendar.getTimeInMillis(), false))
        }

        override fun onClick(view: View) {
            if (TransactionLogAdapter.this.onTransactionClickListener == null || this.moneyTransaction == null) {
                return
            }
            TransactionLogAdapter.this.onTransactionClickListener.onTransactionClicked(this.moneyTransaction)
        }

        internal fun onRecycled() {
            this.chatterNameDisplayer.setChatterID(null)
            this.moneyTransaction = null
        }
    }

    internal constructor(context: Context, uuid: UUID, onTransactionClickListener: OnTransactionClickListener) {
        this.context = context
        this.agentUUID = uuid
        this.inflater = LayoutInflater.from(context)
        this.onTransactionClickListener = onTransactionClickListener
        setHasStableIds(true)
    }

    override fun getItemCount(): Int {
        if (this.data != null) {
            return this.data.size()
        }
        return 0
    }

    override fun getItemId(i: Int): Long {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return -1L
        }
        return this.data.get(i).getId().longValue()
    }

    override fun onBindViewHolder(transactionViewHolder: TransactionViewHolder, i: Int) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return
        }
        transactionViewHolder.bindToData(this.data.get(i))
    }

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): TransactionViewHolder {
        return TransactionViewHolder(this.inflater.inflate(com.lumiyaviewer.lumiya.R.layout.transaction_log_item, viewGroup, false))
    }

    override fun onViewRecycled(transactionViewHolder: TransactionViewHolder) {
        transactionViewHolder.onRecycled()
    }

    open fun setData(lazyList: LazyList<MoneyTransaction>) {
        this.data = lazyList
        notifyDataSetChanged()
    }
}
