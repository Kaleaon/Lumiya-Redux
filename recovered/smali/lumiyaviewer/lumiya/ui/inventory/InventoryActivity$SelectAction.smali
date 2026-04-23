.class public final enum Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SelectAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

.field public static final enum applyFirstLife:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

.field public static final enum applyPickImage:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

.field public static final enum applyUserProfile:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;


# instance fields
.field public final subtitleResourceId:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const v2, 0x7f0902f8

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    const-string/jumbo v1, "applyUserProfile"

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyUserProfile:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    const-string/jumbo v1, "applyFirstLife"

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyFirstLife:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    const-string/jumbo v1, "applyPickImage"

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyPickImage:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyUserProfile:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyFirstLife:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyPickImage:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->subtitleResourceId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    return-object v0
.end method
