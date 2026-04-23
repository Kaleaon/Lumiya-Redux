.class final synthetic Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f2:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f0:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f3:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->lambda$-com_lumiyaviewer_lumiya_ui_chat_PayUserFragment_3721(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;ILjava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->-$f3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
