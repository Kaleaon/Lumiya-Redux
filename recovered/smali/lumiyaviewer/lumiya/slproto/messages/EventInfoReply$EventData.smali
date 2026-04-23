.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EventData"
.end annotation


# instance fields
.field public Amount:I

.field public Category:[B

.field public Cover:I

.field public Creator:[B

.field public Date:[B

.field public DateUTC:I

.field public Desc:[B

.field public Duration:I

.field public EventFlags:I

.field public EventID:I

.field public GlobalPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

.field public Name:[B

.field public SimName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
