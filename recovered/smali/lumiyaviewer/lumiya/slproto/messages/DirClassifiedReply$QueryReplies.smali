.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryReplies"
.end annotation


# instance fields
.field public ClassifiedFlags:I

.field public ClassifiedID:Ljava/util/UUID;

.field public CreationDate:I

.field public ExpirationDate:I

.field public Name:[B

.field public PriceForListing:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
