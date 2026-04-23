.class public Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;
.super Landroid/support/v7/preference/Preference;


# instance fields
.field private notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

.field private pageNotificationDetails:Z

.field private pageResource:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageResource:I

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageResource:I

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {p0, p1, p2, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageResource:I

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageResource:I

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/R$styleable;->PreferenceSubPage:[I

    invoke-virtual {v0, p2, v1, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageResource:I

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageResource:I

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_1
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0
.end method


# virtual methods
.method getNotificationType()Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method getPageResource()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageResource:I

    return v0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .locals 3

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->pageNotificationDetails:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->areNotificationsSystemControlled()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getNotificationSummary(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-super {p0}, Landroid/support/v7/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->Load(Landroid/content/SharedPreferences;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->getSummary(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2
    invoke-super {p0}, Landroid/support/v7/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method
