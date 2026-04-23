.class Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NotificationChannelSettings"
.end annotation


# instance fields
.field final importance:I

.field final notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

.field final showBadge:Z


# direct methods
.method private constructor <init>(IZLcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;->importance:I

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;->showBadge:Z

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    return-void
.end method

.method synthetic constructor <init>(IZLcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;-><init>(IZLcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    return-void
.end method
