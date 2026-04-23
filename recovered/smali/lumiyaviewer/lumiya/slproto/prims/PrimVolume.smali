.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;
.super Ljava/lang/Object;


# static fields
.field private static final FLEXI_PATH_REZ:I = 0x10

.field private static final SCULPT_REZ_1:I = 0x6

.field private static final SCULPT_REZ_2:I = 0x8

.field private static final SCULPT_REZ_3:I = 0x10

.field private static final SCULPT_REZ_4:I = 0x20


# instance fields
.field private Detail:F

.field private FaceMask:I

.field private GenerateSingleFace:Z

.field private LODScaleBias:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

.field Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

.field Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

.field private SculptLevel:I

.field private Unique:Z

.field public VolumeFaces:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;",
            ">;"
        }
    .end annotation
.end field

.field private sculptRequestedS:I

.field private sculptRequestedT:I

.field volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    return-void
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;FZZLcom/lumiyaviewer/lumiya/render/GLTexture;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;
    .locals 7

    const/4 v6, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->isSculpt()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p4, :cond_0

    return-object v6

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Sculpt: using sculpt texture "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;-><init>()V

    iput-object p0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iput p1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Detail:F

    iput-boolean p2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->GenerateSingleFace:Z

    iput-boolean p3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Unique:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;-><init>()V

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;-><init>()V

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    const/4 v1, 0x0

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->FaceMask:I

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1, v2, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->LODScaleBias:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->isSculpt()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->generate()Z

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->createVolumeFaces()V

    return-object v0

    :cond_2
    invoke-interface {p4}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getWidth()I

    move-result v1

    invoke-interface {p4}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getHeight()I

    move-result v2

    invoke-interface {p4}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getNumComponents()I

    move-result v3

    const/4 v5, 0x1

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculpt(IIILcom/lumiyaviewer/lumiya/render/GLTexture;I)Z

    move-result v1

    if-nez v1, :cond_3

    return-object v6

    :cond_3
    return-object v0
.end method

.method private createVolumeFaces()V
    .locals 7

    const/4 v2, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->GenerateSingleFace:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->getNumFaces()I

    move-result v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->ensureCapacity(I)V

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_9

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Index:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Count:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    iput v2, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginT:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    iput v1, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->ID:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1

    iget v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit8 v5, v5, 0x40

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    :cond_1
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-boolean v5, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    if-eqz v5, :cond_2

    iget v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit16 v5, v5, 0x80

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    :cond_2
    iget-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Cap:Z

    if-eqz v5, :cond_5

    iget v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit8 v5, v5, 0x2

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    iget-short v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->FaceID:S

    const/4 v5, 0x1

    if-ne v0, v5, :cond_4

    iget v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit16 v0, v0, 0x200

    iput v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_4
    iget v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit16 v0, v0, 0x400

    iput v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    goto :goto_1

    :cond_5
    iget-short v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->FaceID:S

    and-int/lit8 v5, v5, 0x18

    if-eqz v5, :cond_6

    iget v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit16 v0, v0, 0x104

    iput v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    goto :goto_1

    :cond_6
    iget v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit8 v5, v5, 0x8

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    iget-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Flat:Z

    if-eqz v5, :cond_7

    iget v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit16 v5, v5, 0x100

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    :cond_7
    iget-short v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->FaceID:S

    and-int/lit8 v5, v5, 0x4

    if-eqz v5, :cond_8

    iget v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit8 v5, v5, 0x10

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Flat:Z

    if-eqz v0, :cond_3

    iget v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    const/4 v5, 0x2

    if-le v0, v5, :cond_3

    iget v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    goto :goto_1

    :cond_8
    iget v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    or-int/lit8 v0, v0, 0x20

    iput v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    goto :goto_1

    :cond_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->create(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z

    goto :goto_2

    :cond_a
    return-void
.end method

.method private generate()Z
    .locals 13

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/high16 v2, 0x3f000000    # 0.5f

    const v5, 0x3f19999a    # 0.6f

    const/4 v4, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Detail:F

    const v1, 0x3f28f5c3    # 0.66f

    mul-float/2addr v0, v1

    float-to-int v9, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    const/16 v1, 0x10

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    cmpl-float v0, v0, v3

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    cmpl-float v0, v0, v3

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    const/4 v1, 0x2

    if-ne v0, v1, :cond_5

    :cond_1
    :goto_0
    move v9, v4

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->LODScaleBias:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v2, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Detail:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Detail:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-byte v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    const/16 v3, 0x10

    if-ne v0, v3, :cond_6

    if-nez v1, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->LODScaleBias:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v5, v5, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->isFlexible()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    add-int/lit8 v3, v0, -0x2

    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->generate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;FIZI)Z

    move-result v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v6, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v7, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    move v10, v4

    move v11, v4

    invoke-virtual/range {v5 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->generate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFIZI)Z

    move-result v1

    if-nez v0, :cond_4

    if-eqz v1, :cond_a

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    mul-int v1, v5, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move v2, v4

    :goto_3
    if-ge v2, v3, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move v1, v4

    :goto_4
    if-ge v1, v5, :cond_7

    mul-int v0, v2, v5

    add-int v8, v0, v1

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v10, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    mul-float/2addr v10, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v11, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    mul-float/2addr v0, v11

    invoke-virtual {v9, v8, v10, v0, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(IFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v0, v8, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->mul(ILcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v9, v8, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->add(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_4

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    goto/16 :goto_0

    :cond_6
    const/16 v1, 0x20

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->LODScaleBias:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v5, v5, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    goto/16 :goto_1

    :cond_7
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_3

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->FaceMask:I

    iget-short v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->FaceID:S

    or-int/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->FaceMask:I

    goto :goto_5

    :cond_9
    const/4 v0, 0x1

    return v0

    :cond_a
    return v4

    :cond_b
    move v3, v9

    goto/16 :goto_2
.end method

.method private getNumFaces()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method private sculpt(IIILcom/lumiyaviewer/lumiya/render/GLTexture;I)Z
    .locals 9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-byte v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    if-nez p2, :cond_2

    :cond_0
    const/4 p5, -0x1

    const/4 v0, 0x1

    move v7, v0

    :goto_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Detail:F

    invoke-direct {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculpt_calc_mesh_resolution(IIF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Detail:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculptRequestedS:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->generate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;FIZI)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v2, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Detail:F

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculptRequestedT:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->generate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFIZI)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v0, :cond_1

    if-nez v1, :cond_3

    :cond_1
    const/4 v0, 0x0

    return v0

    :cond_2
    const/4 v1, 0x3

    if-lt p3, v1, :cond_0

    if-eqz p4, :cond_0

    move v7, v0

    goto :goto_0

    :cond_3
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    mul-int/2addr v0, v1

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;-><init>(I)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    if-nez v7, :cond_5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, v8

    :try_start_0
    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculptGenerateMapVertices(IIILcom/lumiyaviewer/lumiya/render/GLTexture;B)V
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_4

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->FaceMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    iget-short v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->FaceID:S

    or-int/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->FaceMask:I

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return v0

    :cond_4
    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->SculptLevel:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->createVolumeFaces()V

    const/4 v0, 0x1

    return v0

    :cond_5
    const/4 v0, 0x0

    return v0
.end method

.method private sculptGenerateMapVertices(IIILcom/lumiyaviewer/lumiya/render/GLTexture;B)V
    .locals 14

    and-int/lit8 v1, p5, 0x7

    int-to-byte v8, v1

    and-int/lit8 v1, p5, 0x40

    if-eqz v1, :cond_9

    const/4 v1, 0x1

    :goto_0
    and-int/lit8 v2, p5, -0x80

    if-eqz v2, :cond_a

    const/4 v2, 0x1

    :goto_1
    if-eqz v1, :cond_b

    xor-int/lit8 v1, v2, 0x1

    :goto_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v4, 0x0

    const/4 v3, 0x0

    move v6, v3

    move v7, v4

    :goto_3
    if-ge v6, v9, :cond_f

    const/4 v5, 0x0

    :goto_4
    if-ge v5, v10, :cond_e

    add-int v11, v5, v7

    if-eqz v1, :cond_10

    sub-int v3, v10, v5

    add-int/lit8 v3, v3, -0x1

    :goto_5
    int-to-float v3, v3

    add-int/lit8 v4, v10, -0x1

    int-to-float v4, v4

    div-float/2addr v3, v4

    int-to-float v4, p1

    mul-float/2addr v3, v4

    float-to-int v4, v3

    int-to-float v3, v6

    add-int/lit8 v12, v9, -0x1

    int-to-float v12, v12

    div-float/2addr v3, v12

    move/from16 v0, p2

    int-to-float v12, v0

    mul-float/2addr v3, v12

    float-to-int v3, v3

    if-nez v3, :cond_0

    const/4 v12, 0x1

    if-ne v8, v12, :cond_0

    div-int/lit8 v4, p1, 0x2

    :cond_0
    move/from16 v0, p2

    if-ne v3, v0, :cond_1

    const/4 v3, 0x2

    if-ne v8, v3, :cond_c

    const/4 v3, 0x0

    :goto_6
    const/4 v12, 0x1

    if-ne v8, v12, :cond_1

    div-int/lit8 v4, p1, 0x2

    :cond_1
    if-ne v4, p1, :cond_3

    const/4 v4, 0x1

    if-eq v8, v4, :cond_2

    const/4 v4, 0x2

    if-ne v8, v4, :cond_d

    :cond_2
    const/4 v4, 0x0

    :cond_3
    :goto_7
    if-gtz v4, :cond_4

    const/4 v4, 0x0

    :cond_4
    if-lt v4, p1, :cond_5

    add-int/lit8 v4, p1, -0x1

    :cond_5
    if-gtz v3, :cond_6

    const/4 v3, 0x0

    :cond_6
    move/from16 v0, p2

    if-lt v3, v0, :cond_7

    add-int/lit8 v3, p2, -0x1

    :cond_7
    mul-int/2addr v3, p1

    add-int/2addr v3, v4

    mul-int v3, v3, p3

    move-object/from16 v0, p4

    invoke-interface {v0, v3}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getRGB(I)I

    move-result v4

    shr-int/lit8 v3, v4, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-float v3, v3

    const/high16 v12, 0x437f0000    # 255.0f

    div-float/2addr v3, v12

    const/high16 v12, 0x3f000000    # 0.5f

    sub-float/2addr v3, v12

    shr-int/lit8 v12, v4, 0x8

    and-int/lit16 v12, v12, 0xff

    int-to-float v12, v12

    const/high16 v13, 0x437f0000    # 255.0f

    div-float/2addr v12, v13

    const/high16 v13, 0x3f000000    # 0.5f

    sub-float/2addr v12, v13

    and-int/lit16 v4, v4, 0xff

    int-to-float v4, v4

    const/high16 v13, 0x437f0000    # 255.0f

    div-float/2addr v4, v13

    const/high16 v13, 0x3f000000    # 0.5f

    sub-float/2addr v4, v13

    if-eqz v2, :cond_8

    const/high16 v13, -0x40800000    # -1.0f

    mul-float/2addr v3, v13

    :cond_8
    iget-object v13, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v13, v11, v3, v12, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(IFFF)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_9
    const/4 v1, 0x0

    goto/16 :goto_0

    :cond_a
    const/4 v2, 0x0

    goto/16 :goto_1

    :cond_b
    move v1, v2

    goto/16 :goto_2

    :cond_c
    add-int/lit8 v3, p2, -0x1

    goto :goto_6

    :cond_d
    const/4 v4, 0x4

    if-eq v8, v4, :cond_2

    add-int/lit8 v4, p1, -0x1

    goto :goto_7

    :cond_e
    add-int v4, v7, v10

    add-int/lit8 v3, v6, 0x1

    move v6, v3

    move v7, v4

    goto/16 :goto_3

    :cond_f
    return-void

    :cond_10
    move v3, v5

    goto/16 :goto_5
.end method

.method private sculpt_calc_mesh_resolution(IIF)V
    .locals 5

    const/4 v4, 0x4

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculpt_sides(F)I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-int v0, v0

    mul-int v1, p1, p2

    div-int/lit8 v1, v1, 0x4

    if-lez v1, :cond_1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    move v1, v0

    :goto_0
    if-eqz p1, :cond_0

    if-nez p2, :cond_2

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_1
    int-to-float v2, v1

    div-float v0, v2, v0

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-int v0, v2

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    div-int v0, v1, v0

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    div-int/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculptRequestedS:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->sculptRequestedT:I

    return-void

    :cond_1
    move v1, v0

    goto :goto_0

    :cond_2
    int-to-float v0, p1

    int-to-float v2, p2

    div-float/2addr v0, v2

    goto :goto_1
.end method

.method private sculpt_sides(F)I
    .locals 4

    float-to-double v0, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x6

    return v0

    :cond_0
    float-to-double v0, p1

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_1

    const/16 v0, 0x8

    return v0

    :cond_1
    float-to-double v0, p1

    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_2

    const/16 v0, 0x10

    return v0

    :cond_2
    const/16 v0, 0x20

    return v0
.end method


# virtual methods
.method getPathType()B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    return v0
.end method

.method getProfileType()B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    return v0
.end method
