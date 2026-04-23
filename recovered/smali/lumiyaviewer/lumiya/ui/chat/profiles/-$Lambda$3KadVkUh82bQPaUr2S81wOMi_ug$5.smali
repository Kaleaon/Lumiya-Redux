.class final synthetic Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment_8181(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
