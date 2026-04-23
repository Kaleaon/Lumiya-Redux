.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetStats"
.end annotation


# instance fields
.field public Bytes:I

.field public Compressed:I

.field public Packets:I

.field public Savings:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
