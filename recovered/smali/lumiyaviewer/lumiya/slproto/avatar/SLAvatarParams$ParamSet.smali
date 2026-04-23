.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParamSet"
.end annotation


# instance fields
.field public final appearanceIndex:I

.field public final id:I

.field public final name:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final params:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(IILcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;Lcom/google/common/collect/ImmutableList;)V
    .locals 0
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->id:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->appearanceIndex:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->name:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    return-void
.end method
