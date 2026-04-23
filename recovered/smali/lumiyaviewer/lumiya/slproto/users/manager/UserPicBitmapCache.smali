.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<",
        "Ljava/util/UUID;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_USERPIC_HEIGHT:I = 0x80

.field private static final MAX_USERPIC_WIDTH:I = 0x80


# instance fields
.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-void
.end method


# virtual methods
.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;->CreateNewRequest(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method

.method protected CreateNewRequest(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Ljava/util/UUID;",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Ljava/util/UUID;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;

    invoke-direct {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method
