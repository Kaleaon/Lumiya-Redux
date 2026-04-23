.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticesListReply$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticesListReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public AssetType:I

.field public FromName:[B

.field public HasAttachment:Z

.field public NoticeID:Ljava/util/UUID;

.field public Subject:[B

.field public Timestamp:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
