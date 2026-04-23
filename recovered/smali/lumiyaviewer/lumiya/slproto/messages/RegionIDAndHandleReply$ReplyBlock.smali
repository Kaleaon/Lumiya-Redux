.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReplyBlock"
.end annotation


# instance fields
.field public RegionHandle:J

.field public RegionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
