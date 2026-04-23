.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$2;
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationKey:Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
