.class public Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;
.super Ljava/lang/Object;


# instance fields
.field private blinkAction:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

.field private blinkColor:Ljava/lang/String;

.field private notificationEnabled:Z

.field private ringtone:Ljava/lang/String;

.field private soundEnabled:Z

.field private type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->notificationEnabled:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->soundEnabled:Z

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->ringtone:Ljava/lang/String;

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkAction:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    const-string/jumbo v0, "red"

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkColor:Ljava/lang/String;

    return-void
.end method

.method private getPrefColor(Ljava/lang/String;)I
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    return v2

    :cond_0
    const/16 v0, 0x10

    :try_start_0
    invoke-static {p1, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    const/high16 v1, -0x1000000

    or-int/2addr v0, v1

    return v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    return v2
.end method

.method private getPreferenceValueName(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/String;
    .locals 5

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v1, ""

    const/4 v0, 0x0

    :goto_0
    array-length v4, v2

    if-ge v0, v4, :cond_1

    aget-object v4, v2, v0

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    aget-object v0, v3, v0

    :goto_1
    return-object v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method


# virtual methods
.method public Load(Landroid/content/SharedPreferences;)V
    .locals 3

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getEnableKey()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->notificationEnabled:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getPlaySoundKey()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->soundEnabled:Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->defaultSounds:Lcom/google/common/collect/ImmutableMap;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0, v2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getRingtoneKey()Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-interface {p1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->ringtone:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getBlinkKey()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "none"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->getByPreferenceString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkAction:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getBlinkColorKey()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "FF0000"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkColor:Ljava/lang/String;

    return-void

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method public getLEDAction()Lcom/lumiyaviewer/lumiya/utils/LEDAction;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkAction:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    return-object v0
.end method

.method public getLEDColor()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkColor:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->getPrefColor(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getRingtone()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->soundEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->ringtone:Ljava/lang/String;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method getSummary(Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    const/4 v1, 0x0

    const-string/jumbo v2, "No sound selected"

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->ringtone:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->ringtone:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->defaultSounds:Lcom/google/common/collect/ImmutableMap;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->type:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0, v4}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getUri()Landroid/net/Uri;

    move-result-object v0

    :goto_0
    invoke-static {v0, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "Default"

    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkColor:Ljava/lang/String;

    const v2, 0x7f0f0012

    const v3, 0x7f0f0011

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->getPreferenceValueName(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v1, "Do nothing"

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->notificationEnabled:Z

    if-eqz v3, :cond_7

    const-string/jumbo v1, "Notify"

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->soundEnabled:Z

    if-eqz v3, :cond_6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, ", play sound ("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->blinkAction:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    if-eq v1, v3, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", blink "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v2}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "LED"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    :goto_4
    return-object v0

    :cond_1
    move-object v0, v1

    goto/16 :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->ringtone:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "Silent"

    goto/16 :goto_1

    :cond_3
    invoke-static {p1, v3}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-virtual {v0, p1}, Landroid/media/Ringtone;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    :cond_4
    const-string/jumbo v0, "Default"

    goto/16 :goto_1

    :cond_5
    const-string/jumbo v0, ""

    goto :goto_3

    :cond_6
    move-object v0, v1

    goto :goto_2

    :cond_7
    move-object v0, v1

    goto :goto_4

    :cond_8
    move-object v0, v2

    goto/16 :goto_1
.end method

.method public isEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->notificationEnabled:Z

    return v0
.end method
