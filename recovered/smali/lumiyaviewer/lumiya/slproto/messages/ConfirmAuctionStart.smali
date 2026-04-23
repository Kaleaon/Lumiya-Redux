.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;
    }
.end annotation


# instance fields
.field public AuctionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->AuctionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x18

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleConfirmAuctionStart(Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x1a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->AuctionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->AuctionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;->AuctionID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->AuctionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;->ParcelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->AuctionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart$AuctionData;->AuctionID:I

    return-void
.end method
