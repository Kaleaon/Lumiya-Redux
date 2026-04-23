.class public Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;
    }
.end annotation


# instance fields
.field private volatile animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

.field private volatile animationPair:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final drawableAvatar:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private volatile sequenceInfo:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationPair:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->sequenceInfo:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->drawableAvatar:Ljava/lang/ref/WeakReference;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->animationID:Ljava/util/UUID;

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 2

    const/4 v1, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->drawableAvatar:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateRunningAnimations()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p1, :cond_0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    goto :goto_0
.end method

.method getRunningAnimations(Lcom/google/common/collect/ImmutableList$Builder;Ljava/util/Collection;)V
    .locals 3
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationPair:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    if-eqz v1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->sequenceInfo:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationPair:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->getRunningAnimations(Lcom/google/common/collect/ImmutableList$Builder;Ljava/util/Collection;)V

    :cond_1
    return-void
.end method

.method hasStopped()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationPair:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;->hasStopped()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method updateSequenceInfo(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->sequenceInfo:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->animationPair:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState$AnimationPair;

    return-void
.end method
