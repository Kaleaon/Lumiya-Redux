.class public Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;
.super Landroid/support/v7/preference/Preference;


# instance fields
.field private defaultRawResource:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I

    invoke-direct {p0, p1, p2, v0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/R$styleable;->RingtonePreference:[I

    invoke-virtual {v0, p2, v1, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0
.end method


# virtual methods
.method getDefaultRawResource()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I

    return v0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .locals 4

    const/4 v3, 0x0

    const-string/jumbo v0, "No sound selected"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->defaultRawResource:I

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getResourceUri(I)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string/jumbo v0, "Default"

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v0, "Silent"

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v2}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/media/Ringtone;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    const-string/jumbo v0, "Default"

    goto :goto_0
.end method
