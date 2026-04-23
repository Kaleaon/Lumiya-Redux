.class public Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;
    }
.end annotation


# instance fields
.field public final errorMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final pluginVersionCode:I

.field public final status:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;Ljava/lang/String;)V
    .locals 0
    .param p2    # Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->pluginVersionCode:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->status:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->errorMessage:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "pluginVersionCode"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->pluginVersionCode:I

    const-string/jumbo v0, "status"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->status:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    const-string/jumbo v0, "errorMessage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->errorMessage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->pluginVersionCode:I

    const-string/jumbo v2, "pluginVersionCode"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->status:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "status"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->errorMessage:Ljava/lang/String;

    const-string/jumbo v2, "errorMessage"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
