.class final synthetic Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;->-$f0:Ljava/lang/Object;

    check-cast v0, Landroid/app/Activity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;->-$f2:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-static {v0, v1, v2, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportHomeDialog;->lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportHomeDialog_956(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
