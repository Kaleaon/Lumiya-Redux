.class public Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "LoadResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation
.end field

.field final fromId:J

.field final hasMore:Z


# direct methods
.method public constructor <init>(Ljava/util/List;ZJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TE;>;ZJ)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->entries:Ljava/util/List;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->hasMore:Z

    iput-wide p3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->fromId:J

    return-void
.end method
