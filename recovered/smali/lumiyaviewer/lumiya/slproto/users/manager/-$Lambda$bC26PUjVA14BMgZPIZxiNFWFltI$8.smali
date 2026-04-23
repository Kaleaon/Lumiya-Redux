.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Z

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f2:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f3:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f0:Z

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_13379(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f0:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->-$f3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;->$m$0()V

    return-void
.end method
