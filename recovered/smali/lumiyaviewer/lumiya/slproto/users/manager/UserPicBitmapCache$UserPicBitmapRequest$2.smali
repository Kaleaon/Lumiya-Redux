.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/io/File;

    move-result-object v1

    const/16 v2, 0x80

    const/16 v3, 0x80

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/File;IIZ)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getAsBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    const-string/jumbo v0, "UserPic: bitmap ID %s: storing bitmap data %d bytes"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    array-length v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-virtual {v3, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setUserPic(Ljava/util/UUID;[B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method
