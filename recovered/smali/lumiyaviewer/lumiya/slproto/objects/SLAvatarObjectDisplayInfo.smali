.class public Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;


# instance fields
.field public final children:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final implicitlyAdded:Z

.field public final uuid:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;FLcom/google/common/collect/ImmutableList;Z)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            "F",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;Z)V"
        }
    .end annotation

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    invoke-direct {p0, v0, p1, p3, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;-><init>(ILjava/lang/String;FI)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;->children:Lcom/google/common/collect/ImmutableList;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;->implicitlyAdded:Z

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;->uuid:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public getChildren()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;->children:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public isImplicitlyAdded()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;->implicitlyAdded:Z

    return v0
.end method
