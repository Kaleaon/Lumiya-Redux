.class public Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;
    }
.end annotation


# static fields
.field private static final MEDIA_TYPE_JP2:Lokhttp3/MediaType;


# instance fields
.field private capURL:Ljava/lang/String;

.field onUploadComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;

.field private sourceFile:Ljava/io/File;

.field private textureID:Ljava/util/UUID;

.field private textureLayer:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "image/x-j2c"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->MEDIA_TYPE_JP2:Lokhttp3/MediaType;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->onUploadComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->sourceFile:Ljava/io/File;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->textureLayer:I

    return-void
.end method


# virtual methods
.method public getTextureID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->textureID:Ljava/util/UUID;

    return-object v0
.end method

.method public run()V
    .locals 4

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->capURL:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    const-string/jumbo v1, "uploader"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "TextureUploader: uploader URL = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v1, Lokhttp3/Request$Builder;

    invoke-direct {v1}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v1, v0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string/jumbo v1, "Accept"

    const-string/jumbo v2, "application/llsd+xml"

    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->MEDIA_TYPE_JP2:Lokhttp3/MediaType;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->sourceFile:Ljava/io/File;

    invoke-static {v1, v2}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/io/File;)Lokhttp3/RequestBody;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->getOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    if-nez v1, :cond_1

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Null response"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->onUploadComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->onUploadComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;->OnTextureUploadComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;)V

    :cond_0
    return-void

    :cond_1
    :try_start_1
    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error code "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    :try_start_2
    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    :try_start_3
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "TextureUploader: LLSD response = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v2, "new_asset"

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->textureID:Ljava/util/UUID;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0
.end method

.method public setCapURL(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->capURL:Ljava/lang/String;

    return-void
.end method

.method public setOnUploadComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->onUploadComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;

    return-void
.end method
