.class Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SearchViewHolder"
.end annotation


# instance fields
.field private chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field resultItemName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10027f
    .end annotation
.end field

.field resultMemberCount:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100280
    .end annotation
.end field

.field private searchGridResult:Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

.field userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10013f
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-static {p0, p2}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method bindToData(Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale",
            "SetTextI18n"
        }
    .end annotation

    const/16 v4, 0x8

    const/4 v3, 0x0

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->searchGridResult:Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->resultItemName:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemType()I

    move-result v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v2

    if-ne v0, v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getMemberCount()Ljava/lang/Integer;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->resultMemberCount:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->resultMemberCount:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemType()I

    move-result v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v2

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;->-get0(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;)Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    :goto_2
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->resultMemberCount:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemType()I

    move-result v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v2

    if-ne v0, v2, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;->-get0(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;)Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v2, v0, p0, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    goto :goto_2
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-ne p1, v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->resultItemName:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;->-get1(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;)Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$OnSearchResultClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->searchGridResult:Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;->-get1(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;)Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$OnSearchResultClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->searchGridResult:Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$OnSearchResultClickListener;->onSearchResultClicked(Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;)V

    :cond_0
    return-void
.end method

.method onRecycled()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$SearchViewHolder;->searchGridResult:Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    return-void
.end method
