.class final synthetic Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f1:Ljava/lang/Object;

    check-cast v1, Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f2:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f3:Ljava/lang/Object;

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportProgressDialog_1322(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/util/UUID;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->-$f3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;->$m$0()V

    return-void
.end method
