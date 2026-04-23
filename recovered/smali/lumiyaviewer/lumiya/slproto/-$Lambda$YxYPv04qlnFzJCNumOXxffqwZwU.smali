.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->lambda$-com_lumiyaviewer_lumiya_slproto_SLThreadingCircuit_1833(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;->$m$0()V

    return-void
.end method
