.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TransferInfoData"
.end annotation


# instance fields
.field public ChannelType:I

.field public Params:[B

.field public Size:I

.field public Status:I

.field public TargetType:I

.field public TransferID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
