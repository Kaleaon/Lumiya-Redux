.class public Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserOnlineStatusChanged;
.super Ljava/lang/Object;


# instance fields
.field public final agentUUID:Ljava/util/UUID;

.field public final isOnline:Z

.field public final userUUID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserOnlineStatusChanged;->agentUUID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserOnlineStatusChanged;->userUUID:Ljava/util/UUID;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserOnlineStatusChanged;->isOnline:Z

    return-void
.end method
