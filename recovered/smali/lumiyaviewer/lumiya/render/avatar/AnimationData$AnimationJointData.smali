.class Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnimationJointData"
.end annotation


# instance fields
.field private final Priority:I

.field private final posKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

.field private final rotKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->Priority:I

    return v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;F)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->Priority:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readInt()I

    move-result v0

    if-ltz v0, :cond_0

    const/16 v1, 0x2710

    if-le v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    :cond_1
    new-array v1, v0, [Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->rotKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v2, v3, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v3

    const/high16 v4, -0x40800000    # -1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v4

    const/high16 v5, -0x40800000    # -1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v5

    const/high16 v6, -0x40800000    # -1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v5, v6, v7}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->rotKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    new-instance v7, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-static {v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->unpackFromVector3(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v3

    invoke-direct {v7, v2, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;-><init>(FLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    aput-object v7, v6, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readInt()I

    move-result v0

    if-ltz v0, :cond_3

    const/16 v1, 0x2710

    if-le v0, v1, :cond_4

    :cond_3
    const/4 v0, 0x0

    :cond_4
    new-array v1, v0, [Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->posKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v2, v3, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v3

    const/high16 v4, -0x3f600000    # -5.0f

    const/high16 v5, 0x40a00000    # 5.0f

    invoke-static {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v4

    const/high16 v5, -0x3f600000    # -5.0f

    const/high16 v6, 0x40a00000    # 5.0f

    invoke-static {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result v5

    const/high16 v6, -0x3f600000    # -5.0f

    const/high16 v7, 0x40a00000    # 5.0f

    invoke-static {v5, v6, v7}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->uint16ToFloat(IFF)F

    move-result v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->posKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    new-instance v7, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-direct {v7, v2, v8}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;-><init>(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    aput-object v7, v6, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method

.method private static animateArray(FFLjava/lang/Object;[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(FFTT;[",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe",
            "<TT;>;)Z"
        }
    .end annotation

    const/4 v6, 0x1

    const/4 v1, 0x0

    array-length v0, p3

    if-ne v0, v6, :cond_0

    aget-object v0, p3, v1

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->setTransform(Ljava/lang/Object;)V

    return v6

    :cond_0
    move v0, v1

    :goto_0
    array-length v2, p3

    if-ge v0, v2, :cond_7

    aget-object v2, p3, v0

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->time:F

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_6

    aget-object v2, p3, v0

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->time:F

    cmpl-float v2, p1, v2

    if-nez v2, :cond_1

    aget-object v0, p3, v0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->setTransform(Ljava/lang/Object;)V

    :goto_1
    return v6

    :cond_1
    add-int/lit8 v2, v0, -0x1

    if-gez v2, :cond_2

    move v2, v1

    :cond_2
    if-ne v2, v0, :cond_3

    aget-object v0, p3, v0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->setTransform(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    aget-object v1, p3, v0

    iget v3, v1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->time:F

    aget-object v1, p3, v2

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->time:F

    cmpl-float v4, v1, v3

    if-lez v4, :cond_4

    sub-float/2addr v1, p0

    :cond_4
    cmpl-float v4, v1, v3

    if-nez v4, :cond_5

    aget-object v0, p3, v0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->setTransform(Ljava/lang/Object;)V

    goto :goto_1

    :cond_5
    sub-float v4, v3, p1

    sub-float v5, v3, v1

    div-float/2addr v4, v5

    sub-float v5, p1, v1

    sub-float v1, v3, v1

    div-float v1, v5, v1

    aget-object v2, p3, v2

    aget-object v0, p3, v0

    invoke-virtual {v2, p2, v4, v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;->setInterpolated(Ljava/lang/Object;FLcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;F)V

    goto :goto_1

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_7
    return v1
.end method

.method private static uint16ToFloat(IFF)F
    .locals 3

    const v2, 0x37800080

    int-to-float v0, p0

    mul-float/2addr v0, v2

    sub-float v1, p2, p1

    mul-float/2addr v0, v1

    add-float/2addr v0, p1

    mul-float/2addr v1, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v1, v2, v1

    if-gez v1, :cond_0

    const/4 v0, 0x0

    :cond_0
    return v0
.end method


# virtual methods
.method animate(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;FF[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;IF[F[FLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->posKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    array-length v0, v0

    if-eqz v0, :cond_1

    aget v0, p9, p6

    mul-float/2addr v0, p7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->posKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    invoke-static {p2, p3, p11, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->animateArray(FFLjava/lang/Object;[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;)Z

    if-eqz p1, :cond_0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mPelvis:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    if-eq v1, v2, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getBasePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-virtual {p11, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_0
    aget-object v1, p5, p6

    invoke-virtual {v1, p11, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    aget v1, p9, p6

    sub-float v0, v1, v0

    aput v0, p9, p6

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->rotKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    array-length v0, v0

    if-eqz v0, :cond_2

    aget v0, p8, p6

    mul-float/2addr v0, p7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->rotKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    invoke-static {p2, p3, p10, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->animateArray(FFLjava/lang/Object;[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;)Z

    aget-object v1, p4, p6

    invoke-virtual {v1, p10, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;F)V

    aget v1, p8, p6

    sub-float v0, v1, v0

    aput v0, p8, p6

    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Priority "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->Priority:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v1, ", pos frames "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->posKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    array-length v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->posKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;

    array-length v4, v3

    move v1, v0

    :goto_0
    if-ge v1, v4, :cond_0

    aget-object v5, v3, v1

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "], rot frames "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->rotKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    array-length v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->rotKeyframes:[Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;

    array-length v3, v1

    :goto_1
    if-ge v0, v3, :cond_1

    aget-object v4, v1, v0

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    const-string/jumbo v0, "]"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
