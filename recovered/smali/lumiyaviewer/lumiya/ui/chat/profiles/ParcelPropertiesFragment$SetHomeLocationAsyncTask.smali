.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetHomeLocationAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private progressDialog:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SetHomeLocation()Z

    move-result v0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902fc

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :goto_0
    return-void

    :cond_1
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902fd

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    const v2, 0x7f090302

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v1, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    return-void
.end method
