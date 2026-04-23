.class public Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;


# instance fields
.field private final avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final isMyAvatar:Z


# direct methods
.method public constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Z)V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;-><init>()V

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    invoke-direct {v0, p1, p0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;Ljava/util/UUID;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    return-void
.end method


# virtual methods
.method public ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V

    return-void
.end method

.method public ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V

    return-void
.end method

.method public ApplyAvatarTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->ApplyTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)V

    return-void
.end method

.method public ApplyAvatarVisualParams([I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->ApplyVisualParams([I)V

    return-void
.end method

.method protected createDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V

    return-object v0
.end method

.method public getAvatarVisualState()Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "(my avatar)"

    return-object v0

    :cond_0
    const-string/jumbo v0, "(avatar)"

    return-object v0
.end method

.method public isAvatar()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isMyAvatar()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar:Z

    return v0
.end method

.method public onTexturesUpdate(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->avatarVisualState:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->ApplyTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)V

    return-void
.end method
