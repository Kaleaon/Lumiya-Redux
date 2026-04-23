.class public final enum Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InventorySaveType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

.field public static final enum InventoryOffer:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

.field public static final enum NotecardItem:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    const-string/jumbo v1, "NotecardItem"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->NotecardItem:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    const-string/jumbo v1, "InventoryOffer"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->InventoryOffer:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->NotecardItem:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->InventoryOffer:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    return-object v0
.end method
