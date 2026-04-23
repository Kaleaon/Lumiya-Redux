.class Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "XferListenerInvocation"
.end annotation


# instance fields
.field private listener:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;

.field private tag:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;->tag:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;->listener:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;

    return-void
.end method


# virtual methods
.method public invokeListener(Ljava/lang/String;[B)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;->listener:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$XferListenerInvocation;->tag:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;->onXferComplete(Ljava/lang/Object;Ljava/lang/String;[B)V

    return-void
.end method
