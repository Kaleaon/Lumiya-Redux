.class public Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/text/TextWatcher;
.implements Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;


# static fields
.field private static final KEY_CLIENT_ID:Ljava/lang/String; = "client_id"

.field private static final KEY_LOGIN:Ljava/lang/String; = "login"

.field private static final KEY_PASSWORD:Ljava/lang/String; = "password"

.field private static final KEY_SAVE_PASSWORD:Ljava/lang/String; = "save_password"

.field private static final KEY_SELECTED_GRID:Ljava/lang/String; = "selected_grid"

.field private static final KEY_TOS_ACCEPTED:Ljava/lang/String; = "tos_accepted"


# instance fields
.field private accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

.field private enableAutoClear:Z

.field private gridDisplayAdapter:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

.field private gridDisplayList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;"
        }
    .end annotation
.end field

.field private gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

.field private lastSelectedGrid:I

.field private lastSelectedGridUUID:Ljava/util/UUID;

.field private loggingIn:Z

.field private menuItems:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;)Lcom/lumiyaviewer/lumiya/ui/grids/GridList;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGrid:I

    return v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;I)I
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGrid:I

    return p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;Ljava/util/UUID;)Ljava/util/UUID;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGridUUID:Ljava/util/UUID;

    return-object p1
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;-><init>()V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->loggingIn:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGrid:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayList:Ljava/util/List;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayAdapter:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->menuItems:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method private CheckTOSAndLogin()V
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string/jumbo v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :cond_0
    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getSelectedGrid()Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    move-result-object v1

    const-string/jumbo v2, "tos_accepted"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->isLindenGrid()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->DoLogin()V

    :goto_0
    return-void

    :cond_2
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x5

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method private DoLogin()V
    .locals 14

    const v13, 0x7f0902e2

    const/4 v7, 0x0

    const/4 v9, 0x1

    const/4 v3, 0x0

    const v6, 0x7f1001ca

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v10

    const v0, 0x7f1001c9

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getSelectedGrid()Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    move-result-object v11

    const v0, 0x7f1001cc

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v12

    const-string/jumbo v0, ""

    invoke-virtual {p0, v13}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    const-string/jumbo v0, "password"

    const-string/jumbo v2, ""

    invoke-interface {v10, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move v8, v9

    :goto_0
    if-nez v8, :cond_3

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;->getPasswordHash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Login: not using saved hash, password = "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", new hash: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    move-object v1, v0

    :goto_1
    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    if-eqz v12, :cond_5

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/SingleLineTransformationMethod;->getInstance()Landroid/text/method/SingleLineTransformationMethod;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0, v13}, Landroid/widget/EditText;->setText(I)V

    :goto_2
    iput-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    const-string/jumbo v0, "client_id"

    const-string/jumbo v2, ""

    invoke-interface {v10, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v2, "start_location"

    const-string/jumbo v6, "last"

    invoke-interface {v0, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getSaveUserName()Z

    move-result v2

    if-eqz v12, :cond_6

    move v0, v2

    :goto_3
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const-string/jumbo v13, "login"

    if-eqz v2, :cond_7

    move-object v3, v4

    :goto_4
    invoke-interface {v10, v13, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string/jumbo v3, "save_password"

    invoke-interface {v10, v3, v12}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    if-eqz v8, :cond_0

    xor-int/lit8 v3, v0, 0x1

    if-eqz v3, :cond_1

    :cond_0
    const-string/jumbo v8, "password"

    if-eqz v0, :cond_8

    move-object v3, v1

    :goto_5
    invoke-interface {v10, v8, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_1
    const-string/jumbo v3, ""

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "client_id"

    invoke-interface {v10, v5, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_6
    const-string/jumbo v5, "selected_grid"

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v10, v5, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    if-eqz v0, :cond_9

    move-object v0, v1

    :goto_7
    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v2, v4, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->findOrAddAccount(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    :cond_2
    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;-><init>(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_8
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLoginStartLocation()Ljava/lang/String;

    move-result-object v0

    :goto_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Start location (LoginActivity): "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iput-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->loggingIn:Z

    new-instance v2, Landroid/content/Intent;

    const-class v5, Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-direct {v2, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v5, "com.lumiyaviewer.lumiya.ACTION_LOGIN"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v5, "login"

    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v4, "password"

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "client_id"

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "start_location"

    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v0, "login_url"

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getLoginURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v0, "grid_name"

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-direct {p0, v9}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->showProgressView(Z)V

    const v0, 0x7f1001d1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f09031d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v4, v2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->findAccount(Ljava/lang/String;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getPasswordHash()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getPasswordHash()Ljava/lang/String;

    move-result-object v0

    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Login: using saved hash, hash = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    move-object v1, v0

    goto/16 :goto_1

    :cond_5
    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    :cond_6
    move v0, v3

    goto/16 :goto_3

    :cond_7
    const-string/jumbo v3, ""

    goto/16 :goto_4

    :cond_8
    const-string/jumbo v3, ""

    goto/16 :goto_5

    :cond_9
    const-string/jumbo v0, ""

    goto/16 :goto_7

    :catch_0
    move-exception v0

    move-object v0, v7

    goto/16 :goto_8

    :cond_a
    move-object v0, v6

    goto/16 :goto_9

    :cond_b
    move-object v3, v5

    goto/16 :goto_6

    :cond_c
    move v8, v3

    goto/16 :goto_0
.end method

.method private checkIfGridAvailable()V
    .locals 4

    const-string/jumbo v0, "LoginActivity: checking if grid is available"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getActiveAgentUUID()Ljava/util/UUID;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "LoginActivity: connectionState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v1, v2, :cond_0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "LoginActivity: grid available and connected"

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startChatActivity(Ljava/util/UUID;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->finish()V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->updateConnectingStatus()V

    return-void
.end method

.method private getSaveUserName()Z
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "noSaveUserName"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private getSelectedGrid()Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;
    .locals 2

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getDefaultGrid()Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    move-result-object v0

    goto :goto_0
.end method

.method private loadSavedLogin()V
    .locals 7

    const v3, 0x7f1001c9

    const/4 v6, 0x1

    const v5, 0x7f1001ca

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getSaveUserName()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "password"

    const-string/jumbo v2, ""

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v3, "login"

    const-string/jumbo v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001cc

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    const-string/jumbo v3, "save_password"

    invoke-interface {v1, v3, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    const-string/jumbo v0, ""

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/SingleLineTransformationMethod;->getInstance()Landroid/text/method/SingleLineTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const v1, 0x7f0902e2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(I)V

    :goto_0
    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    return-void

    :cond_0
    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private progressViewVisible()Z
    .locals 2

    const/4 v0, 0x0

    const v1, 0x7f1001d3

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private setSelectedGrid()V
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "selected_grid"

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridIndex(Ljava/util/UUID;)I

    move-result v1

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGrid:I

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGridUUID:Ljava/util/UUID;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private showProgressView(Z)V
    .locals 6

    const v5, 0x7f1001d3

    const v4, 0x7f1001c6

    const/16 v2, 0x8

    const/4 v1, 0x0

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz v0, :cond_0

    if-eqz v3, :cond_0

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz p1, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_2

    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->updateMenuItems()V

    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v2, v1

    goto :goto_1
.end method

.method private startChatActivity(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private updateConnectingStatus()V
    .locals 7

    const v6, 0x7f1001d1

    const/4 v5, 0x0

    const/4 v1, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->loggingIn:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v3, v4, :cond_0

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->showProgressView(Z)V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getIsReconnecting()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getReconnectAttempt()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v5

    const v2, 0x7f09031e

    invoke-virtual {p0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move v0, v1

    :cond_0
    :goto_0
    if-nez v0, :cond_1

    invoke-direct {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->showProgressView(Z)V

    :cond_1
    return-void

    :cond_2
    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f09031d

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    move v0, v1

    goto :goto_0
.end method

.method private updateMenuItems()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->progressViewVisible()Z

    move-result v0

    xor-int/lit8 v1, v0, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->menuItems:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    if-eqz v0, :cond_0

    const v0, 0x7f1001ca

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0902e2

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    :cond_0
    return-void
.end method

.method public getPreferences(I)Landroid/content/SharedPreferences;
    .locals 1

    const-string/jumbo v0, "LoginActivity"

    invoke-virtual {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public handleLoginResult(Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    const/4 v4, 0x1

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->loggingIn:Z

    const-string/jumbo v0, "LoginProgressActivity: result.success = %b"

    new-array v1, v4, [Ljava/lang/Object;

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->success:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->success:Z

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->activeAgentUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startChatActivity(Ljava/util/UUID;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->finish()V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->progressViewVisible()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "Login to Second Life has failed."

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->message:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->message:Ljava/lang/String;

    :cond_1
    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string/jumbo v2, "Login failed"

    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v1, v0}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v1, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :cond_2
    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->showProgressView(Z)V

    goto :goto_0
.end method

.method public handleReconnectingEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLReconnectingEvent;)V
    .locals 0
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->updateConnectingStatus()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_login_LoginActivity_5985()V
    .locals 4

    const v3, 0x7f1001c7

    const/16 v2, 0x8

    const v0, 0x7f1001ce

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, v2, :cond_0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v2, -0x1

    const/4 v5, 0x0

    const v4, 0x7f1001ca

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "LoginActivity: onActivityResult: requestCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", resultCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    if-eqz p3, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "LoginActivity: onActivityResult: data = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p3}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :goto_0
    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_1
    :pswitch_0
    return-void

    :cond_1
    const-string/jumbo v0, "LoginActivity: onActivityResult: data = null"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    if-ne p2, v2, :cond_0

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "tos_accepted"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->DoLogin()V

    goto :goto_1

    :pswitch_2
    if-ne p2, v2, :cond_0

    if-eqz p3, :cond_0

    const-string/jumbo v0, "selected_account"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getPasswordHash()Ljava/lang/String;

    move-result-object v2

    const v1, 0x7f1001c9

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getLoginName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f1001cc

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    const-string/jumbo v1, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/SingleLineTransformationMethod;->getInstance()Landroid/text/method/SingleLineTransformationMethod;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v3, 0x7f0902e2

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(I)V

    :goto_2
    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridIndex(Ljava/util/UUID;)I

    move-result v3

    const v1, 0x7f1000b5

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    invoke-virtual {v1, v3}, Landroid/widget/Spinner;->setSelection(I)V

    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGrid:I

    const v1, 0x7f1000b5

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v1

    instance-of v3, v1, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v3, :cond_2

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGridUUID:Ljava/util/UUID;

    :cond_2
    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v3, "login"

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getLoginName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string/jumbo v3, "save_password"

    const-string/jumbo v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string/jumbo v3, "password"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "selected_grid"

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_3
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto/16 :goto_1

    :cond_4
    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const-string/jumbo v3, ""

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->CheckTOSAndLogin()V

    goto :goto_0

    :sswitch_1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/login/WhatsNewActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :sswitch_2
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->loggingIn:Z

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->CancelConnect()V

    :cond_0
    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->showProgressView(Z)V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f1001c7 -> :sswitch_1
        0x7f1001cd -> :sswitch_0
        0x7f1001d2 -> :sswitch_2
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8

    const v7, 0x7f1000b5

    const/4 v6, 0x1

    const/4 v5, 0x0

    const v4, 0x7f1001c7

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getActiveAgentUUID()Ljava/util/UUID;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "LoginActivity: connectionState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v1, v2, :cond_0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startChatActivity(Ljava/util/UUID;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->finish()V

    return-void

    :cond_0
    const v0, 0x7f040058

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->setContentView(I)V

    const-string/jumbo v0, "LoginActivity: created."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayList:Ljava/util/List;

    invoke-virtual {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;Z)Ljava/util/List;

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->enableAutoClear:Z

    const v0, 0x7f1001cd

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1001ca

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->loadSavedLogin()V

    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    new-array v0, v6, [Ljava/lang/Object;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAppVersion()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v5

    const v2, 0x7f09038a

    invoke-virtual {p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance v0, Landroid/text/style/URLSpan;

    const-string/jumbo v2, ""

    invoke-direct {v0, v2}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    const/16 v3, 0x21

    invoke-virtual {v1, v0, v5, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget-object v2, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayAdapter:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayAdapter:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->setSelectedGrid()V

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$U_ZFuxgsYW8weMauiDTqAtaKePI;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$U_ZFuxgsYW8weMauiDTqAtaKePI;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->checkIfGridAvailable()V

    const v0, 0x7f1001d2

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f12000f

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    const v1, 0x7f10032c

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    const v1, 0x7f10030b

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    const v1, 0x7f10032d

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    const v1, 0x7f10032e

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->menuItems:Lcom/google/common/collect/ImmutableList;

    const/4 v0, 0x1

    return v0
.end method

.method public onGridAdded(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;Z)V
    .locals 4

    const/4 v2, 0x1

    const v3, 0x7f1000b5

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->addNewGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayList:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;Z)Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayAdapter:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;->notifyDataSetChanged()V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v1

    if-le v1, v2, :cond_1

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    add-int/lit8 v2, v1, -0x2

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setSelection(I)V

    add-int/lit8 v0, v1, -0x2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGrid:I

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGridUUID:Ljava/util/UUID;

    :cond_1
    return-void
.end method

.method public onGridDeleted(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V
    .locals 0

    return-void
.end method

.method public onGridEditCancelled()V
    .locals 2

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGrid:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    const/4 v2, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :sswitch_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return v2

    :sswitch_1
    const v0, 0x7f1001ca

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/SingleLineTransformationMethod;->getInstance()Landroid/text/method/SingleLineTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const/16 v1, 0x91

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    return v2

    :sswitch_2
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startActivity(Landroid/content/Intent;)V

    return v2

    :sswitch_3
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->startActivity(Landroid/content/Intent;)V

    return v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f10030b -> :sswitch_3
        0x7f10032c -> :sswitch_0
        0x7f10032d -> :sswitch_2
        0x7f10032e -> :sswitch_1
    .end sparse-switch
.end method

.method protected onResume()V
    .locals 6

    const v5, 0x7f1001ca

    const/4 v4, 0x1

    const v3, 0x7f1001cc

    const/4 v2, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onResume()V

    const-string/jumbo v0, "LoginActivity: Resumed."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->checkIfGridAvailable()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->loadGrids()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayList:Ljava/util/List;

    invoke-virtual {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;Z)Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridDisplayAdapter:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGridUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->lastSelectedGridUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridIndex(Ljava/util/UUID;)I

    move-result v1

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->loadAccounts()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->getSaveUserName()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setEnabled(Z)V

    :goto_0
    return-void

    :cond_1
    const v0, 0x7f1001c9

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_0
.end method

.method protected onStart()V
    .locals 0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onStart()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->checkIfGridAvailable()V

    return-void
.end method

.method protected onStop()V
    .locals 0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onStop()V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
