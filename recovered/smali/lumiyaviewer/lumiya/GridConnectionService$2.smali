.class Lcom/lumiyaviewer/lumiya/GridConnectionService$2;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/GridConnectionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/GridConnectionService;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$2;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.lumiyaviewer.lumiya.cloud"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-get1()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-get1()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-get1()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getActiveAgentUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$2;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-wrap1(Lcom/lumiyaviewer/lumiya/GridConnectionService;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    :cond_0
    return-void
.end method
