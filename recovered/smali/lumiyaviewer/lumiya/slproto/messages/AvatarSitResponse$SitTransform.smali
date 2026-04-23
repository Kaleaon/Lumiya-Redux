.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SitTransform"
.end annotation


# instance fields
.field public AutoPilot:Z

.field public CameraAtOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public CameraEyeOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ForceMouselook:Z

.field public SitPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public SitRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
