.class public Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;


# instance fields
.field private alreadyUpdated:Z

.field private chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private nameTextView:Landroid/widget/TextView;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->alreadyUpdated:Z

    return-void
.end method

.method private clearViews()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v2, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private updateViews()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_2

    move-object v0, v1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v3, 0x7f0901c8

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->clearViews()V

    goto :goto_1
.end method


# virtual methods
.method public bindViews(Landroid/widget/TextView;Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;)V
    .locals 0
    .param p1    # Landroid/widget/TextView;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->updateViews()V

    return-void
.end method

.method public getChatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-object v0
.end method

.method public getResolvedName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    :goto_0
    return-object v0

    :cond_1
    const v0, 0x7f0901c8

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->alreadyUpdated:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->updateViews()V

    :cond_0
    return-void
.end method

.method public setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {p1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz p1, :cond_3

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->alreadyUpdated:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, p1, p0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->alreadyUpdated:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    const v1, 0x7f0901c8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v2, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->clearViews()V

    goto :goto_0
.end method

.method public unbindViews()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->nameTextView:Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->picView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    return-void
.end method
