.class public Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;
.super Ljava/lang/Object;


# instance fields
.field public final avatarCountLimit:I

.field public final drawDistance:I


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "drawDistance"

    const-string/jumbo v1, "20"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v0, 0x14

    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    const-string/jumbo v1, "avatarCountLimit"

    const-string/jumbo v2, "5"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v1, 0x5

    :try_start_1
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    :goto_1
    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->drawDistance:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->avatarCountLimit:I

    return-void

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v2

    goto :goto_1
.end method
