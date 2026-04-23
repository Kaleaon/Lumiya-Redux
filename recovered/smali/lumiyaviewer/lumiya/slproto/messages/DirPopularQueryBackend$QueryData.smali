.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryData"
.end annotation


# instance fields
.field public EstateID:I

.field public Godlike:Z

.field public QueryFlags:I

.field public QueryID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
