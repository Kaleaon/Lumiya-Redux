.class final synthetic Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;->-$f0:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_5461(I)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;->$m$0()V

    return-void
.end method
