.class final synthetic Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;->-$f1:Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;->-$f2:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->lambda$-com_lumiyaviewer_lumiya_react_RequestProcessor_2159(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;->$m$0()V

    return-void
.end method
