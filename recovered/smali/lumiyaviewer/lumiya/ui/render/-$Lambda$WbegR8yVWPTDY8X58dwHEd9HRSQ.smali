.class final synthetic Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView-mthref-0(Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ;->$m$0()V

    return-void
.end method
