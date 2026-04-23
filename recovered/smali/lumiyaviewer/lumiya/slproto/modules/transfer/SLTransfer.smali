.class public Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;
.super Ljava/lang/Object;


# static fields
.field public static final AT_ANIMATION:I = 0x14

.field public static final AT_BODYPART:I = 0xd

.field public static final AT_CALLINGCARD:I = 0x2

.field public static final AT_CATEGORY:I = 0x8

.field public static final AT_CLOTHING:I = 0x5

.field public static final AT_GESTURE:I = 0x15

.field public static final AT_IMAGE_JPEG:I = 0x13

.field public static final AT_IMAGE_TGA:I = 0x12

.field public static final AT_LANDMARK:I = 0x3

.field public static final AT_LOST_AND_FOUND:I = 0x10

.field public static final AT_LSL_BYTECODE:I = 0xb

.field public static final AT_LSL_TEXT:I = 0xa

.field public static final AT_NOTECARD:I = 0x7

.field public static final AT_OBJECT:I = 0x6

.field public static final AT_ROOT_CATEGORY:I = 0x9

.field public static final AT_SCRIPT:I = 0x4

.field public static final AT_SIMSTATE:I = 0x16

.field public static final AT_SNAPSHOT_CATEGORY:I = 0xf

.field public static final AT_SOUND:I = 0x1

.field public static final AT_SOUND_WAV:I = 0x11

.field public static final AT_TEXTURE:I = 0x0

.field public static final AT_TEXTURE_TGA:I = 0xc

.field public static final AT_TRASH:I = 0xe

.field public static final LLTCT_ASSET:I = 0x2

.field public static final LLTCT_MISC:I = 0x1

.field public static final LLTCT_UNKNOWN:I = 0x0

.field public static final LLTST_ASSET:I = 0x2

.field public static final LLTST_FILE:I = 0x1

.field public static final LLTST_SIM_ESTATE:I = 0x4

.field public static final LLTST_SIM_INV_ITEM:I = 0x3

.field public static final LLTST_UNKNOWN:I = 0x0

.field public static final LLTS_ABORT:I = 0x3

.field public static final LLTS_DONE:I = 0x1

.field public static final LLTS_ERROR:I = -0x1

.field public static final LLTS_INSUFFICIENT_PERMISSIONS:I = -0x3

.field public static final LLTS_OK:I = 0x0

.field public static final LLTS_SKIP:I = 0x2

.field public static final LLTS_UNKNOWN_SOURCE:I = -0x2

.field public static final LLTTT_FILE:I = 0x1

.field public static final LLTTT_UNKNOWN:I = 0x0

.field public static final LLTTT_VFILE:I = 0x2


# instance fields
.field private final agentID:Ljava/util/UUID;

.field private final assetType:I

.field private final assetUUID:Ljava/util/UUID;

.field private final channelType:I

.field private currentSize:I

.field private data:[B

.field private final itemUUID:Ljava/util/UUID;

.field private nextPacket:I

.field private final ownerUUID:Ljava/util/UUID;

.field private final priority:F

.field private final queuedPackets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;",
            ">;"
        }
    .end annotation
.end field

.field private final sessionID:Ljava/util/UUID;

.field private size:I

.field private final sourceType:I

.field private status:I

.field private statusKnown:Z

.field private final taskUUID:Ljava/util/UUID;

.field private final transferUUID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;F)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->queuedPackets:Ljava/util/Map;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->agentID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->sessionID:Ljava/util/UUID;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->channelType()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->channelType:I

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->sourceType()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->sourceType:I

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->priority:F

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->assetUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->assetUUID:Ljava/util/UUID;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->assetType()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->assetType:I

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->ownerUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->itemUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->itemUUID:Ljava/util/UUID;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->taskUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->taskUUID:Ljava/util/UUID;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->transferUUID:Ljava/util/UUID;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->statusKnown:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->status:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->size:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->nextPacket:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->currentSize:I

    return-void
.end method

.method private RunQueuedPackets(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)V
    .locals 6

    const/4 v5, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->statusKnown:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->status:I

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->queuedPackets:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->queuedPackets:Ljava/util/Map;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->nextPacket:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;

    if-nez v0, :cond_3

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->statusKnown:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->status:I

    if-eqz v0, :cond_2

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->EndTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V

    :cond_2
    return-void

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->queuedPackets:Ljava/util/Map;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->nextPacket:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->nextPacket:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->nextPacket:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Data:[B

    array-length v1, v1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Data:[B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->data:[B

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->currentSize:I

    invoke-static {v2, v5, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->currentSize:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->currentSize:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Status:I

    if-eqz v1, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Status:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->status:I

    goto :goto_0
.end method


# virtual methods
.method HandleTransferInfo(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->statusKnown:Z

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Status:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->status:I

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Size:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->size:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->status:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->size:I

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->data:[B

    :cond_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->RunQueuedPackets(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)V

    return-void
.end method

.method HandleTransferPacket(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->queuedPackets:Ljava/util/Map;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Packet:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->RunQueuedPackets(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)V

    return-void
.end method

.method getAssetType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->assetType:I

    return v0
.end method

.method getAssetUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->assetUUID:Ljava/util/UUID;

    return-object v0
.end method

.method getChannelType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->channelType:I

    return v0
.end method

.method getData()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->data:[B

    return-object v0
.end method

.method getPriority()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->priority:F

    return v0
.end method

.method getStatus()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->status:I

    return v0
.end method

.method getTransferUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->transferUUID:Ljava/util/UUID;

    return-object v0
.end method

.method makeTransferRequest()Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;
    .locals 6

    const-wide/16 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->transferUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->TransferID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->channelType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->ChannelType:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->sourceType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->SourceType:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->priority:F

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Priority:F

    const/16 v1, 0x400

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->sourceType:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->agentID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->agentID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->sessionID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->sessionID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->taskUUID:Ljava/util/UUID;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->taskUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->taskUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->itemUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->itemUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->assetType:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Params:[B

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Params:[B

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->isReliable:Z

    return-object v0

    :cond_1
    invoke-virtual {v1, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method
