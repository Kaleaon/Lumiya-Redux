.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventory$InventoryBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InventoryBlock"
.end annotation


# instance fields
.field public InventoryID:Ljava/util/UUID;

.field public Type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
