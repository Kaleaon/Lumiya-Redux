.class final synthetic Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:F

.field private final synthetic -$f1:F

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;->-$f2:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;->-$f0:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;->-$f1:F

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_5758(FF)V

    return-void
.end method

.method public synthetic constructor <init>(FFLjava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;->-$f0:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;->-$f1:F

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;->$m$0()V

    return-void
.end method
