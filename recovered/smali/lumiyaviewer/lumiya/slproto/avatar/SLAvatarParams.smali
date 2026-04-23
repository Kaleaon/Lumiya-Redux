.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;,
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;,
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;,
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;,
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;
    }
.end annotation


# static fields
.field public static final NUM_PARAMS:I = 0xda

.field public static final paramByIDs:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public static final paramDefs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xda

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramDefs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramDefs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamBuilder;->buildParams([Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;Ljava/util/Map;)V

    invoke-static {v0}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
