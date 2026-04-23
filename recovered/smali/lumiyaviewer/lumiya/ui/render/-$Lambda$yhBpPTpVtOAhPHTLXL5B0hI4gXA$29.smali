.class final synthetic Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:F

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;->-$f2:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;->-$f0:F

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_80726(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    return-void
.end method

.method public synthetic constructor <init>(FLjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;->-$f0:F

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;->$m$0()V

    return-void
.end method
