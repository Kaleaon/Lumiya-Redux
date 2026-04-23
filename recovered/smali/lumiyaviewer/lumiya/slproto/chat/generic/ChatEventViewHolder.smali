.class public Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;
    }
.end annotation


# instance fields
.field protected final adapter:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v7/widget/RecyclerView$Adapter;",
            ">;"
        }
    .end annotation
.end field

.field final bubbleView:Landroid/view/View;

.field final chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

.field final chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

.field final textView:Landroid/widget/TextView;

.field final timestampView:Landroid/widget/TextView;

.field private updateTimestamp:J


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->updateTimestamp:J

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->adapter:Ljava/lang/ref/WeakReference;

    const v0, 0x7f100125

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->timestampView:Landroid/widget/TextView;

    const v0, 0x7f100124

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->textView:Landroid/widget/TextView;

    const v0, 0x7f100123

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->bubbleView:Landroid/view/View;

    const v0, 0x7f100122

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v0, 0x7f100126

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    instance-of v0, p2, Lcom/lumiyaviewer/lumiya/ui/chat/HasUserPicClickHandler;

    if-eqz v0, :cond_1

    check-cast p2, Lcom/lumiyaviewer/lumiya/ui/chat/HasUserPicClickHandler;

    invoke-interface {p2}, Lcom/lumiyaviewer/lumiya/ui/chat/HasUserPicClickHandler;->getUserPicClickListener()Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-void
.end method


# virtual methods
.method requestAdapterUpdate()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->adapter:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    :cond_0
    return-void
.end method

.method setupTimestampUpdate(Landroid/content/Context;J)V
    .locals 0

    iput-wide p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->updateTimestamp:J

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->updateTimestamp(Landroid/content/Context;)V

    return-void
.end method

.method public updateTimestamp(Landroid/content/Context;)V
    .locals 7

    const-wide/32 v4, 0xea60

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->timestampView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->updateTimestamp:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->updateTimestamp:J

    add-long/2addr v0, v4

    cmp-long v0, v2, v0

    if-gez v0, :cond_1

    const v0, 0x7f09020e

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->timestampView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->timestampView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->updateTimestamp:J

    const/high16 v6, 0x40000

    invoke-static/range {v0 .. v6}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->timestampView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method
