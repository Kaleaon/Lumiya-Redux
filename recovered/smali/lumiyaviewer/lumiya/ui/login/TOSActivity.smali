.class public Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->setResult(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->finish()V

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->setResult(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->finish()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f100296
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0400ac

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->setContentView(I)V

    const v0, 0x7f100296

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100297

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100295

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->isLightTheme()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "#FFFFFF"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->isLightTheme()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "\tbackground-color: #FFFFFF;\n\tcolor: #000000;\n"

    :goto_1
    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TOSActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string/jumbo v3, "tos/index.html"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v3}, Lcom/google/common/io/CharStreams;->toString(Ljava/lang/Readable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    const-string/jumbo v2, "<!-- STYLES -->"

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "text/html"

    const-string/jumbo v3, "UTF-8"

    invoke-virtual {v0, v1, v2, v3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return-void

    :cond_0
    const-string/jumbo v1, "#000000"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    :cond_1
    const-string/jumbo v1, "\tbackground-color: #000000;\n\tcolor: #FFFFFF;\n"

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_2
.end method
