.class public Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;
    }
.end annotation


# instance fields
.field public InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x48

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleInviteGroupResponse(Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x5e

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->InviteeID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->RoleID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->MembershipFee:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->InviteeID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->RoleID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->InviteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;->MembershipFee:I

    return-void
.end method
