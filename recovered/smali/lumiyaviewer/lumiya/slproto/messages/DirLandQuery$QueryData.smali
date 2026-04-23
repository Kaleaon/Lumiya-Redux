.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryData"
.end annotation


# instance fields
.field public Area:I

.field public Price:I

.field public QueryFlags:I

.field public QueryID:Ljava/util/UUID;

.field public QueryStart:I

.field public SearchType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
