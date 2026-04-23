.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->-wrap1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
