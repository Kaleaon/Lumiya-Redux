.class Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/StreamingMediaService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioFocusChangeHandler"
.end annotation


# instance fields
.field private final streamingMediaService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/StreamingMediaService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/StreamingMediaService;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;->streamingMediaService:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/StreamingMediaService;Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;-><init>(Lcom/lumiyaviewer/lumiya/StreamingMediaService;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;->streamingMediaService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;

    if-eqz v0, :cond_0

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->-wrap0(Lcom/lumiyaviewer/lumiya/StreamingMediaService;I)V

    :cond_0
    return-void
.end method
