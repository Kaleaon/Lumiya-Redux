.class Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;
.super Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NavDrawerActivityItem"
.end annotation


# instance fields
.field final activityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(IIILjava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;-><init>(III)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;->activityClass:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/Context;)V
    .locals 3

    new-instance v1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;->activityClass:Ljava/lang/Class;

    invoke-direct {v1, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v0, 0x20000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v2, "activeAgentUUID"

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
