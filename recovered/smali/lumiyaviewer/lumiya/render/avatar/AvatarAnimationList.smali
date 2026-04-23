.class Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;
.super Ljava/lang/Object;


# instance fields
.field private final animations:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final sequences:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Collection;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v2

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->getRunningAnimations(Lcom/google/common/collect/ImmutableList$Builder;Ljava/util/Collection;)V

    goto :goto_0

    :cond_0
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;->sequences:Lcom/google/common/collect/ImmutableList;

    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;->animations:Lcom/google/common/collect/ImmutableList;

    return-void
.end method


# virtual methods
.method animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;[F[F[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 8

    const/high16 v7, 0x3f800000    # 1.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;->animations:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;[F[F[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    goto :goto_0

    :cond_0
    array-length v1, p2

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v1, :cond_2

    aget v2, p2, v0

    sub-float v2, v7, v2

    const v3, 0x3c23d70a    # 0.01f

    cmpl-float v3, v2, v3

    if-lez v3, :cond_1

    cmpg-float v3, v2, v7

    if-gez v3, :cond_1

    div-float v2, v7, v2

    aget-object v3, p4, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v4, v2

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    aget-object v3, p4, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v4, v2

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    aget-object v3, p4, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v4, v2

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    aget-object v3, p4, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v2, v4

    iput v2, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method needAnimate(J)Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;->sequences:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->needAnimate(J)Z

    move-result v0

    or-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method
