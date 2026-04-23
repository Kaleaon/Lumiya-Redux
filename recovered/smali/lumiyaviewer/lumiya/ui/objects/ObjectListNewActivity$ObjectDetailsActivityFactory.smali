.class public Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectDetailsActivityFactory"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory$InstanceHolder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public createIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "selection"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    return-object v0
.end method

.method public getFragmentClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;

    return-object v0
.end method
