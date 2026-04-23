.class Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TransactionViewHolder"
.end annotation


# instance fields
.field amountTextView:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10029f
    .end annotation
.end field

.field private calendar:Ljava/util/Calendar;

.field private final chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

.field finalBalanceTextView:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002a0
    .end annotation
.end field

.field private moneyTransaction:Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

.field timestampTextView:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10029d
    .end annotation
.end field

.field userName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10029e
    .end annotation
.end field

.field userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10013f
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;Landroid/view/View;)V
    .locals 3

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-static {p0, p2}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->userName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->bindViews(Landroid/widget/TextView;Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->calendar:Ljava/util/Calendar;

    return-void
.end method


# virtual methods
.method bindToData(Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale",
            "SetTextI18n"
        }
    .end annotation

    const/4 v5, 0x1

    const/4 v4, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->moneyTransaction:Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->-get0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->getAgentUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->amountTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->-get1(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Landroid/content/Context;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->getTransactionAmount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const v3, 0x7f090359

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->finalBalanceTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->-get1(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Landroid/content/Context;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->getNewBalance()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const v3, 0x7f09035c

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->calendar:Ljava/util/Calendar;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->getTimestamp()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->timestampTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->-get1(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->calendar:Ljava/util/Calendar;

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-static {v1, v2, v3, v4}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(Landroid/content/Context;JZ)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->-get2(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->moneyTransaction:Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->-get2(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->moneyTransaction:Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;->onTransactionClicked(Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;)V

    :cond_0
    return-void
.end method

.method onRecycled()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->moneyTransaction:Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    return-void
.end method
