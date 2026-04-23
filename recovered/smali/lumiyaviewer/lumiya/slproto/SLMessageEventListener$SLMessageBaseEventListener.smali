.class public abstract Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SLMessageBaseEventListener"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    return-void
.end method

.method public onMessageTimeout(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    return-void
.end method
