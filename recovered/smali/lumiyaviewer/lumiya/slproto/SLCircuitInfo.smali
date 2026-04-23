.class public Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;
.super Ljava/lang/Object;


# instance fields
.field public final agentID:Ljava/util/UUID;

.field final circuitCode:I

.field public final sessionID:Ljava/util/UUID;

.field final socketAddress:Ljava/net/SocketAddress;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/net/InetSocketAddress;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simPort:I

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->socketAddress:Ljava/net/SocketAddress;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->circuitCode:I

    return-void
.end method
