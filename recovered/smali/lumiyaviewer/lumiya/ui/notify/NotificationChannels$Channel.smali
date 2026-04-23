.class public final enum Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Channel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

.field public static final enum Group:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

.field public static final enum IM:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

.field public static final enum Local:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

.field public static final enum OnlineStatus:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;


# instance fields
.field public final channelId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final descriptionStringId:I

.field public final nameStringId:I

.field public final notificationId:I

.field public final notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 14

    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    const-string/jumbo v1, "OnlineStatus"

    const-string/jumbo v3, "onlineStatus"

    const v4, 0x7f09020d

    const v5, 0x7f09020c

    const/4 v6, 0x0

    const v7, 0x7f100022

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;-><init>(Ljava/lang/String;ILjava/lang/String;IILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->OnlineStatus:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    const-string/jumbo v4, "Local"

    const-string/jumbo v6, "localChat"

    sget-object v9, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const v7, 0x7f09020b

    const v8, 0x7f09020a

    const v10, 0x7f10003f

    move v5, v11

    invoke-direct/range {v3 .. v10}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;-><init>(Ljava/lang/String;ILjava/lang/String;IILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;I)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Local:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    const-string/jumbo v4, "Group"

    const-string/jumbo v6, "groupChat"

    sget-object v9, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const v7, 0x7f090207

    const v8, 0x7f090206

    const v10, 0x7f10003c

    move v5, v12

    invoke-direct/range {v3 .. v10}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;-><init>(Ljava/lang/String;ILjava/lang/String;IILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;I)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Group:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    const-string/jumbo v4, "IM"

    const-string/jumbo v6, "privateIM"

    sget-object v9, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const v7, 0x7f090209

    const v8, 0x7f090208

    const v10, 0x7f10003e

    move v5, v13

    invoke-direct/range {v3 .. v10}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;-><init>(Ljava/lang/String;ILjava/lang/String;IILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;I)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->IM:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->OnlineStatus:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Local:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    aput-object v1, v0, v11

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Group:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    aput-object v1, v0, v12

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->IM:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    aput-object v1, v0, v13

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;IILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;I)V
    .locals 0
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->channelId:Ljava/lang/String;

    iput p4, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->nameStringId:I

    iput p5, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->descriptionStringId:I

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    iput p7, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->notificationId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    return-object v0
.end method
