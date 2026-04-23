.class public Lcom/lumiyaviewer/lumiya/LumiyaApp;
.super Landroid/app/Application;


# static fields
.field private static displayMetrics:Landroid/util/DisplayMetrics;

.field private static mContext:Landroid/content/Context;

.field private static prefs:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->displayMetrics:Landroid/util/DisplayMetrics;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getAppVersion()Ljava/lang/String;
    .locals 3

    :try_start_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/LumiyaApp;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v0, ""

    return-object v0
.end method

.method public static getAssetManager()Landroid/content/res/AssetManager;
    .locals 2

    const/4 v1, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getDefaultSharedPreferences()Landroid/content/SharedPreferences;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->prefs:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->prefs:Landroid/content/SharedPreferences;

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->prefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public static isSplitScreenNeeded(Landroid/content/Context;)Z
    .locals 10

    const/4 v9, 0x1

    const/4 v8, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getDefaultSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "split_screens"

    const-string/jumbo v2, "auto"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v0, "never"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v8

    :cond_0
    const-string/jumbo v0, "always"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v9

    :cond_1
    const-string/jumbo v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    const-string/jumbo v2, "landscape"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    if-le v1, v0, :cond_2

    return v9

    :cond_2
    return v8

    :cond_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/LumiyaApp;->displayMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/LumiyaApp;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/LumiyaApp;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr v1, v2

    sget-object v2, Lcom/lumiyaviewer/lumiya/LumiyaApp;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/LumiyaApp;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr v2, v3

    mul-float v3, v2, v2

    mul-float/2addr v1, v1

    add-float/2addr v1, v3

    float-to-double v4, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    const-wide/high16 v6, 0x401a000000000000L    # 6.5

    cmpl-double v1, v4, v6

    if-lez v1, :cond_4

    const/high16 v1, 0x40a00000    # 5.0f

    cmpl-float v1, v2, v1

    if-ltz v1, :cond_4

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v0

    int-to-float v0, v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/LumiyaApp;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v1

    const-string/jumbo v1, "LumiyaApp: Display width in dp: %f, xInches %.1f, diag %.1f"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v3, v8

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v3, v9

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    const/4 v4, 0x2

    aput-object v2, v3, v4

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/high16 v1, 0x447a0000    # 1000.0f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_5

    return v9

    :cond_4
    return v8

    :cond_5
    return v8
.end method

.method public static restartApp()V
    .locals 7

    const/4 v6, 0x0

    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Landroid/app/LauncherActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x10000000

    invoke-static {v1, v6, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v2, "alarm"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    const/4 v4, 0x1

    invoke-virtual {v0, v4, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    sput-object p0, Lcom/lumiyaviewer/lumiya/LumiyaApp;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->initialize()V

    return-void
.end method
