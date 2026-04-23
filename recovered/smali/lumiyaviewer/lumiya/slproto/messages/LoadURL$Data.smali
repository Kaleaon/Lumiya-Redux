.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public Message:[B

.field public ObjectID:Ljava/util/UUID;

.field public ObjectName:[B

.field public OwnerID:Ljava/util/UUID;

.field public OwnerIsGroup:Z

.field public URL:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
