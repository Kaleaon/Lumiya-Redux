.class public Lcom/lumiyaviewer/lumiya/slproto/messages/InternalScriptMail$DataBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/InternalScriptMail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataBlock"
.end annotation


# instance fields
.field public Body:[B

.field public From:[B

.field public Subject:[B

.field public To:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
