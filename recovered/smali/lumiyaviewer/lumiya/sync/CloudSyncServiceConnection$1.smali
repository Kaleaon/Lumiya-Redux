.class Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-cloud-common-MessageTypeSwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$cloud$common$MessageType:[I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-cloud-common-MessageTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->-com-lumiyaviewer-lumiya-cloud-common-MessageTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->-com-lumiyaviewer-lumiya-cloud-common-MessageTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->values()[Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogFlushMessages:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessageBatch:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessagesCompleted:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessagesFlushed:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogSyncStart:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogSyncStatus:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_5
    sput-object v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->-com-lumiyaviewer-lumiya-cloud-common-MessageTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_5

    :catch_1
    move-exception v1

    goto :goto_4

    :catch_2
    move-exception v1

    goto :goto_3

    :catch_3
    move-exception v1

    goto :goto_2

    :catch_4
    move-exception v1

    goto :goto_1

    :catch_5
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Landroid/os/Bundle;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "messageType"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    :try_start_0
    const-string/jumbo v1, "messageType"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->-getcom-lumiyaviewer-lumiya-cloud-common-MessageTypeSwitchesValues()[I

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->-wrap2(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :pswitch_1
    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->-wrap0(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;)V

    goto :goto_0

    :pswitch_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->-wrap1(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method
