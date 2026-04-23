.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SkeletonParamValue"
.end annotation


# instance fields
.field public final offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
