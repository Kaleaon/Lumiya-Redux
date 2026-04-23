.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LogTextMessage$DataBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/LogTextMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataBlock"
.end annotation


# instance fields
.field public FromAgentId:Ljava/util/UUID;

.field public GlobalX:D

.field public GlobalY:D

.field public Message:[B

.field public Time:I

.field public ToAgentId:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
