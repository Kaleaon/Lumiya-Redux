.class Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;",
        ">;"
    }
.end annotation


# instance fields
.field private final jointSet:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final sequence:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->sequence:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->jointSet:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    return-void
.end method


# virtual methods
.method animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;[F[F[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->jointSet:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->sequence:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;[F[F[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public compareTo(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;)I
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->jointSet:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->getPriority()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->jointSet:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->getPriority()I

    move-result v1

    sub-int/2addr v0, v1

    if-eqz v0, :cond_0

    return v0

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->sequence:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->sequenceID:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->sequence:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->sequenceID:I

    sub-int/2addr v0, v1

    if-eqz v0, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;->compareTo(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;)I

    move-result v0

    return v0
.end method
