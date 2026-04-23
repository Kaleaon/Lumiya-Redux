.class final synthetic Lcom/lumiyaviewer/lumiya/sync/-$Lambda$WmOOQW2pFqpMpXOyAP45N3kh7mE;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/-$Lambda$WmOOQW2pFqpMpXOyAP45N3kh7mE;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->lambda$-com_lumiyaviewer_lumiya_sync_CloudSyncServiceConnection_8286()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/sync/-$Lambda$WmOOQW2pFqpMpXOyAP45N3kh7mE;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/sync/-$Lambda$WmOOQW2pFqpMpXOyAP45N3kh7mE;->$m$0()V

    return-void
.end method
