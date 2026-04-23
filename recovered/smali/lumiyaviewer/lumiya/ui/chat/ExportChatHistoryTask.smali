.class public Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;
.super Landroid/os/AsyncTask;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
        "Ljava/lang/Void;",
        "Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;",
        ">;",
        "Landroid/content/DialogInterface$OnCancelListener;"
    }
.end annotation


# static fields
.field private static final forbiddenChars:Ljava/lang/String; = "./\\*?:\"\'~"


# instance fields
.field private final context:Landroid/content/Context;

.field private final gotChatterName:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final isNameReady:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final nameReadyCondition:Ljava/util/concurrent/locks/Condition;

.field private final nameReadyLock:Ljava/util/concurrent/locks/Lock;

.field private final onChatterNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

.field private progressDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyCondition:Ljava/util/concurrent/locks/Condition;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isNameReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->gotChatterName:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$D705oXX7BTh_Xc4P_mIDvS9cOZI;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$D705oXX7BTh_Xc4P_mIDvS9cOZI;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->onChatterNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    return-void
.end method

.method private sanitizeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const/16 v1, 0x20

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string/jumbo p1, ""

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    move v2, v0

    :goto_0
    if-ge v2, v4, :cond_4

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ge v0, v1, :cond_1

    move v0, v1

    :cond_1
    const/16 v5, 0x7f

    if-le v0, v5, :cond_2

    const/16 v0, 0x5f

    :cond_2
    const-string/jumbo v5, "./\\*?:\"\'~"

    invoke-virtual {v5, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gez v5, :cond_3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_4
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v0, "Chat Log"

    :cond_5
    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;
    .locals 13

    const/4 v8, 0x3

    const/4 v12, 0x0

    const/4 v2, 0x0

    array-length v0, p1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    return-object v2

    :cond_0
    aget-object v5, p1, v12

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v6

    if-nez v6, :cond_1

    return-object v2

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->onChatterNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v0, v5, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isNameReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isCancelled()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :catch_0
    move-exception v0

    return-object v2

    :cond_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_3

    return-object v2

    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_9

    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOCUMENTS:Ljava/lang/String;

    :goto_1
    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    const-string/jumbo v3, "Lumiya"

    invoke-direct {v1, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    const-string/jumbo v0, "Chat Logs"

    invoke-direct {v3, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->gotChatterName:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->sanitizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v7, ".txt"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v8, v8}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v7

    :try_start_2
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :try_start_3
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v0, 0x0

    invoke-direct {v1, v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getMessages(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lde/greenrobot/dao/query/LazyList;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result-object v3

    if-eqz v3, :cond_6

    :try_start_5
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getTimestamp()Ljava/util/Date;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    const/4 v11, 0x0

    invoke-virtual {v0, v10, v6, v11}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "] "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v9, "\n"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    :cond_5
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isCancelled()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-result v0

    if-eqz v0, :cond_4

    :cond_6
    if-eqz v3, :cond_7

    :try_start_6
    invoke-virtual {v3}, Lde/greenrobot/dao/query/LazyList;->close()V

    :cond_7
    if-eqz v1, :cond_8

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    :cond_8
    move-object v0, v4

    :goto_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_10

    if-eqz v0, :cond_c

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;

    invoke-direct {v1, v0, v2, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_9
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    goto/16 :goto_1

    :catchall_1
    move-exception v0

    move-object v1, v2

    move-object v3, v2

    :goto_3
    if-eqz v3, :cond_a

    :try_start_7
    invoke-virtual {v3}, Lde/greenrobot/dao/query/LazyList;->close()V

    :cond_a
    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    :cond_b
    throw v0
    :try_end_7
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move-object v0, v2

    goto :goto_2

    :catch_2
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move-object v0, v2

    goto :goto_2

    :catch_3
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move-object v0, v2

    goto :goto_2

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->gotChatterName:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->sanitizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".txt"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getMessages(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getTimestamp()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    invoke-virtual {v0, v8, v6, v12}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v0

    const-string/jumbo v8, "["

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v8, "] "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, "\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_e
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_d

    :cond_f
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_10

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;

    invoke-direct {v3, v2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :cond_10
    return-object v2

    :catchall_2
    move-exception v0

    move-object v3, v2

    goto/16 :goto_3

    :catchall_3
    move-exception v0

    goto/16 :goto_3
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->doInBackground([Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_ExportChatHistoryTask_2020(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->isNameReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->gotChatterName:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->cancel(Z)Z

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->nameReadyLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method protected onCancelled()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method protected onPostExecute(Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;)V
    .locals 5

    const/4 v2, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    if-eqz p1, :cond_1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->outputFile:Ljava/io/File;

    if-eqz v1, :cond_2

    const-string/jumbo v1, "Export: exported as stream %s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->outputFile:Ljava/io/File;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v1, "android.intent.extra.STREAM"

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->outputFile:Ljava/io/File;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    const v3, 0x7f090117

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_1
    return-void

    :cond_2
    const-string/jumbo v1, "Export: exported as text, %d bytes"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->rawText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v1, "android.intent.extra.TEXT"

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->rawText:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.SUBJECT"

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->rawTextTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->onPostExecute(Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 6

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    const v2, 0x7f090278

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->context:Landroid/content/Context;

    const v4, 0x7f090119

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    move v4, v3

    move-object v5, p0

    invoke-static/range {v0 .. v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->progressDialog:Landroid/app/ProgressDialog;

    return-void
.end method
