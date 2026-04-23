.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AvatarParam"
.end annotation


# instance fields
.field public final defValue:F

.field public final drivenParams:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final maxValue:F

.field public final meshIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final minValue:F

.field public final morph:Z

.field public final paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final paramColor:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final skeletonParams:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;FFFZLcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;Lcom/google/common/collect/ImmutableList;Lcom/google/common/collect/ImmutableMap;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Lcom/google/common/collect/ImmutableMap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;",
            "FFFZ",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;",
            ">;",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->meshIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->maxValue:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->defValue:F

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->morph:Z

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramColor:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iput-object p8, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->drivenParams:Lcom/google/common/collect/ImmutableList;

    iput-object p9, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->skeletonParams:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method
