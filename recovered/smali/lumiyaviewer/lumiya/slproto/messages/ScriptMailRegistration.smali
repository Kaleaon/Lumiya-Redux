.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;
    }
.end annotation


# instance fields
.field public DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->TargetIP:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptMailRegistration(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x5e

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->TargetIP:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->TargetPort:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->TaskID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->TargetIP:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->TargetPort:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->TaskID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;->Flags:I

    return-void
.end method
