.class public final enum Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

.field public static final enum AppVersionRejected:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

.field public static final enum GoogleDriveError:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

.field public static final enum Ready:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    const-string/jumbo v1, "Ready"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->Ready:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    const-string/jumbo v1, "AppVersionRejected"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->AppVersionRejected:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    const-string/jumbo v1, "GoogleDriveError"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->GoogleDriveError:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->Ready:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->AppVersionRejected:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->GoogleDriveError:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    aput-object v1, v0, v4

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->$VALUES:[Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->$VALUES:[Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    return-object v0
.end method
