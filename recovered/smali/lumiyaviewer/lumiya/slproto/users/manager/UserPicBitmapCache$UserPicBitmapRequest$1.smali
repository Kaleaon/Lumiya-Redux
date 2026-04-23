.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserPic(Ljava/util/UUID;)[B

    move-result-object v1

    const-string/jumbo v2, "UserPic: bitmap ID %s: got bitmap data %s"

    const/4 v0, 0x2

    new-array v3, v0, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v3, v5

    if-eqz v1, :cond_0

    array-length v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v1, :cond_1

    array-length v0, v1

    invoke-static {v1, v5, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->completeRequest(Ljava/lang/Object;)V

    :goto_1
    return-void

    :cond_0
    const-string/jumbo v0, "null"

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getTextureCompressedCache()Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->RequestResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    goto :goto_1
.end method
