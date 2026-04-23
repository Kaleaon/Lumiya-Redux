.class public Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;
    }
.end annotation


# instance fields
.field private deleteOnCompletion:Z

.field private expectedDataLen:I

.field private expectedPacketNum:I

.field private fileName:Ljava/lang/String;

.field private filePath:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field private hasCompleted:Z

.field private id:J

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;",
            ">;"
        }
    .end annotation
.end field

.field private receivedData:[B

.field private receivedDataLen:I


# direct methods
.method public constructor <init>(JLjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;Z)V
    .locals 3

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->listeners:Ljava/util/List;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->hasCompleted:Z

    iput-wide p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->id:J

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->fileName:Ljava/lang/String;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->filePath:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->deleteOnCompletion:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedData:[B

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedDataLen:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedDataLen:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedPacketNum:I

    return-void
.end method


# virtual methods
.method public HandleDataPacket(Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;)V
    .locals 11

    const/4 v3, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string/jumbo v0, "XferPacket: packetNum %d (0x%x), dataLen %d"

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->Packet:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    iget-object v5, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->Packet:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    iget-object v5, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    array-length v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->Packet:I

    const v4, 0x7fffffff

    and-int/2addr v4, v0

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->Packet:I

    const/high16 v5, -0x80000000

    and-int/2addr v0, v5

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedPacketNum:I

    if-ne v4, v5, :cond_4

    if-nez v4, :cond_2

    iget-object v5, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    array-length v5, v5

    if-ge v5, v3, :cond_1

    return-void

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    iget-object v5, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    aget-byte v5, v5, v2

    and-int/lit16 v5, v5, 0xff

    iget-object v6, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    aget-byte v6, v6, v1

    shl-int/lit8 v6, v6, 0x8

    const v7, 0xff00

    and-int/2addr v6, v7

    or-int/2addr v5, v6

    iget-object v6, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    aget-byte v6, v6, v8

    shl-int/lit8 v6, v6, 0x10

    const/high16 v7, 0xff0000

    and-int/2addr v6, v7

    or-int/2addr v5, v6

    iget-object v6, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    aget-byte v6, v6, v9

    shl-int/lit8 v6, v6, 0x18

    const/high16 v7, -0x1000000

    and-int/2addr v6, v7

    or-int/2addr v5, v6

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedDataLen:I

    const-string/jumbo v5, "XferPacket: expected data len = %d (0x%x)"

    new-array v6, v8, [Ljava/lang/Object;

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedDataLen:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedDataLen:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v1

    invoke-static {v5, v6}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedDataLen:I

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedData:[B

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    array-length v2, v2

    add-int/lit8 v2, v2, -0x4

    :goto_1
    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedDataLen:I

    add-int/2addr v5, v2

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedDataLen:I

    if-le v5, v6, :cond_3

    return-void

    :cond_2
    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    array-length v3, v3

    move v10, v3

    move v3, v2

    move v2, v10

    goto :goto_1

    :cond_3
    iget-object v5, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedData:[B

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedDataLen:I

    invoke-static {v5, v3, v6, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedDataLen:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedDataLen:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedPacketNum:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedPacketNum:I

    if-eqz v0, :cond_4

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->hasCompleted:Z

    :cond_4
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->expectedPacketNum:I

    if-gt v4, v0, :cond_5

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket;-><init>()V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket$XferID;

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->id:J

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket$XferID;->ID:J

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket$XferID;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->Packet:I

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket$XferID;->Packet:I

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket;->isReliable:Z

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_5
    return-void
.end method

.method public StartTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;)V
    .locals 6

    const-wide/16 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->id:J

    iput-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->ID:J

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->fileName:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->Filename:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->filePath:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->getCode()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->FilePath:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->deleteOnCompletion:Z

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->DeleteOnCompletion:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->UseBigPackets:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->VFileID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    const/4 v2, -0x1

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->VFileType:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->isReliable:Z

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public addListener(Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->listeners:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;

    invoke-direct {v1, p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getData()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedData:[B

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public invokeListeners()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->fileName:Ljava/lang/String;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->receivedData:[B

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;->invokeListener(Ljava/lang/String;[B)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public isCompleted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->hasCompleted:Z

    return v0
.end method
