.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageReply$DataBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataBlock"
.end annotation


# instance fields
.field public Data:[B

.field public FromAddress:[B

.field public MailFilter:[B

.field public More:I

.field public ObjectID:Ljava/util/UUID;

.field public Subject:[B

.field public Time:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
