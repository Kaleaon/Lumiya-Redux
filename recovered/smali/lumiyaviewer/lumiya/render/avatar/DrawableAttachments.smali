.class Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;
.super Ljava/lang/Object;


# annotations
.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# instance fields
.field private glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final nonRigged:Lcom/google/common/collect/ImmutableMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMultimap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final rigged:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-static {}, Lcom/google/common/collect/ImmutableMultimap;->of()Lcom/google/common/collect/ImmutableMultimap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/Multimap;)V
    .locals 7
    .param p1    # Lcom/google/common/collect/Multimap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-static {}, Lcom/google/common/collect/ImmutableMultimap;->builder()Lcom/google/common/collect/ImmutableMultimap$Builder;

    move-result-object v2

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/google/common/collect/Multimap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-interface {p1, v0}, Lcom/google/common/collect/Multimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isRiggedMesh()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v3, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    :cond_1
    invoke-virtual {v2, v0, v1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMultimap$Builder;->build()Lcom/google/common/collect/ImmutableMultimap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    const-string/jumbo v0, "Created drawableAttachments: %d rigged, %d non-rigged"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMultimap;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;)V
    .locals 7
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-static {}, Lcom/google/common/collect/ImmutableMultimap;->builder()Lcom/google/common/collect/ImmutableMultimap$Builder;

    move-result-object v2

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v3, v0}, Lcom/google/common/collect/ImmutableList$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$Builder;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMultimap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMultimap;->get(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableCollection;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isRiggedMesh()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v3, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    :cond_1
    invoke-virtual {v2, v0, v1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMultimap$Builder;->build()Lcom/google/common/collect/ImmutableMultimap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const-string/jumbo v0, "Updated drawableAttachments: %d rigged, %d non-rigged"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMultimap;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;Z)Z
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    const/4 v7, 0x3

    const/4 v1, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_6

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->setupRiggedMeshProgram(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_b

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v2, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uAnimationDataBlockSize:I

    invoke-direct {v2, v4}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    move v0, v1

    :goto_0
    if-nez p3, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getRawBuffer()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v2

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->jointWorldMatrix:[F

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    array-length v5, v5

    add-int/lit8 v5, v5, 0x2f

    mul-int/lit8 v5, v5, 0x10

    invoke-virtual {v2, v3, v4, v3, v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromFloatArray(I[FII)V

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->glAnimationDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez p3, :cond_2

    :goto_1
    invoke-virtual {v2, p1, v1, v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindUniformDynamic(Lcom/lumiyaviewer/lumiya/render/RenderContext;IZ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v2, v3

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->DrawRigged30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I

    move-result v0

    or-int/2addr v0, v2

    move v2, v0

    goto :goto_2

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    and-int/lit8 v0, v2, 0x2

    if-eqz v0, :cond_4

    invoke-virtual {p1, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->setupRiggedMeshProgram(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    const/4 v4, 0x2

    invoke-virtual {v0, p1, v4}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->DrawRigged30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I

    goto :goto_3

    :cond_4
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearRiggedMeshProgram()V

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMultimap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v2, v3

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getAttachmentMatrix(I)[F

    move-result-object v5

    if-eqz v5, :cond_a

    invoke-virtual {p1, v5, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->nonRigged:Lcom/google/common/collect/ImmutableMultimap;

    invoke-virtual {v5, v0}, Lcom/google/common/collect/ImmutableMultimap;->get(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableCollection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isRiggedMesh()Z

    move-result v6

    if-eqz v6, :cond_7

    move v2, v1

    goto :goto_5

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->rigged:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-virtual {v0, p1, p2, v7}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->DrawRigged(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;I)I

    goto :goto_6

    :cond_7
    invoke-virtual {v0, p1, v7}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I

    goto :goto_5

    :cond_8
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    move v0, v2

    :goto_7
    move v2, v0

    goto :goto_4

    :cond_9
    return v2

    :cond_a
    move v0, v2

    goto :goto_7

    :cond_b
    move v0, v3

    goto/16 :goto_0
.end method
