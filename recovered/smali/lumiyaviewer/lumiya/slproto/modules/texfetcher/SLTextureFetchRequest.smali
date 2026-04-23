.class public Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/utils/HasPriority;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I


# instance fields
.field public avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

.field public avatarUUID:Ljava/util/UUID;

.field public final destFile:Ljava/io/File;

.field onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

.field public outputFile:Ljava/io/File;

.field public textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

.field public textureID:Ljava/util/UUID;

.field public textureLayer:I

.field private visibleRangeCategory:I


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->values()[Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>(Ljava/util/UUID;ILcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/util/UUID;Ljava/io/File;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureID:Ljava/util/UUID;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureLayer:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->avatarUUID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->outputFile:Ljava/io/File;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->visibleRangeCategory:I

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->destFile:Ljava/io/File;

    return-void
.end method

.method public static getPriorityForClass(Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;I)I
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->-getcom-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Lowest:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleClose:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_2
    packed-switch p1, :pswitch_data_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleFar:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_3
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimInvisible:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_4
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleClose:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_5
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleMedium:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_6
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    :pswitch_7
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->ordinal()I

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_6
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public getPriority()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->visibleRangeCategory:I

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->getPriorityForClass(Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;I)I

    move-result v0

    return v0
.end method

.method public setOnFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    return-void
.end method
