.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SkeletonParamDefinition"
.end annotation


# instance fields
.field public final offset:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final scale:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    return-void
.end method
