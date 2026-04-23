.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventoryAck$InfoBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventoryAck;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InfoBlock"
.end annotation


# instance fields
.field public InventoryID:Ljava/util/UUID;

.field public TransactionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
