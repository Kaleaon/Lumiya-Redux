.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InventoryData"
.end annotation


# instance fields
.field public CallbackID:I

.field public NewFolderID:Ljava/util/UUID;

.field public NewName:[B

.field public OldAgentID:Ljava/util/UUID;

.field public OldItemID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
