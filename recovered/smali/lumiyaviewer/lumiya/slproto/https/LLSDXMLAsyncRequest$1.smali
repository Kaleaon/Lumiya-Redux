.class Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;

.field final synthetic val$request:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

.field final synthetic val$resultListener:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;->val$request:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;->val$resultListener:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;->val$url:Ljava/lang/String;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;->val$request:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$1;->val$resultListener:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;->onLLSDXMLResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0
.end method
