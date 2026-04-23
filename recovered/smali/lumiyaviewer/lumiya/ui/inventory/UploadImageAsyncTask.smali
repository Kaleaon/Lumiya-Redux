.class public Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;",
        "Ljava/lang/Void;",
        "Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final MEDIA_TYPE_JP2:Lokhttp3/MediaType;


# instance fields
.field private final agentUUID:Ljava/util/UUID;

.field private final context:Landroid/content/Context;

.field private progressDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "image/jp2"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->MEDIA_TYPE_JP2:Lokhttp3/MediaType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/UUID;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->agentUUID:Ljava/util/UUID;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_UploadImageAsyncTask_9334(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;)Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;
    .locals 18

    const/4 v14, 0x1

    const/4 v13, 0x0

    const/4 v1, 0x0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v16, v0

    move v15, v1

    :goto_0
    move/from16 v0, v16

    if-ge v15, v0, :cond_f

    aget-object v17, p1, v15

    move-object/from16 v0, v17

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-static {v4}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v3

    invoke-static {v5}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v2

    if-eq v3, v4, :cond_0

    mul-int/lit8 v3, v3, 0x2

    :cond_0
    if-eq v2, v5, :cond_1

    mul-int/lit8 v2, v2, 0x2

    :cond_1
    :goto_1
    const/16 v4, 0x400

    if-gt v3, v4, :cond_2

    const/16 v4, 0x400

    if-le v2, v4, :cond_3

    :cond_2
    div-int/lit8 v3, v3, 0x2

    div-int/lit8 v2, v2, 0x2

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v3, v4, :cond_4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-eq v2, v4, :cond_5

    :cond_4
    const-string/jumbo v4, "UploadImage: scaled bitmap from %d x %d to %d x %d"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x2

    aput-object v6, v5, v7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x3

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v4, 0x1

    invoke-static {v1, v3, v2, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    move-object v12, v1

    :goto_2
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v4, 0x4

    :goto_3
    new-instance v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    const/4 v6, 0x0

    const/4 v7, 0x0

    move v5, v4

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(IIIIII)V

    new-array v5, v2, [I

    const/4 v9, 0x0

    :goto_4
    if-ge v9, v3, :cond_7

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v11, 0x1

    move-object v4, v12

    move v7, v2

    move v10, v2

    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    add-int/lit8 v4, v3, -0x1

    sub-int/2addr v4, v9

    invoke-virtual {v1, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->putPixelRow(I[II)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_5
    move-object v12, v1

    goto :goto_2

    :cond_6
    const/4 v4, 0x3

    goto :goto_3

    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    :try_start_0
    const-string/jumbo v3, "uploadtex"

    const-string/jumbo v4, "j2k"

    invoke-static {v3, v4, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->SaveJPEG2K(Ljava/io/File;)V

    move-object/from16 v0, v17

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->agentUUID:Ljava/util/UUID;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v4

    if-eqz v4, :cond_8

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    :goto_5
    if-eqz v1, :cond_e

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->NewFileAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v5, 0x5

    new-array v5, v5, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v7, "asset_type"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    const-string/jumbo v9, "texture"

    invoke-direct {v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v7, 0x0

    aput-object v6, v5, v7

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v7, "description"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    const-string/jumbo v9, "(No description)"

    invoke-direct {v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v7, 0x1

    aput-object v6, v5, v7

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v7, "folder_id"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    move-object/from16 v0, v17

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->folderID:Ljava/util/UUID;

    invoke-direct {v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v7, 0x2

    aput-object v6, v5, v7

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v7, "inventory_type"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    const-string/jumbo v9, "texture"

    invoke-direct {v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v7, 0x3

    aput-object v6, v5, v7

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v7, "name"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    move-object/from16 v0, v17

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->name:Ljava/lang/String;

    invoke-direct {v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v7, 0x4

    aput-object v6, v5, v7

    invoke-direct {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    invoke-virtual {v5, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    if-nez v1, :cond_9

    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "Upload request refused"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_1

    :catch_0
    move-exception v1

    :goto_6
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    :goto_7
    add-int/lit8 v2, v15, 0x1

    move v15, v2

    move v14, v1

    goto/16 :goto_0

    :cond_8
    const/4 v1, 0x0

    goto/16 :goto_5

    :cond_9
    :try_start_1
    const-string/jumbo v2, "uploader"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v2, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    const-string/jumbo v2, "Accept"

    const-string/jumbo v5, "application/llsd+xml"

    invoke-virtual {v1, v2, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->MEDIA_TYPE_JP2:Lokhttp3/MediaType;

    invoke-static {v2, v3}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/io/File;)Lokhttp3/RequestBody;

    move-result-object v2

    invoke-virtual {v1, v2}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->getOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v5

    if-nez v5, :cond_a

    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "Null response"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    move-exception v1

    :goto_8
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    goto :goto_7

    :cond_a
    :try_start_2
    invoke-virtual {v5}, Lokhttp3/Response;->isSuccessful()Z

    move-result v1

    if-nez v1, :cond_b

    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "Invalid HTTP response"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v1

    move-object v2, v13

    :goto_9
    :try_start_3
    invoke-virtual {v5}, Lokhttp3/Response;->close()V

    throw v1
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_3 .. :try_end_3} :catch_3

    :catch_2
    move-exception v1

    move-object v13, v2

    goto :goto_6

    :cond_b
    :try_start_4
    invoke-virtual {v5}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "upload reply: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v2, "error"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    const-string/jumbo v2, "error"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    const-string/jumbo v2, "message"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    const-string/jumbo v2, "success"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    const-string/jumbo v2, "success"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v2

    if-nez v2, :cond_10

    const-string/jumbo v2, "message"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v13

    const/4 v1, 0x0

    move-object v2, v13

    :goto_a
    :try_start_5
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v4

    move-object/from16 v0, v17

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->folderID:Ljava/util/UUID;

    invoke-virtual {v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-virtual {v5}, Lokhttp3/Response;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_6 .. :try_end_6} :catch_3

    move-object v13, v2

    :goto_b
    :try_start_7
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_7 .. :try_end_7} :catch_1

    goto/16 :goto_7

    :cond_c
    move-object v2, v13

    move v1, v14

    goto :goto_a

    :cond_d
    const/4 v1, 0x0

    goto :goto_b

    :cond_e
    const/4 v1, 0x0

    goto :goto_b

    :cond_f
    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;

    const/4 v2, 0x0

    invoke-direct {v1, v14, v13, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;-><init>(ZLjava/lang/String;Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;)V

    return-object v1

    :catch_3
    move-exception v1

    move-object v13, v2

    goto/16 :goto_8

    :catchall_1
    move-exception v1

    goto/16 :goto_9

    :cond_10
    move-object v2, v13

    move v1, v14

    goto :goto_a
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->doInBackground([Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;)Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v0, 0x0

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->cancel()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    :cond_0
    if-eqz p1, :cond_3

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;->success:Z

    :goto_0
    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->agentUUID:Ljava/util/UUID;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->findSpecialFolder(I)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    :cond_2
    :goto_1
    return-void

    :cond_3
    move v1, v2

    goto :goto_0

    :cond_4
    if-eqz p1, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;->errorMessage:Ljava/lang/String;

    :cond_5
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz v0, :cond_6

    :goto_2
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Dismiss"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$zdXuDSYysFkzF70MB3S4I5y4LlM;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$zdXuDSYysFkzF70MB3S4I5y4LlM;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->context:Landroid/content/Context;

    const v2, 0x7f090120

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->onPostExecute(Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->context:Landroid/content/Context;

    const v2, 0x7f090367

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    return-void
.end method
