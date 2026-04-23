.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptRequestInbound$DataBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptRequestInbound;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataBlock"
.end annotation


# instance fields
.field public ChannelID:Ljava/util/UUID;

.field public IntValue:I

.field public ItemID:Ljava/util/UUID;

.field public StringValue:[B

.field public TaskID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
