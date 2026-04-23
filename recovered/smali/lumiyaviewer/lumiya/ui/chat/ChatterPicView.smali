.class public Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
.super Landroid/view/View;


# instance fields
.field private attachedMessageSource:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final bitmapDestRect:Landroid/graphics/Rect;

.field private final bitmapPaint:Landroid/graphics/Paint;

.field private final bitmapSrcRect:Landroid/graphics/Rect;

.field private chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private chatterName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private defaultIconDrawable:Landroid/graphics/drawable/Drawable;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private forceIcon:Landroid/graphics/drawable/Drawable;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private thumbnailDefaultIcon:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->attachedMessageSource:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailDefaultIcon:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->attachedMessageSource:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailDefaultIcon:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->attachedMessageSource:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailDefaultIcon:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->attachedMessageSource:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailDefaultIcon:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public getAttachedMessageSource()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->attachedMessageSource:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Landroid/view/View;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    const/4 v1, 0x0

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    const/16 v0, 0xc0

    const/16 v2, 0x40

    const/16 v1, 0x20

    const/4 v5, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->getWidth()I

    move-result v7

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->getHeight()I

    move-result v8

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    const/16 v6, 0xff

    const/16 v9, 0xff

    const/16 v10, 0xff

    const/16 v11, 0xff

    invoke-virtual {v3, v6, v9, v10, v11}, Landroid/graphics/Paint;->setARGB(IIII)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    int-to-float v6, v8

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v6, v9

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v4, v4, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;->getBitmapData()Landroid/graphics/Bitmap;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    iput v4, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    iput v4, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    iput v4, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    iput v4, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    iput v7, v0, Landroid/graphics/Rect;->right:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    iput v8, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapSrcRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapDestRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v4, v4, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_3
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v3

    move-object v6, v3

    :goto_1
    if-eqz v6, :cond_c

    invoke-virtual {v6}, Ljava/util/UUID;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    rem-int/lit8 v9, v2, 0x6

    const/4 v2, 0x3

    if-ge v9, v2, :cond_8

    if-nez v9, :cond_5

    move v3, v0

    :goto_2
    const/4 v2, 0x1

    if-ne v9, v2, :cond_6

    move v2, v0

    :goto_3
    const/4 v10, 0x2

    if-ne v9, v10, :cond_7

    move v1, v2

    move v2, v3

    :goto_4
    const-string/jumbo v3, "colorize: uuid %s, hash %x, comp %d, rgb %d, %d, %d"

    const/4 v10, 0x6

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v4

    invoke-virtual {v6}, Ljava/util/UUID;->hashCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v11, 0x1

    aput-object v6, v10, v11

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v9, 0x2

    aput-object v6, v10, v9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v9, 0x3

    aput-object v6, v10, v9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v9, 0x4

    aput-object v6, v10, v9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v9, 0x5

    aput-object v6, v10, v9

    invoke-static {v3, v10}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_5
    invoke-virtual {p1, v2, v1, v0}, Landroid/graphics/Canvas;->drawRGB(III)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    if-eqz v0, :cond_0

    move v0, v4

    :goto_6
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_f

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    :goto_7
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    int-to-float v1, v7

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    int-to-float v2, v8

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->descent()F

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->ascent()F

    move-result v4

    add-float/2addr v3, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_0

    :cond_4
    move-object v6, v5

    goto/16 :goto_1

    :cond_5
    move v3, v1

    goto/16 :goto_2

    :cond_6
    move v2, v1

    goto/16 :goto_3

    :cond_7
    move v0, v1

    move v1, v2

    move v2, v3

    goto/16 :goto_4

    :cond_8
    const/4 v2, 0x3

    if-eq v9, v2, :cond_9

    move v3, v0

    :goto_8
    const/4 v2, 0x4

    if-eq v9, v2, :cond_a

    move v2, v0

    :goto_9
    const/4 v10, 0x5

    if-eq v9, v10, :cond_b

    move v1, v2

    move v2, v3

    goto/16 :goto_4

    :cond_9
    move v3, v1

    goto :goto_8

    :cond_a
    move v2, v1

    goto :goto_9

    :cond_b
    move v0, v1

    move v1, v2

    move v2, v3

    goto/16 :goto_4

    :cond_c
    move v0, v2

    move v1, v2

    goto :goto_5

    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_e
    invoke-virtual {p1, v2, v2, v2}, Landroid/graphics/Canvas;->drawRGB(III)V

    goto/16 :goto_0

    :cond_f
    move-object v0, v5

    goto :goto_7
.end method

.method public setAttachedMessageSource(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->attachedMessageSource:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    return-void
.end method

.method public setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    move v0, v1

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz p1, :cond_3

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    invoke-direct {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Landroid/view/View;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    :goto_0
    move v0, v1

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    invoke-static {v2, p2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->chatterName:Ljava/lang/String;

    :goto_1
    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->postInvalidate()V

    :cond_2
    return-void

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;->dispose()V

    :cond_4
    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailData:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    goto :goto_0

    :cond_5
    move v1, v0

    goto :goto_1
.end method

.method public setDefaultIcon(IZ)V
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailDefaultIcon:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailDefaultIcon:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->thumbnailDefaultIcon:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->postInvalidate()V

    :cond_0
    return-void

    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_2
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-static {v1, v0}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->defaultIconDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method public setForceIcon(I)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->postInvalidate()V

    :goto_0
    return-void

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->forceIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->postInvalidate()V

    goto :goto_0
.end method
