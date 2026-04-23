.class Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment$SettingPagesAdapter;
.super Landroid/widget/ArrayAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SettingPagesAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;Landroid/content/Context;)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment$SettingPagesAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->values()[Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    move-result-object v0

    const v1, 0x1090003

    invoke-direct {p0, p2, v1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment$SettingPagesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    instance-of v1, v2, Landroid/widget/TextView;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    move-object v1, v2

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->getPageTitle()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    :cond_0
    return-object v2
.end method
