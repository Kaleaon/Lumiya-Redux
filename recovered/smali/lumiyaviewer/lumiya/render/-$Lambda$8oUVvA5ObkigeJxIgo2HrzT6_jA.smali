.class final synthetic Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->-com_lumiyaviewer_lumiya_render_WorldViewRenderer-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onData(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA;->$m$0(Ljava/lang/Object;)V

    return-void
.end method
