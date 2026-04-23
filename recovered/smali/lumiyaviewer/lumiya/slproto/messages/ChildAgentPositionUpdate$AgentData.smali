.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public AgentPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public AgentVel:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public AtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ChangedGrid:Z

.field public LeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RegionHandle:J

.field public SessionID:Ljava/util/UUID;

.field public Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public UpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ViewerCircuitCode:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
