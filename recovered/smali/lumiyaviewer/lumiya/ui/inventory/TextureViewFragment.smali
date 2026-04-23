.class public Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;
    }
.end annotation


# static fields
.field private static final ASSET_UUID_KEY:Ljava/lang/String; = "assetUUID"


# instance fields
.field private loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

.field private photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

.field private textureImageView:Landroid/widget/ImageView;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;)Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;)Luk/co/senab/photoview/PhotoViewAttacher;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;)Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->textureImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;)Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    return-object p1
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    return-void
.end method

.method public static makeArguments(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "assetUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p2    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const v0, 0x7f0400aa

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f1000bd

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v0, 0x7f100293

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->textureImageView:Landroid/widget/ImageView;

    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->textureImageView:Landroid/widget/ImageView;

    invoke-direct {v0, v2}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    return-object v1
.end method

.method public onStart()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "assetUUID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    invoke-virtual {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;->cancel(Z)Z

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    invoke-direct {v1, p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;-><init>(Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    new-array v2, v3, [Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_1
    return-void
.end method

.method public onStop()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;->cancel(Z)Z

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->loadAssetImageTask:Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment$LoadAssetImageTask;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->onStop()V

    return-void
.end method
