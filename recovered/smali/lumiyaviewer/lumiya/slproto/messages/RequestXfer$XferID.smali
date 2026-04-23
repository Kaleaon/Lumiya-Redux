.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "XferID"
.end annotation


# instance fields
.field public DeleteOnCompletion:Z

.field public FilePath:I

.field public Filename:[B

.field public ID:J

.field public UseBigPackets:Z

.field public VFileID:Ljava/util/UUID;

.field public VFileType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
