.class Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClearCacheTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private cacheDirs:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private progressDialog:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->progressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->cacheDirs:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->cacheDirs:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/FileUtils;->clearFolder(Ljava/io/File;)V

    goto :goto_0

    :cond_0
    return-object v2
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_SettingsFragment$ClearCacheTask_8620(Landroid/content/DialogInterface;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->cancel(Z)Z

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->isCacheDirUsed()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;)V

    :cond_1
    return-void
.end method

.method protected onPreExecute()V
    .locals 6

    const/4 v3, 0x1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getAvailableCacheDirs()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->cacheDirs:Lcom/google/common/collect/ImmutableList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;

    const v2, 0x7f0900bf

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$3;

    invoke-direct {v5, p0}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$3;-><init>(Ljava/lang/Object;)V

    const/4 v1, 0x0

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->progressDialog:Landroid/app/ProgressDialog;

    return-void
.end method
