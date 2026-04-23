.class public Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;
.super Landroid/support/v7/preference/PreferenceFragmentCompat;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;
    }
.end annotation


# static fields
.field private static final PREF_RESOURCE_KEY:Ljava/lang/String; = "prefResourceId"


# instance fields
.field private requestedRingtonePreference:Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->askForRestart()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->requestedRingtonePreference:Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;

    return-void
.end method

.method private askForRestart()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902a6

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v1, "Yes"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$1;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private handleCacheLocationPreference(Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;)V
    .locals 13
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    const/4 v12, 0x1

    const/4 v2, 0x0

    const/4 v0, -0x1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getAvailableCacheDirs()Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getBaseCacheDir()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    new-array v8, v1, [Ljava/lang/String;

    move v1, v2

    :goto_0
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    invoke-virtual {v6, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v7}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v1

    :goto_1
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {v6, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x12

    if-lt v0, v5, :cond_0

    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v10

    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v4

    mul-long/2addr v4, v10

    :goto_2
    long-to-float v0, v4

    const/high16 v4, 0x4e800000

    div-float v4, v0, v4

    invoke-virtual {v6, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;->makeDisplayableCacheLocation(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v5, "%s (%.1f Gb free)"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v0, v9, v2

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v9, v12

    invoke-static {v5, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v8, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move v0, v3

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v0

    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v4

    mul-int/2addr v0, v4

    int-to-long v4, v0

    goto :goto_2

    :cond_1
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1090012

    invoke-direct {v1, v2, v3, v8}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0902f1

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$5;

    invoke-direct {v3, p0, v6, p1, v7}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v1, v0, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2, v12}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void

    :cond_2
    move v3, v0

    goto/16 :goto_1
.end method

.method private handleClearCachePreference()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0900ba

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$2;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$2;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v1, "Yes"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$4;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$4;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private handleRingtonePreference(Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;)V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v0, 0x0

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.RINGTONE_PICKER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "android.intent.extra.ringtone.TYPE"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.ringtone.SHOW_DEFAULT"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.ringtone.SHOW_SILENT"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.ringtone.DEFAULT_URI"

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getDefaultRawResource()I

    move-result v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getResourceUri(I)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v2, "android.intent.extra.ringtone.EXISTING_URI"

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :goto_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->requestedRingtonePreference:Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;

    invoke-virtual {p0, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :cond_0
    const-string/jumbo v0, "android.intent.extra.ringtone.EXISTING_URI"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "android.intent.extra.ringtone.EXISTING_URI"

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getDefaultRawResource()I

    move-result v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getResourceUri(I)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_SettingsFragment_7404(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_SettingsFragment_7498(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->restartApp()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_SettingsFragment_7928(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(I)Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "prefResourceId"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method private updatePreferencesDisplay()V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getListView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method


# virtual methods
.method public getSubTitle()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getPreferenceScreen()Landroid/support/v7/preference/PreferenceScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceScreen;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_SettingsFragment_6434(Lcom/google/common/collect/ImmutableList;Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;Ljava/io/File;Landroid/content/DialogInterface;I)V
    .locals 4

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1, p5}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, p5}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-interface {p4}, Landroid/content/DialogInterface;->dismiss()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->updatePreferencesDisplay()V

    invoke-static {p3, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->isCacheDirUsed()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->askForRestart()V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_settings_SettingsFragment_8022(Landroid/content/DialogInterface;I)V
    .locals 2

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->requestedRingtonePreference:Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "android.intent.extra.ringtone.PICKED_URI"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->requestedRingtonePreference:Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->requestedRingtonePreference:Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->updatePreferencesDisplay()V

    :goto_1
    return-void

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0

    :cond_1
    const/16 v0, 0xb

    if-ne p1, v0, :cond_2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->updatePreferencesDisplay()V

    goto :goto_1

    :cond_2
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_1
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "prefResourceId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->addPreferencesFromResource(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onFragmentTitleUpdated()V

    :cond_0
    const-string/jumbo v0, "soundOnNotify"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->areNotificationsSystemControlled()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setVisible(Z)V

    :cond_1
    return-void
.end method

.method public onDetach()V
    .locals 2

    invoke-super {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onDetach()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onFragmentTitleUpdated()V

    :cond_0
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/support/v7/preference/Preference;)Z
    .locals 4

    const/4 v3, 0x1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->getNotificationType()Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->showSystemNotificationSettings(Landroid/content/Context;Landroid/support/v4/app/Fragment;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v3

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/settings/PreferenceSubPage;->getPageResource()I

    move-result v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSubPageFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSubPageFragment;->makeSelection(I)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    return v3

    :cond_1
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->handleRingtonePreference(Lcom/lumiyaviewer/lumiya/ui/settings/RingtonePreference;)V

    return v3

    :cond_2
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;

    if-eqz v0, :cond_3

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->handleCacheLocationPreference(Lcom/lumiyaviewer/lumiya/ui/settings/CacheLocationPreference;)V

    return v3

    :cond_3
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/ui/settings/ClearCachePreference;

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->handleClearCachePreference()V

    return v3

    :cond_4
    invoke-super {p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onPreferenceTreeClick(Landroid/support/v7/preference/Preference;)Z

    move-result v0

    return v0
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onFragmentTitleUpdated()V

    :cond_0
    return-void
.end method
