.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InventoryData"
.end annotation


# instance fields
.field public ItemID:Ljava/util/UUID;

.field public LocalID:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
