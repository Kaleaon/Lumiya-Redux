.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;->-$f0:I

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->lambda$-com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice_12525(ILcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onLLSDXMLResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;->$m$0(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void
.end method
