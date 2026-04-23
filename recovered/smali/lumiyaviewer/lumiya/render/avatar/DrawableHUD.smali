.class public Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;
.super Ljava/lang/Object;


# instance fields
.field private final attachedTo:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

.field private final attachmentPoint:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

.field private final drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

.field private final hudObjects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;"
        }
    .end annotation
.end field

.field private final maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private final minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->hudObjects:Ljava/util/Set;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->attachmentPoint:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->attachedTo:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;-><init>()V

    const/4 v1, 0x1

    invoke-direct {p0, p2, p3, v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->addObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/MatrixStack;Z)V

    return-void
.end method

.method private addObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/MatrixStack;Z)V
    .locals 4

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPushMatrix()V

    invoke-direct {p0, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->processObjectExtents(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/MatrixStack;Z)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;->addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->hudObjects:Ljava/util/Set;

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->attachedTo:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->getDrawableAttachment(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getFirstChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v0

    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getDataObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, p3, v2}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->addObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/MatrixStack;Z)V

    :cond_1
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getNextChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    :cond_2
    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPopMatrix()V

    return-void
.end method

.method private processObjectExtents(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/MatrixStack;Z)V
    .locals 11

    const/4 v10, 0x6

    const/4 v9, 0x5

    const/4 v5, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    const/4 v1, 0x4

    const/16 v0, 0x8

    new-array v0, v0, [F

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getObjectCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getElementOffset(I)I

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getElementOffset(I)I

    move-result v6

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getData()[F

    move-result-object v7

    add-int/lit8 v2, v3, 0x0

    aget v2, v7, v2

    add-int/lit8 v4, v3, 0x1

    aget v4, v7, v4

    add-int/lit8 v3, v3, 0x2

    aget v3, v7, v3

    invoke-virtual {p2, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glTranslatef(FFF)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getRotation()Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix()[F

    move-result-object v2

    invoke-virtual {p2, v2, v5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glMultMatrixf([FI)V

    add-int/lit8 v2, v6, 0x0

    aget v2, v7, v2

    neg-float v2, v2

    div-float/2addr v2, v8

    aput v2, v0, v5

    add-int/lit8 v2, v6, 0x1

    aget v2, v7, v2

    neg-float v2, v2

    div-float/2addr v2, v8

    const/4 v3, 0x1

    aput v2, v0, v3

    add-int/lit8 v2, v6, 0x2

    aget v2, v7, v2

    neg-float v2, v2

    div-float/2addr v2, v8

    const/4 v3, 0x2

    aput v2, v0, v3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x3

    aput v2, v0, v3

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    move-object v4, v0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    if-eqz p3, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget v3, v0, v1

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget v3, v0, v9

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget v3, v0, v10

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget v3, v0, v1

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget v3, v0, v9

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget v3, v0, v10

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :goto_0
    add-int/lit8 v2, v6, 0x0

    aget v2, v7, v2

    div-float/2addr v2, v8

    aput v2, v0, v5

    add-int/lit8 v2, v6, 0x1

    aget v2, v7, v2

    div-float/2addr v2, v8

    const/4 v3, 0x1

    aput v2, v0, v3

    add-int/lit8 v2, v6, 0x2

    aget v2, v7, v2

    div-float/2addr v2, v8

    const/4 v3, 0x2

    aput v2, v0, v3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x3

    aput v2, v0, v3

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    move-object v4, v0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v4, v0, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v4, v0, v9

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v4, v0, v10

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v1, v0, v1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v3, v0, v9

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v0, v0, v10

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v4, v0, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v4, v0, v9

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v4, v0, v10

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v4, v0, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v4, v0, v9

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v4, v0, v10

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    goto/16 :goto_0
.end method


# virtual methods
.method public Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFLcom/lumiyaviewer/lumiya/render/TouchHUDEvent;Z)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;
    .locals 9

    const/4 v8, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x1

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelPushMatrix()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v1, v2

    div-float/2addr v1, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v2, v3

    div-float/2addr v2, v4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v3, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->maxPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    const v4, 0x3a83126f    # 0.001f

    cmpl-float v4, v3, v4

    if-lez v4, :cond_0

    div-float v3, v7, v3

    mul-float/2addr v3, p2

    invoke-virtual {p1, v7, v3, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelScalef(FFF)V

    :cond_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->minPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    neg-float v3, v3

    neg-float v1, v1

    add-float/2addr v1, p3

    neg-float v2, v2

    add-float/2addr v2, p4

    invoke-virtual {p1, v3, v1, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelTranslatef(FFF)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->hudObjects:Ljava/util/Set;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    if-eqz p6, :cond_2

    invoke-virtual {v0, p1, v6}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->DrawHoverText(Lcom/lumiyaviewer/lumiya/render/RenderContext;Z)V

    move-object v0, v1

    :cond_1
    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_2
    const/4 v3, 0x3

    invoke-virtual {v0, p1, v3}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I

    if-eqz p5, :cond_3

    iget v3, p5, Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;->x:F

    iget v4, p5, Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;->y:F

    const/high16 v5, -0x800000    # Float.NEGATIVE_INFINITY

    invoke-virtual {v0, p1, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->PickObject(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFF)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    move-result-object v0

    if-eqz v0, :cond_3

    if-eqz v1, :cond_1

    iget v3, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->pickDepth:F

    iget v4, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->pickDepth:F

    cmpg-float v3, v3, v4

    if-ltz v3, :cond_1

    :cond_3
    move-object v0, v1

    goto :goto_1

    :cond_4
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelPopMatrix()V

    if-eqz p5, :cond_5

    if-eqz v1, :cond_5

    const-string/jumbo v0, "TouchHUD event: pickDepth %f objID %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->pickDepth:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v8

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    if-eqz v0, :cond_5

    const-string/jumbo v0, "TouchHUD event: intersect face %d uv (%f, %f) st (%f, %f)"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v6

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_5
    return-object v1
.end method

.method public getAttachmentPoint()Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->attachmentPoint:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    return-object v0
.end method
