package com.lumiyaviewer.lumiya.ui.myava;

import android.annotation.SuppressLint;
import android.text.format.DateUtils;
import android.view.View;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.MoneyTransaction;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer;
import java.util.Calendar;

/* loaded from: classes.dex */
class TransactionViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

    @BindView(R.id.amountTextView)
    TextView amountTextView;
    private Calendar calendar;
    private final ChatterNameDisplayer chatterNameDisplayer;

    @BindView(R.id.finalBalanceTextView)
    TextView finalBalanceTextView;
    private MoneyTransaction moneyTransaction;

    @BindView(R.id.timeStampTextView)
    TextView timestampTextView;

    @BindView(R.id.user_name)
    TextView userName;

    @BindView(R.id.userPicView)
    ChatterPicView userPicView;
    private final TransactionLogAdapter adapter;

    TransactionViewHolder(TransactionLogAdapter transactionLogAdapter, View view) {
        super(view);
        this.adapter = transactionLogAdapter;
        this.chatterNameDisplayer = new ChatterNameDisplayer();
        ButterKnife.bind(this, view);
        this.chatterNameDisplayer.bindViews(this.userName, this.userPicView);
        view.setOnClickListener(this);
        this.calendar = Calendar.getInstance();
    }

    @SuppressLint({"DefaultLocale", "SetTextI18n"})
    void bindToData(MoneyTransaction moneyTransaction) {
        this.moneyTransaction = moneyTransaction;
        this.chatterNameDisplayer.setChatterID(ChatterID.getUserChatterID(this.adapter.getAgentUUID(), moneyTransaction.getAgentUUID()));
        this.amountTextView.setText(this.adapter.getContext().getString(R.string.transaction_amount_format, Integer.valueOf(moneyTransaction.getTransactionAmount())));
        this.finalBalanceTextView.setText(this.adapter.getContext().getString(R.string.transaction_balance_amount, Integer.valueOf(moneyTransaction.getNewBalance())));
        this.calendar.setTime(moneyTransaction.getTimestamp());
        this.timestampTextView.setText(DateUtils.getRelativeTimeSpanString(this.adapter.getContext(), this.calendar.getTimeInMillis(), false));
    }

    @Override
    public void onClick(View view) {
        if (this.adapter.getOnTransactionClickListener() == null || this.moneyTransaction == null) {
            return;
        }
        this.adapter.getOnTransactionClickListener().onTransactionClicked(this.moneyTransaction);
    }

    void onRecycled() {
        this.chatterNameDisplayer.setChatterID(null);
        this.moneyTransaction = null;
    }
}
