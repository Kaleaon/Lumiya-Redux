.class public Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
.super Ljava/lang/Object;


# instance fields
.field public final avatarCountLimit:I

.field public final avatarStubs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final avatars:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field final drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final objects:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public renderPasses:[I

.field public final terrain:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;I)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/DrawableStore;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarStubs:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->terrain:Ljava/util/ArrayList;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarCountLimit:I

    return-void
.end method

.method private constructor <init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;IIIII)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/DrawableStore;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarStubs:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->terrain:Ljava/util/ArrayList;

    iput p6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarCountLimit:I

    return-void
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;I)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
    .locals 7
    .param p0    # Lcom/lumiyaviewer/lumiya/render/DrawableStore;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    invoke-direct {v0, p0, p2}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;I)V

    return-object v0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    div-int/lit8 v2, v1, 0x3

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    div-int/lit8 v3, v1, 0x3

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarStubs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    div-int/lit8 v4, v1, 0x3

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->terrain:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    div-int/lit8 v5, v1, 0x3

    move-object v1, p0

    move v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;IIIII)V

    return-object v0
.end method


# virtual methods
.method initRenderPasses()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->renderPasses:[I

    return-void
.end method
