.class Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;
.super Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnimationRotKeyframe"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;",
        ">;"
    }
.end annotation


# instance fields
.field private final quaternion:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;


# direct methods
.method constructor <init>(FLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;-><init>(FLcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;)V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->quaternion:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    return-void
.end method


# virtual methods
.method protected getTransform()Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->quaternion:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    return-object v0
.end method

.method protected bridge synthetic getTransform()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->getTransform()Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v0

    return-object v0
.end method

.method public setInterpolated(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;FLcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;F)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;",
            "F",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;",
            ">;F)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->quaternion:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->getTransform()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p1, v1, p2, v0, p4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setLerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;FLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;F)V

    return-void
.end method

.method public bridge synthetic setInterpolated(Ljava/lang/Object;FLcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;F)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->setInterpolated(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;FLcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;F)V

    return-void
.end method

.method public setTransform(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->quaternion:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    return-void
.end method

.method public bridge synthetic setTransform(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->setTransform(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->quaternion:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
