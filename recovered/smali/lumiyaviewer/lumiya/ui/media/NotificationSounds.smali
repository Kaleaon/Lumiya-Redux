.class public final enum Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

.field public static final enum Group:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

.field public static final enum IM:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

.field public static final enum LocalChat:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

.field public static final defaultSounds:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            "Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final resourceId:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    const-string/jumbo v1, "LocalChat"

    const v2, 0x7f080001

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    const-string/jumbo v1, "IM"

    const v2, 0x7f080002

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->IM:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    const-string/jumbo v1, "Group"

    const/high16 v2, 0x7f080000

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->Group:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->IM:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->Group:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->IM:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    sget-object v4, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    sget-object v5, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->Group:Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    invoke-static/range {v0 .. v5}, Lcom/google/common/collect/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->defaultSounds:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->resourceId:I

    return-void
.end method

.method public static getResourceUri(I)Landroid/net/Uri;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "android.resource://com.lumiyaviewer.lumiya/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    return-object v0
.end method


# virtual methods
.method public getResourceId()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->resourceId:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->resourceId:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getResourceUri(I)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
