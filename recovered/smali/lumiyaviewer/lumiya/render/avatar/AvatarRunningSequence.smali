.class Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;
.super Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;


# instance fields
.field private final animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final dontEaseIn:Z

.field private final runningAnimations:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;",
            ">;"
        }
    .end annotation
.end field

.field private final runningSince:J

.field final sequenceID:I

.field private final stoppingSince:J


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;IJJZ)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->sequenceID:I

    iput-wide p3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->runningSince:J

    iput-wide p5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->stoppingSince:J

    iput-boolean p7, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->dontEaseIn:Z

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->createRunningAnimations(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->runningAnimations:Lcom/google/common/collect/ImmutableList;

    return-void
.end method


# virtual methods
.method public getAnimationPriority()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getPriority()I

    move-result v0

    return v0
.end method

.method getRunningAnimations(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->runningAnimations:Lcom/google/common/collect/ImmutableList;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method needAnimate(J)Z
    .locals 11

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->runningSince:J

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->stoppingSince:J

    iget-boolean v8, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;->dontEaseIn:Z

    move-wide v2, p1

    move-object v9, p0

    invoke-virtual/range {v1 .. v9}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->updateAnimationTiming(JJJZLcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;)Z

    move-result v0

    return v0
.end method
