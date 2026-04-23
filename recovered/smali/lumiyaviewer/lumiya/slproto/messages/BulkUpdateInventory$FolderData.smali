.class public Lcom/lumiyaviewer/lumiya/slproto/messages/BulkUpdateInventory$FolderData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/BulkUpdateInventory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FolderData"
.end annotation


# instance fields
.field public FolderID:Ljava/util/UUID;

.field public Name:[B

.field public ParentID:Ljava/util/UUID;

.field public Type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
