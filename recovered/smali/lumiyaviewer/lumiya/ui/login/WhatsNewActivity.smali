.class public Lcom/lumiyaviewer/lumiya/ui/login/WhatsNewActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6

    const/4 v1, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0400bc

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/WhatsNewActivity;->setContentView(I)V

    const v0, 0x7f09038a

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/WhatsNewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAppVersion()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const v0, 0x7f1002de

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/WhatsNewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/WhatsNewActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0f001c

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    array-length v4, v2

    move v0, v1

    :goto_0
    if-ge v0, v4, :cond_1

    aget-object v1, v2, v0

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_0

    const-string/jumbo v5, "\n\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    const-string/jumbo v5, "\u2022 "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const v0, 0x7f1001c7

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/WhatsNewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
