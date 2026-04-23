.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;
.super Ljava/lang/Object;


# instance fields
.field public final newBalance:I

.field public final oldBalance:I

.field public final oldBalanceValid:Z


# direct methods
.method public constructor <init>(ZII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->oldBalanceValid:Z

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->oldBalance:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->newBalance:I

    return-void
.end method
