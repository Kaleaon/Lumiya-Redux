.class final synthetic Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;->-$f2:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;->-$f0:I

    invoke-static {v0, v1, v2, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_25106(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;ILandroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
