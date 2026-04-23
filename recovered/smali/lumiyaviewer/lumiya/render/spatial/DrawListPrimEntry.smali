.class public Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;
.super Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;


# instance fields
.field private volatile drawableObject:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->drawableObject:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public addToDrawList(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->drawableObject:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    :goto_0
    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-direct {v0, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->drawableObject:Ljava/lang/ref/WeakReference;

    :cond_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public getDrawableAttachment(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)Lcom/lumiyaviewer/lumiya/render/DrawableObject;
    .locals 2
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->drawableObject:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    :cond_0
    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-direct {v0, p1, v1, p2}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->drawableObject:Ljava/lang/ref/WeakReference;

    :cond_1
    return-object v0
.end method

.method public getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->drawableObject:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    :cond_0
    return-object v0
.end method
