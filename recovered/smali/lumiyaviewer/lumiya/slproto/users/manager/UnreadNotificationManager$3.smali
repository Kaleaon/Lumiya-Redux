.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$3;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Ljava/lang/Boolean;)V
    .locals 2
    .param p1    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$3;->onRequest(Ljava/lang/Boolean;)V

    return-void
.end method
