.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;
    }
.end annotation


# instance fields
.field public Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x25

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptRunningReply(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0xc

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;->Running:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->Script_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply$Script;->Running:Z

    return-void
.end method
