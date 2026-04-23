.class Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->startConnecting(ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

.field final synthetic val$location:Ljava/lang/String;

.field final synthetic val$pauseBeforeConnecting:Z


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;ZLjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->val$pauseBeforeConnecting:Z

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->val$location:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->val$pauseBeforeConnecting:Z

    if-eqz v0, :cond_0

    const-wide/16 v0, 0xbb8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->-get0(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->val$location:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->-set0(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Ljava/lang/Thread;)Ljava/lang/Thread;

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
