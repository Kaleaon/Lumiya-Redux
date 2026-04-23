.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MapLayerReply$LayerData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/MapLayerReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayerData"
.end annotation


# instance fields
.field public Bottom:I

.field public ImageID:Ljava/util/UUID;

.field public Left:I

.field public Right:I

.field public Top:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
