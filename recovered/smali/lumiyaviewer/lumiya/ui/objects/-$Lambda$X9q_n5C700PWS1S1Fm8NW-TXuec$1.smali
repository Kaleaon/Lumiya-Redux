.class final synthetic Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f0:Ljava/lang/Object;

    check-cast v0, Landroid/support/v7/app/AlertDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f2:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f3:Ljava/lang/Object;

    check-cast v3, Landroid/content/DialogInterface;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectPayDialog;->lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectPayDialog_4340(Landroid/support/v7/app/AlertDialog;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;Landroid/content/DialogInterface;Landroid/view/View;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->-$f3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;->$m$0(Landroid/view/View;)V

    return-void
.end method
