.class public final enum Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ChatterType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

.field public static final enum Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

.field public static final enum Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

.field public static final enum User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

.field public static final VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;


# instance fields
.field private final notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    const-string/jumbo v1, "Local"

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    const-string/jumbo v1, "User"

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    const-string/jumbo v1, "Group"

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V
    .locals 0
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    return-object v0
.end method


# virtual methods
.method public getNotificationType()Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    return-object v0
.end method
