.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HeaderData"
.end annotation


# instance fields
.field public CompoundMsgID:Ljava/util/UUID;

.field public FirstDetachAll:Z

.field public TotalObjects:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
