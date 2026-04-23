.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;
    }
.end annotation


# instance fields
.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->ObjectName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->SimName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptTeleportRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x3d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->ObjectName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->SimName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->SimPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->ObjectName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->SimPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
