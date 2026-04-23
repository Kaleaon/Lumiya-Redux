.class final synthetic Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;->lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity$1_50098(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;->$m$0()V

    return-void
.end method
