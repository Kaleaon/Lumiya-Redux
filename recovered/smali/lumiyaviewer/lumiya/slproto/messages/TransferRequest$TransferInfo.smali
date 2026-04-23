.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TransferInfo"
.end annotation


# instance fields
.field public ChannelType:I

.field public Params:[B

.field public Priority:F

.field public SourceType:I

.field public TransferID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
