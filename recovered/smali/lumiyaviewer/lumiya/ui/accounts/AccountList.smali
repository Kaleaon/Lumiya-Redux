.class public Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;
    }
.end annotation


# instance fields
.field private accounts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->context:Landroid/content/Context;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->loadAccounts()V

    return-void
.end method


# virtual methods
.method public addNewAccount(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public deleteAccount(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public findAccount(Ljava/lang/String;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getLoginName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public findOrAddAccount(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getLoginName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->setPasswordHash(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->savePreferences()V

    return-object v0

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-direct {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->savePreferences()V

    return-object v0
.end method

.method public getAccountList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getAccountList(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
            ">;"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object p1
.end method

.method public loadAccounts()V
    .locals 7

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "accounts_count"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    :goto_0
    if-ge v0, v2, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "account_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public savePreferences()V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v0, "accounts_count"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-interface {v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "account_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->saveToPreferences(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
