.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageID"
.end annotation


# instance fields
.field public Codec:I

.field public ID:Ljava/util/UUID;

.field public Packets:I

.field public Size:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
