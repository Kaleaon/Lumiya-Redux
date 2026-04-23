.class public Lcom/lumiyaviewer/lumiya/licensing/LicenseChecker;
.super Ljava/lang/Object;


# static fields
.field public static final APP_STORE_NAME:Ljava/lang/String; = "Google Play"

.field public static final APP_STORE_URL:Ljava/lang/String; = "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya"

.field public static final CLOUD_PLUGIN_URL:Ljava/lang/String; = "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.cloud"

.field public static final MSG_LICENSING_ALLOW:I = 0x7f100019

.field public static final MSG_LICENSING_APP_ERROR:I = 0x7f10001a

.field public static final MSG_LICENSING_DONT_ALLOW:I = 0x7f10001b

.field public static final VOICE_PLUGIN_URL:Ljava/lang/String; = "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.voice"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/Object;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f100019

    invoke-virtual {p2, v0, p3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method
