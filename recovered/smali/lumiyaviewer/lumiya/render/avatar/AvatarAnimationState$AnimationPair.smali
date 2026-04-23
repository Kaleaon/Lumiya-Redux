.class Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnimationPair"
.end annotation


# instance fields
.field final runningAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V
    .locals 10
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v9, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    iget-wide v4, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->runningSince:J

    iget-boolean v8, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->dontEaseIn:Z

    const-wide/16 v6, -0x1

    move-object v2, p2

    invoke-direct/range {v1 .. v8}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;IJJZ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->runningAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    :goto_0
    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingSequenceID:I

    if-eqz v0, :cond_1

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingSequenceID:I

    iget-wide v4, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingRunningSince:J

    iget-wide v6, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingEasingOutSince:J

    iget-boolean v8, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->dontEaseIn:Z

    move-object v2, p2

    invoke-direct/range {v1 .. v8}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;IJJZ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    :goto_1
    return-void

    :cond_0
    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->runningAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    goto :goto_0

    :cond_1
    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    goto :goto_1
.end method


# virtual methods
.method getRunningAnimations(Lcom/google/common/collect/ImmutableList$Builder;Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList$Builder",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->runningAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->runningAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->runningAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->getRunningAnimations(Ljava/util/Collection;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->getRunningAnimations(Ljava/util/Collection;)V

    :cond_1
    return-void
.end method

.method hasStopped()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->runningAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->stoppingAnimation:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->hasStopped()Z

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method
