.class public Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;
.super Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;


# instance fields
.field private drawableAvatar:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;",
            ">;"
        }
    .end annotation
.end field

.field private drawableAvatarStub:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;",
            ">;"
        }
    .end annotation
.end field

.field private final objectAvatarInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->drawableAvatar:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->drawableAvatarStub:Ljava/lang/ref/WeakReference;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->objectAvatarInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    return-void
.end method


# virtual methods
.method public addToDrawList(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarCountLimit:I

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->objectAvatarInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->drawableAvatar:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    :cond_1
    if-nez v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->drawableAvatarCache:Lcom/google/common/cache/LoadingCache;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->objectAvatarInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-interface {v0, v1}, Lcom/google/common/cache/LoadingCache;->getUnchecked(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->drawableAvatar:Ljava/lang/ref/WeakReference;

    :cond_2
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->objectAvatarInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v1

    if-eqz v1, :cond_3

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    :cond_3
    :goto_0
    return-void

    :cond_4
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->drawableAvatarStub:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;

    :cond_5
    if-nez v0, :cond_6

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->drawableAvatarStubCache:Lcom/google/common/cache/LoadingCache;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->objectAvatarInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-interface {v0, v1}, Lcom/google/common/cache/LoadingCache;->getUnchecked(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->drawableAvatarStub:Ljava/lang/ref/WeakReference;

    :cond_6
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarStubs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getObjectAvatarInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->objectAvatarInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    return-object v0
.end method
