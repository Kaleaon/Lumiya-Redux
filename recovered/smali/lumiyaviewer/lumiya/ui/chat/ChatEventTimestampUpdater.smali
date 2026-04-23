.class public Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;
    }
.end annotation


# static fields
.field private static final TIMESTAMP_UPDATE_INTERVAL:J = 0xea60L


# instance fields
.field private final context:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private final updateRunnable:Ljava/lang/Runnable;

.field private updateRunnablePosted:Z

.field private final viewHolders:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->updateRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Ljava/util/Set;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->viewHolders:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->updateRunnablePosted:Z

    return p1
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->updateRunnablePosted:Z

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->viewHolders:Ljava/util/Set;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->updateRunnable:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public addViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->viewHolders:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->updateRunnablePosted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->updateRunnablePosted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->updateRunnable:Ljava/lang/Runnable;

    const-wide/32 v2, 0xea60

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public removeViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->viewHolders:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
