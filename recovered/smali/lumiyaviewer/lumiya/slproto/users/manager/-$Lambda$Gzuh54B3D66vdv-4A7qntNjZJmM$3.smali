.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;->-$f1:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;->-$f0:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;->-$f2:Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SubscribableList_2280(Ljava/util/List;ILjava/lang/Object;)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$Gzuh54B3D66vdv-4A7qntNjZJmM$3;->$m$0()V

    return-void
.end method
