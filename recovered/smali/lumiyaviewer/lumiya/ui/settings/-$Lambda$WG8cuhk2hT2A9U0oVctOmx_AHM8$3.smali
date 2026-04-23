.class final synthetic Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$3;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment$ClearCacheTask;->lambda$-com_lumiyaviewer_lumiya_ui_settings_SettingsFragment$ClearCacheTask_8620(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$3;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/-$Lambda$WG8cuhk2hT2A9U0oVctOmx_AHM8$3;->$m$0(Landroid/content/DialogInterface;)V

    return-void
.end method
