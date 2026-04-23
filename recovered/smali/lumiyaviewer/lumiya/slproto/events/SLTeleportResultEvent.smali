.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;
.super Ljava/lang/Object;


# instance fields
.field public message:Ljava/lang/String;

.field public success:Z


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;->success:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;->message:Ljava/lang/String;

    return-void
.end method
