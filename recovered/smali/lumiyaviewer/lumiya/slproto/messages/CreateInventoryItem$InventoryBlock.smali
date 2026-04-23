.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InventoryBlock"
.end annotation


# instance fields
.field public CallbackID:I

.field public Description:[B

.field public FolderID:Ljava/util/UUID;

.field public InvType:I

.field public Name:[B

.field public NextOwnerMask:I

.field public TransactionID:Ljava/util/UUID;

.field public Type:I

.field public WearableType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
