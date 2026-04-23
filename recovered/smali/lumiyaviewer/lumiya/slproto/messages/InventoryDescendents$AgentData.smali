.class public Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public Descendents:I

.field public FolderID:Ljava/util/UUID;

.field public OwnerID:Ljava/util/UUID;

.field public Version:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
