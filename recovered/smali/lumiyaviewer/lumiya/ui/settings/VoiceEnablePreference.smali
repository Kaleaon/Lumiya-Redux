.class public Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;
.super Landroid/support/v7/preference/CheckBoxPreference;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v7/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->initVoicePrefCapability()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/support/v7/preference/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->initVoicePrefCapability()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/preference/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->initVoicePrefCapability()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/preference/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->initVoicePrefCapability()V

    return-void
.end method

.method private initVoicePrefCapability()V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->isPluginSupported()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->setEnabled(Z)V

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->setChecked(Z)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f09037e

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_VoiceEnablePreference_2570(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_VoiceEnablePreference_2130(Landroid/content/DialogInterface;I)V
    .locals 3

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    const-string/jumbo v0, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.voice"

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method protected onClick()V
    .locals 6

    const/4 v5, 0x1

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setInstallOfferDisplayed(Z)V

    invoke-super {p0}, Landroid/support/v7/preference/CheckBoxPreference;->onClick()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->checkPluginInstalled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090113

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/VoiceEnablePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    const-string/jumbo v3, "Google Play"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const v3, 0x7f090114

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Yes"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$0TY5QW0tBCNc4BcO-pElkyve9kc$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$0TY5QW0tBCNc4BcO-pElkyve9kc$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$0TY5QW0tBCNc4BcO-pElkyve9kc;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$0TY5QW0tBCNc4BcO-pElkyve9kc;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method
