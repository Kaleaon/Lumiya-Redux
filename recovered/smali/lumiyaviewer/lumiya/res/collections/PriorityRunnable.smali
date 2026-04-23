.class public abstract Lcom/lumiyaviewer/lumiya/res/collections/PriorityRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/utils/HasPriority;


# instance fields
.field private final priority:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/res/collections/PriorityRunnable;->priority:I

    return-void
.end method


# virtual methods
.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/res/collections/PriorityRunnable;->priority:I

    return v0
.end method
