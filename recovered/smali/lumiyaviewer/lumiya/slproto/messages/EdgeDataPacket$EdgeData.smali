.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EdgeDataPacket$EdgeData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/EdgeDataPacket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EdgeData"
.end annotation


# instance fields
.field public Direction:I

.field public LayerData:[B

.field public LayerType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
