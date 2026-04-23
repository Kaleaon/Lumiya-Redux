.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$OwnerData;
    }
.end annotation


# instance fields
.field public Buttons_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;",
            ">;"
        }
    .end annotation
.end field

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

.field public OwnerData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$OwnerData;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->OwnerData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->FirstName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->LastName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ObjectName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->Message:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;->ButtonLabel:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->OwnerData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptDialog(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x42

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->FirstName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->LastName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ObjectName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->Message:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ChatChannel:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ImageID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;->ButtonLabel:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->OwnerData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->OwnerData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$OwnerData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$OwnerData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    const/4 v0, 0x0

    const/4 v5, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ObjectID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    invoke-virtual {p0, p1, v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->FirstName:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    invoke-virtual {p0, p1, v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->LastName:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    invoke-virtual {p0, p1, v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ObjectName:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->Message:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ChatChannel:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ImageID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;-><init>()V

    invoke-virtual {p0, p1, v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;->ButtonLabel:[B

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$OwnerData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$OwnerData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$OwnerData;->OwnerID:Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->OwnerData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
