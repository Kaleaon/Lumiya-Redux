.class final synthetic Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;

.field private final synthetic -$f4:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f2:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f3:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f4:Ljava/lang/Object;

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f0:I

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPicksProfileTab_4543(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;ILandroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f3:Ljava/lang/Object;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->-$f4:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
