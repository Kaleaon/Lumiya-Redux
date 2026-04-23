.class public final enum Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

.field public static final enum Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

.field public static final enum LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

.field public static final enum Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

.field public static VALUES:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            ">;"
        }
    .end annotation
.end field

.field public static VALUES_BY_DESCENDING_PRIORITY:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private blinkColorKey:Ljava/lang/String;

.field private blinkKey:Ljava/lang/String;

.field private enableKey:Ljava/lang/String;

.field private playSoundKey:Ljava/lang/String;

.field private prefScreenKey:Ljava/lang/String;

.field private priority:I

.field private ringtoneKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    const/4 v14, 0x2

    const/4 v13, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const-string/jumbo v1, "LocalChat"

    const-string/jumbo v4, "notify_local_chat"

    const-string/jumbo v5, "enableNotifyLocalChat"

    const-string/jumbo v6, "soundOnLocalChat"

    const-string/jumbo v7, "notifySoundLocalChat"

    const-string/jumbo v8, "notifyLEDchatIMs"

    const-string/jumbo v9, "notifyLEDColorChatIMs"

    move v3, v2

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const-string/jumbo v4, "Private"

    const-string/jumbo v7, "notify_private_im"

    const-string/jumbo v8, "enableNotifyPrivateIM"

    const-string/jumbo v9, "soundOnPrivateIM"

    const-string/jumbo v10, "notifySoundPrivateIM"

    const-string/jumbo v11, "notifyLEDprivateIMs"

    const-string/jumbo v12, "notifyLEDColorPrivateIMs"

    move v5, v13

    move v6, v14

    invoke-direct/range {v3 .. v12}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const-string/jumbo v4, "Group"

    const-string/jumbo v7, "notify_group_messages"

    const-string/jumbo v8, "enableNotifyGroupMessage"

    const-string/jumbo v9, "soundOnGroupMessage"

    const-string/jumbo v10, "notifySoundGroupMessage"

    const-string/jumbo v11, "notifyLEDgroupMessages"

    const-string/jumbo v12, "notifyLEDColorGroupMessages"

    move v5, v14

    move v6, v13

    invoke-direct/range {v3 .. v12}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    aput-object v1, v0, v13

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    aput-object v1, v0, v14

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->values()[Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->VALUES:Lcom/google/common/collect/ImmutableList;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-static {v0, v1, v2}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->VALUES_BY_DESCENDING_PRIORITY:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->priority:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->prefScreenKey:Ljava/lang/String;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->enableKey:Ljava/lang/String;

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->playSoundKey:Ljava/lang/String;

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->ringtoneKey:Ljava/lang/String;

    iput-object p8, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->blinkKey:Ljava/lang/String;

    iput-object p9, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->blinkColorKey:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    return-object v0
.end method


# virtual methods
.method public getBlinkColorKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->blinkColorKey:Ljava/lang/String;

    return-object v0
.end method

.method public getBlinkKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->blinkKey:Ljava/lang/String;

    return-object v0
.end method

.method public getEnableKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->enableKey:Ljava/lang/String;

    return-object v0
.end method

.method public getPlaySoundKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->playSoundKey:Ljava/lang/String;

    return-object v0
.end method

.method public getPrefScreenKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->prefScreenKey:Ljava/lang/String;

    return-object v0
.end method

.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->priority:I

    return v0
.end method

.method public getRingtoneKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->ringtoneKey:Ljava/lang/String;

    return-object v0
.end method
