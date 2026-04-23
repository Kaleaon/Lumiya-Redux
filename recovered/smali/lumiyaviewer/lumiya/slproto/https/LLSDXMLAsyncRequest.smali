.class public Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
