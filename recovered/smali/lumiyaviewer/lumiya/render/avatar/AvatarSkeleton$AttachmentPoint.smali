.class Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AttachmentPoint"
.end annotation


# instance fields
.field final bone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

.field public final matrix:[F

.field public final point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->matrix:[F

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->bone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;)V

    return-void
.end method
