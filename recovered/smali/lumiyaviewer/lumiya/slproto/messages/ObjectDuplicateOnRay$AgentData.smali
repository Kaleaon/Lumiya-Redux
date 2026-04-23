.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicateOnRay$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicateOnRay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public BypassRaycast:Z

.field public CopyCenters:Z

.field public CopyRotates:Z

.field public DuplicateFlags:I

.field public GroupID:Ljava/util/UUID;

.field public RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RayEndIsIntersection:Z

.field public RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RayTargetID:Ljava/util/UUID;

.field public SessionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
