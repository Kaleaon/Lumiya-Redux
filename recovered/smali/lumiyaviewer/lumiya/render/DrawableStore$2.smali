.class Lcom/lumiyaviewer/lumiya/render/DrawableStore$2;
.super Lcom/google/common/cache/CacheLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/DrawableStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/cache/CacheLoader",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;",
        "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/render/DrawableStore;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore$2;->this$0:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    invoke-direct {p0}, Lcom/google/common/cache/CacheLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public load(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->getAvatarVisualState()Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore$2;->this$0:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->createDrawableAvatarStub(Lcom/lumiyaviewer/lumiya/render/DrawableStore;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic load(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/DrawableStore$2;->load(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;

    move-result-object v0

    return-object v0
.end method
