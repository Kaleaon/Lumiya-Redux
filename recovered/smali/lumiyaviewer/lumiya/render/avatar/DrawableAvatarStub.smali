.class public Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;


# instance fields
.field final avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

.field private final chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field volatile drawableNameTag:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

.field protected final drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

.field private volatile nameTag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    return-void
.end method

.method private setNameTag(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->nameTag:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->nameTag:Ljava/lang/String;

    const-string/jumbo v1, "DrawableAvatar: setting: nameTag = %s"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    if-eqz p1, :cond_1

    move-object v0, p1

    :goto_0
    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    const/high16 v2, -0x80000000

    invoke-direct {v0, v1, p1, v2}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->drawableNameTag:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    :cond_0
    return-void

    :cond_1
    const-string/jumbo v0, "null"

    goto :goto_0
.end method


# virtual methods
.method public DrawNameTag(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 9

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->drawableNameTag:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->getWorldMatrix(Lcom/lumiyaviewer/lumiya/render/RenderContext;)[F

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    const/16 v2, 0xc

    aget v2, v1, v2

    const/16 v3, 0xd

    aget v3, v1, v3

    const/16 v4, 0xe

    aget v1, v1, v4

    const/high16 v4, 0x3f400000    # 0.75f

    add-float/2addr v4, v1

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    const/high16 v5, 0x3f000000    # 0.5f

    move-object v1, p1

    move v8, v7

    invoke-virtual/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->DrawAtWorld(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFFLcom/lumiyaviewer/lumiya/render/MatrixStack;ZI)V

    :cond_0
    return-void
.end method

.method getWorldMatrix(Lcom/lumiyaviewer/lumiya/render/RenderContext;)[F
    .locals 7

    const/16 v3, 0x10

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->parentID:I

    if-nez v0, :cond_1

    const/16 v0, 0x20

    new-array v0, v0, [F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->getRotation()Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v0, v3}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->myAviPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->myAviPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->myAviPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-static {v0, v3, v4, v5, v6}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix()[F

    move-result-object v4

    move-object v2, v0

    move v5, v1

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    :cond_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->worldMatrix:[F

    return-object v0
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->setNameTag(Ljava/lang/String;)V

    return-void
.end method
