.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public ActiveGroupID:Ljava/util/UUID;

.field public AgentAccess:I

.field public AgentID:Ljava/util/UUID;

.field public AgentPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public AgentTextures:[B

.field public AgentVel:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public AlwaysRun:Z

.field public Aspect:F

.field public AtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public BodyRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ChangedGrid:Z

.field public ControlFlags:I

.field public EnergyLevel:F

.field public Far:F

.field public GodLevel:I

.field public HeadRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public LeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public LocomotionState:I

.field public PreyAgent:Ljava/util/UUID;

.field public RegionHandle:J

.field public SessionID:Ljava/util/UUID;

.field public Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Throttles:[B

.field public UpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ViewerCircuitCode:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
