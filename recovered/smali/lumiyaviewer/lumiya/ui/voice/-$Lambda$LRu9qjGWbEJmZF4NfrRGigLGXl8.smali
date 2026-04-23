.class final synthetic Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnHoverListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;

    invoke-static {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->lambda$-com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_6407(Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8;->$m$0(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
