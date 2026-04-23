.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentInfo;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GranterBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$VisualParam;
    }
.end annotation


# instance fields
.field public AgentAccess_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;",
            ">;"
        }
    .end annotation
.end field

.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

.field public AgentInfo_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public AnimationData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;",
            ">;"
        }
    .end annotation
.end field

.field public GranterBlock_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GranterBlock;",
            ">;"
        }
    .end annotation
.end field

.field public GroupData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;",
            ">;"
        }
    .end annotation
.end field

.field public NVPairData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;",
            ">;"
        }
    .end annotation
.end field

.field public VisualParam_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$VisualParam;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GroupData_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AnimationData_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GranterBlock_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->NVPairData_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->VisualParam_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentAccess_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentInfo_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Throttles:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x8a

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentTextures:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x19

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AnimationData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x20

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GranterBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->NVPairData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;->NVPairs:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentAccess_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleChildAgentUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x2

    const/16 v0, 0x19

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ViewerCircuitCode:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentVel:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->LeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->UpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ChangedGrid:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Far:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Aspect:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Throttles:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->LocomotionState:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->HeadRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->BodyRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ControlFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->EnergyLevel:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->GodLevel:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AlwaysRun:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->PreyAgent:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentTextures:[B

    invoke-virtual {p0, p1, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ActiveGroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;->GroupPowers:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;->AcceptNotices:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AnimationData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AnimationData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;->Animation:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GranterBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GranterBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GranterBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GranterBlock;->GranterID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->NVPairData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->NVPairData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;->NVPairs:[B

    invoke-virtual {p0, p1, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$VisualParam;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$VisualParam;->ParamValue:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    goto :goto_4

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentAccess_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentAccess_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;->AgentLegacyAccess:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;->AgentMaxAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    goto :goto_5

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentInfo_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentInfo;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_6

    :cond_6
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 7

    const/4 v6, 0x2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->RegionHandle:J

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ViewerCircuitCode:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentVel:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->LeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->UpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v2

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ChangedGrid:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Far:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Aspect:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->Throttles:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->LocomotionState:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->HeadRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->BodyRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ControlFlags:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->EnergyLevel:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->GodLevel:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v2

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AlwaysRun:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->PreyAgent:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentAccess:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->AgentTextures:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentData;->ActiveGroupID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;->GroupPowers:J

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v4

    iput-boolean v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GroupData;->AcceptNotices:Z

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_1
    if-ge v1, v2, :cond_1

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;->Animation:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AnimationData;->ObjectID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AnimationData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_2
    if-ge v1, v2, :cond_2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GranterBlock;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GranterBlock;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$GranterBlock;->GranterID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->GranterBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_3
    if-ge v1, v2, :cond_3

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;-><init>()V

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$NVPairData;->NVPairs:[B

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->NVPairData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_4
    if-ge v1, v2, :cond_4

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$VisualParam;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$VisualParam;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$VisualParam;->ParamValue:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_4
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_5
    if-ge v1, v2, :cond_5

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;->AgentLegacyAccess:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentAccess;->AgentMaxAccess:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentAccess_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_6
    if-ge v0, v1, :cond_6

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentInfo;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentInfo;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate$AgentInfo;->Flags:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;->AgentInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_6
    return-void
.end method
