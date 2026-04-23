.class public final enum Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

.field public static final CLOUD_PLUGIN_MESSAGE:I = 0x64

.field public static final CLOUD_PLUGIN_NO_USER_RESOLUTION:I = 0x66

.field public static final CLOUD_PLUGIN_RETRY_CONNECT:I = 0x65

.field public static final enum LogFlushMessages:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

.field public static final enum LogMessageBatch:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

.field public static final enum LogMessagesCompleted:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

.field public static final enum LogMessagesFlushed:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

.field public static final enum LogSyncStart:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

.field public static final enum LogSyncStatus:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const-string/jumbo v1, "LogSyncStart"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogSyncStart:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const-string/jumbo v1, "LogSyncStatus"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogSyncStatus:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const-string/jumbo v1, "LogMessageBatch"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessageBatch:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const-string/jumbo v1, "LogMessagesCompleted"

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessagesCompleted:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const-string/jumbo v1, "LogFlushMessages"

    invoke-direct {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogFlushMessages:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const-string/jumbo v1, "LogMessagesFlushed"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessagesFlushed:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogSyncStart:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogSyncStatus:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessageBatch:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessagesCompleted:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogFlushMessages:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessagesFlushed:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->$VALUES:[Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->$VALUES:[Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    return-object v0
.end method
