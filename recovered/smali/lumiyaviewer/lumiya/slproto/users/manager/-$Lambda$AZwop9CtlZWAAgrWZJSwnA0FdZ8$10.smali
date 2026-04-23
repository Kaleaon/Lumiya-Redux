.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:J

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;->-$f0:J

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_9602(J)V

    return-void
.end method

.method public synthetic constructor <init>(JLjava/lang/Object;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;->-$f0:J

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;->$m$0()V

    return-void
.end method
