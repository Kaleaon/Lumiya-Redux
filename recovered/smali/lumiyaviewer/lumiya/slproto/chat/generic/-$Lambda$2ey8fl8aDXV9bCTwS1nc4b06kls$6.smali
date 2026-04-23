.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/view/MenuItem;)Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;->-$f1:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->lambda$-com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent_21084(Landroid/content/Context;Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;->$m$0(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method
