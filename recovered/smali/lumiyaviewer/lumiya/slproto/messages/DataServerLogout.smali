.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;
    }
.end annotation


# instance fields
.field public UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x29

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDataServerLogout(Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, -0x5

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->ViewerIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->Disconnect:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->ViewerIP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->Disconnect:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;->SessionID:Ljava/util/UUID;

    return-void
.end method
