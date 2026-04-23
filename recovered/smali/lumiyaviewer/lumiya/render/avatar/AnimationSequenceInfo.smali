.class public Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
.super Ljava/lang/Object;


# static fields
.field protected static final INVALID_SEQUENCE_ID:I = 0x0

.field protected static final INVALID_TIMESTAMP:J = -0x1L

.field public static final MAX_ANIMATION_LENGTH:J = 0xea60L


# instance fields
.field protected final animationID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final dontEaseIn:Z

.field protected final runningSince:J

.field protected final sequenceID:I

.field protected final stoppingEasingOutSince:J

.field protected final stoppingRunningSince:J

.field protected final stoppingSequenceID:I


# direct methods
.method private constructor <init>(Ljava/util/UUID;IJIJJZ)V
    .locals 0
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->animationID:Ljava/util/UUID;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    iput-wide p3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->runningSince:J

    iput p5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingSequenceID:I

    iput-wide p6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingRunningSince:J

    iput-wide p8, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingEasingOutSince:J

    iput-boolean p10, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->dontEaseIn:Z

    return-void
.end method

.method public static newSequence(Ljava/util/UUID;JI)Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
    .locals 11
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const-wide/16 v6, -0x1

    const/4 v5, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    move-object v1, p0

    move v2, p3

    move-wide v3, p1

    move-wide v8, v6

    move v10, v5

    invoke-direct/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;-><init>(Ljava/util/UUID;IJIJJZ)V

    return-object v0
.end method

.method public static restartSequence(JILcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
    .locals 12
    .param p3    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/4 v10, 0x1

    iget v0, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    iget-object v1, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->animationID:Ljava/util/UUID;

    iget v5, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    iget-wide v6, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->runningSince:J

    move v2, p2

    move-wide v3, p0

    move-wide v8, p0

    invoke-direct/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;-><init>(Ljava/util/UUID;IJIJJZ)V

    return-object v0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    iget-object v1, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->animationID:Ljava/util/UUID;

    iget v5, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingSequenceID:I

    iget-wide v6, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingRunningSince:J

    iget-wide v8, p3, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingRunningSince:J

    move v2, p2

    move-wide v3, p0

    invoke-direct/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;-><init>(Ljava/util/UUID;IJIJJZ)V

    return-object v0
.end method

.method public static stopSequence(JLcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
    .locals 12
    .param p2    # Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    iget v0, p2, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->animationID:Ljava/util/UUID;

    iget v5, p2, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    iget-wide v6, p2, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->runningSince:J

    iget-boolean v10, p2, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->dontEaseIn:Z

    const-wide/16 v3, -0x1

    move-wide v8, p0

    invoke-direct/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;-><init>(Ljava/util/UUID;IJIJJZ)V

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public hasStopped(J)Z
    .locals 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    if-nez v2, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingSequenceID:I

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stoppingEasingOutSince:J

    const-wide/32 v4, 0xea60

    add-long/2addr v2, v4

    cmp-long v2, p1, v2

    if-ltz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method
