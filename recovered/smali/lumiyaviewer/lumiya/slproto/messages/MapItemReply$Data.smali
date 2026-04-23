.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemReply$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public Extra:I

.field public Extra2:I

.field public ID:Ljava/util/UUID;

.field public Name:[B

.field public X:I

.field public Y:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
