.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;
.super Ljava/lang/Object;


# instance fields
.field public done:Z

.field public first:Z

.field public progress:I


# direct methods
.method public constructor <init>(ZZI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;->first:Z

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;->done:Z

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;->progress:I

    return-void
.end method
