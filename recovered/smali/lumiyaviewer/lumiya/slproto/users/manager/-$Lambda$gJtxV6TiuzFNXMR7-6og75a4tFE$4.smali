.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;->-$f0:I

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_6669(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;I)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;->$m$0()V

    return-void
.end method
