.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_9859(Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;->$m$0()V

    return-void
.end method
