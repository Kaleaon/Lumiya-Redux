.class public Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$1;,
        Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final inventoryOfferMessageId:J

.field public final notecardUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final saveItemName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final saveItemUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final saveType:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->values()[Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveType:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemUUID:Ljava/util/UUID;

    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->notecardUUID:Ljava/util/UUID;

    :goto_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    :goto_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->inventoryOfferMessageId:J

    return-void

    :cond_0
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemUUID:Ljava/util/UUID;

    goto :goto_0

    :cond_1
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->notecardUUID:Ljava/util/UUID;

    goto :goto_1

    :cond_2
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    goto :goto_2
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;Ljava/util/UUID;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;J)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveType:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemUUID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemName:Ljava/lang/String;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->notecardUUID:Ljava/util/UUID;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    iput-wide p6, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->inventoryOfferMessageId:J

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveType:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->notecardUUID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->notecardUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    if-eqz v0, :cond_2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_2
    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->inventoryOfferMessageId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    return-void

    :cond_0
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_1

    :cond_2
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_2
.end method
