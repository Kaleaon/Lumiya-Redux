.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;
.super Landroid/widget/BaseAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PicksAdapter"
.end annotation


# instance fields
.field private final inflater:Landroid/view/LayoutInflater;

.field private picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->inflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;->Data_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;->Data_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;->Data_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;

    return-object v0

    :cond_0
    return-object v1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->inflater:Landroid/view/LayoutInflater;

    const v1, 0x1090003

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;

    move-result-object v1

    if-eqz v1, :cond_1

    const v0, 0x1020014

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;->PickName:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-object p2
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method setData(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->picksReply:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->notifyDataSetChanged()V

    return-void
.end method
