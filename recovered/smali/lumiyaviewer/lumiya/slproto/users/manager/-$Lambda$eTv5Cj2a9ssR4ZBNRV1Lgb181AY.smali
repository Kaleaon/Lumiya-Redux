.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$eTv5Cj2a9ssR4ZBNRV1Lgb181AY;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$eTv5Cj2a9ssR4ZBNRV1Lgb181AY;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;->-com_lumiyaviewer_lumiya_slproto_users_manager_ChatterGroupSubscription-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$eTv5Cj2a9ssR4ZBNRV1Lgb181AY;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onData(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$eTv5Cj2a9ssR4ZBNRV1Lgb181AY;->$m$0(Ljava/lang/Object;)V

    return-void
.end method
