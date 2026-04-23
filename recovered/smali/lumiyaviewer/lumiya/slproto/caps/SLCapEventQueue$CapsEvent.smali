.class public Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CapsEvent"
.end annotation


# instance fields
.field public eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

.field public eventType:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_0
    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventType:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    return-void

    :catch_0
    move-exception v0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->UnknownCapsEvent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventType:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    goto :goto_0
.end method
