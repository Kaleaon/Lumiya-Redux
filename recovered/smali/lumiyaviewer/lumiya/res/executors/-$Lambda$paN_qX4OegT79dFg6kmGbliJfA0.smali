.class final synthetic Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0;->-$f0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->lambda$-com_lumiyaviewer_lumiya_res_executors_WeakExecutor_531(Ljava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object v0

    return-object v0
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0;->$m$0(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object v0

    return-object v0
.end method
