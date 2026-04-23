.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$2;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->-com_lumiyaviewer_lumiya_slproto_users_manager_ChatterUserSubscription-mthref-2(Ljava/lang/Float;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$2;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onData(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$2;->$m$0(Ljava/lang/Object;)V

    return-void
.end method
