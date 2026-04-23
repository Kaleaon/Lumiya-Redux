.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public BodyRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public CameraAtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public CameraCenter:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public CameraLeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public CameraUpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ControlFlags:I

.field public Far:F

.field public Flags:I

.field public HeadRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public SessionID:Ljava/util/UUID;

.field public State:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
