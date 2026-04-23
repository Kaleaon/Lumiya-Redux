.class public Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;


# instance fields
.field public final agentUUID:Ljava/util/UUID;

.field public final appVersionCode:I


# direct methods
.method public constructor <init>(ILjava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;->appVersionCode:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;->agentUUID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "appVersionCode"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;->appVersionCode:I

    const-string/jumbo v0, "agentUUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;->agentUUID:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;->appVersionCode:I

    const-string/jumbo v2, "appVersionCode"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "agentUUID"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
