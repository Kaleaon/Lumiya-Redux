.class Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OnlineFriendsHeaderRow"
.end annotation


# instance fields
.field private isAnyoneOnline:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;->isAnyoneOnline:Z

    return-void
.end method


# virtual methods
.method public getView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;->isAnyoneOnline:Z

    if-eqz v0, :cond_2

    const v0, 0x7f1001c4

    :goto_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;->isAnyoneOnline:Z

    if-eqz v2, :cond_3

    const v2, 0x7f040056

    :goto_1
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v3

    if-ne v3, v0, :cond_0

    move-object v1, p2

    :cond_0
    if-nez v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p1, v2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    :cond_1
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;->isAnyoneOnline:Z

    if-eqz v2, :cond_4

    const v2, 0x7f090125

    :goto_2
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    return-object v1

    :cond_2
    const v0, 0x7f1001c5

    goto :goto_0

    :cond_3
    const v2, 0x7f040057

    goto :goto_1

    :cond_4
    const v2, 0x7f0901df

    goto :goto_2
.end method

.method public setAnyoneOnline(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;->isAnyoneOnline:Z

    return-void
.end method
