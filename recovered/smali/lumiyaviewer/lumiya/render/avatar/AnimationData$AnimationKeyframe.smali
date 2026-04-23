.class abstract Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "AnimationKeyframe"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final time:F


# direct methods
.method private constructor <init>(F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->time:F

    return-void
.end method

.method synthetic constructor <init>(FLcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;-><init>(F)V

    return-void
.end method


# virtual methods
.method protected abstract getTransform()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract setInterpolated(Ljava/lang/Object;FLcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;F)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe",
            "<TT;>;F)V"
        }
    .end annotation
.end method

.method public abstract setTransform(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
