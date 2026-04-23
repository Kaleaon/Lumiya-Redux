.class public Lcom/lumiyaviewer/lumiya/ui/common/ConnectionFragment;
.super Landroid/support/v4/app/Fragment;


# static fields
.field public static final EXTRA_ACTIVE_AGENT_UUID:Ljava/lang/String; = "activeAgentUUID"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method public static getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;
    .locals 2
    .param p0    # Landroid/content/Intent;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    const-string/jumbo v0, "activeAgentUUID"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method
