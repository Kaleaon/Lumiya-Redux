.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$3;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->-com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice-mthref-3(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$3;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onLLSDXMLResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$3;->$m$0(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void
.end method
