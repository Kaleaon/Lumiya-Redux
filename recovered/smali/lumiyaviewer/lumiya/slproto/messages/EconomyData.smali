.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;
    }
.end annotation


# instance fields
.field public Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEconomyData(Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x19

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->ObjectCapacity:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->ObjectCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceEnergyUnit:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceObjectClaim:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PricePublicObjectDecay:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PricePublicObjectDelete:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceParcelClaim:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceParcelClaimFactor:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceUpload:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceRentLight:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->TeleportMinPrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->TeleportPriceExponent:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->EnergyEfficiency:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceObjectRent:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceObjectScaleFactor:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceParcelRent:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceGroupCreate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->ObjectCapacity:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->ObjectCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceEnergyUnit:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceObjectClaim:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PricePublicObjectDecay:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PricePublicObjectDelete:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceParcelClaim:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceParcelClaimFactor:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceUpload:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceRentLight:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->TeleportMinPrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->TeleportPriceExponent:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->EnergyEfficiency:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceObjectRent:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceObjectScaleFactor:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceParcelRent:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceGroupCreate:I

    return-void
.end method
