.class final Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog;->askForObjectDerez(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;Ljava/util/UUID;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$agentID:Ljava/util/UUID;

.field final synthetic val$derezAction:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

.field final synthetic val$localID:I


# direct methods
.method constructor <init>(Ljava/util/UUID;ILcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;->val$agentID:Ljava/util/UUID;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;->val$localID:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;->val$derezAction:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;->val$agentID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;->val$localID:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;->val$derezAction:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->deRezDestination:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->DerezObject(ILcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;)V

    :cond_0
    return-void
.end method
