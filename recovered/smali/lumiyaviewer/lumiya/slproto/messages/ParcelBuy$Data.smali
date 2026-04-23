.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public Final:Z

.field public GroupID:Ljava/util/UUID;

.field public IsGroupOwned:Z

.field public LocalID:I

.field public RemoveContribution:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
