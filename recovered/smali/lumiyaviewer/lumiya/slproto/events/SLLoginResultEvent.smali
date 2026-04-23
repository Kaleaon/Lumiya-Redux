.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;
.super Ljava/lang/Object;


# instance fields
.field public final activeAgentUUID:Ljava/util/UUID;

.field public final message:Ljava/lang/String;

.field public final success:Z


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->success:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->message:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->activeAgentUUID:Ljava/util/UUID;

    return-void
.end method
