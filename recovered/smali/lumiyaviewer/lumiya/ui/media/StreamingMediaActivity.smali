.class public Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;
.super Landroid/support/v7/app/AppCompatActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const-string/jumbo v1, "com.lumiyaviewer.lumiya.ACTION_STOP_MEDIA"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/StreamingMediaService;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;->finish()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f10025f
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0400a5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "parcelData"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "parcelData"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    if-eqz v0, :cond_0

    const v1, 0x7f10028b

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    const v0, 0x7f10025f

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
