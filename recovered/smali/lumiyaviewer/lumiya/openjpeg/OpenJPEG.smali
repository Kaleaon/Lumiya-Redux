.class public Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/GLTexture;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-openjpeg-OpenJPEG$ImageFormatSwitchesValues:[I = null

.field private static final ETC1_BYTES_PER_PIXEL:I = 0x378


# instance fields
.field public bytes_per_pixel:I

.field public error_code:I

.field public height:I

.field private mmapped:Z

.field private mmappedAddr:J

.field private mmappedSize:J

.field public num_components:I

.field public num_extra_components:I

.field private rawBuffer:Ljava/nio/ByteBuffer;

.field public width:I


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-openjpeg-OpenJPEG$ImageFormatSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->-com-lumiyaviewer-lumiya-openjpeg-OpenJPEG$ImageFormatSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->-com-lumiyaviewer-lumiya-openjpeg-OpenJPEG$ImageFormatSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->values()[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->JPEG2000:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->Raw:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->-com-lumiyaviewer-lumiya-openjpeg-OpenJPEG$ImageFormatSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "openjpeg"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(IIIIII)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/OutOfMemoryError;
        }
    .end annotation

    const-wide/16 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedAddr:J

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedSize:J

    iput p1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    iput p5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_extra_components:I

    iput p4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    invoke-direct/range {p0 .. p6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->allocateNew(IIIIII)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/OutOfMemoryError;

    const-string/jumbo v1, "allocateNew() returned NULL"

    invoke-direct {v0, v1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->allocOpenJpegMemory(IZ)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;IIZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedAddr:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedSize:J

    if-nez p1, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Null source file"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    move-object v0, p0

    move v3, v2

    move v4, p4

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->decompress(Ljava/lang/String;IIZII)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_1

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Failed to decompress texture ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->error_code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->allocOpenJpegMemory(IZ)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedAddr:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedSize:J

    if-nez p1, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Null source file"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "OpenJPEG: decompressing "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " class "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " format "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne p2, v0, :cond_2

    xor-int/lit8 v0, p4, 0x1

    :goto_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->-getcom-lumiyaviewer-lumiya-openjpeg-OpenJPEG$ImageFormatSwitchesValues()[I

    move-result-object v1

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->allocOpenJpegMemory(IZ)V

    return-void

    :cond_2
    move v0, v5

    goto :goto_0

    :pswitch_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->readRaw(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_1

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Failed to read raw texture "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_3

    move v2, v4

    :goto_1
    if-eqz v0, :cond_4

    const/4 v3, 0x6

    :goto_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne p2, v0, :cond_5

    :goto_3
    move-object v0, p0

    move v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->decompress(Ljava/lang/String;IIZII)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_1

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Failed to decompress texture ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->error_code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    move v2, v5

    goto :goto_1

    :cond_4
    move v3, v5

    goto :goto_2

    :cond_5
    move v4, v5

    goto :goto_3

    :pswitch_2
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "TGA not supported for non-asset files"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public constructor <init>(Ljava/io/InputStream;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;ZZFFZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedAddr:J

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmappedSize:J

    sget-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    if-ne p2, v0, :cond_1

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    new-array v1, v0, [B

    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-object v0, p0

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    move v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->decompressTGA([BZZFFZ)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Failed to decompress TGA texture."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->allocOpenJpegMemory(IZ)V

    return-void

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Unsupported format for image stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private native allocateNew(IIIIII)Ljava/nio/ByteBuffer;
.end method

.method private native allocateRaw(I)Ljava/nio/ByteBuffer;
.end method

.method public static native applyFlexibleMorph(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I[F)V
.end method

.method public static native applyMeshMorph(FLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;)V
.end method

.method public static native applyMorphingTransform(ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;[I[F)V
.end method

.method public static native applyRiggedMeshMorph(Ljava/nio/ByteBuffer;I[F[FLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V
.end method

.method public static bakeTerrain(II[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;[FII)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    .locals 11

    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v1, p0

    move v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(IIIIII)V

    array-length v1, p2

    new-array v4, v1, [Ljava/nio/ByteBuffer;

    array-length v1, p2

    new-array v5, v1, [I

    array-length v1, p2

    new-array v6, v1, [I

    array-length v1, p2

    new-array v7, v1, [I

    const/4 v1, 0x0

    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    aget-object v2, p2, v1

    if-eqz v2, :cond_0

    aget-object v2, p2, v1

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    aput-object v2, v4, v1

    aget-object v2, p2, v1

    iget v2, v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    aput v2, v5, v1

    aget-object v2, p2, v1

    iget v2, v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    aput v2, v6, v1

    aget-object v2, p2, v1

    iget v2, v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    aput v2, v7, v1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    aput-object v2, v4, v1

    const/4 v2, 0x0

    aput v2, v5, v1

    const/4 v2, 0x0

    aput v2, v6, v1

    const/4 v2, 0x0

    aput v2, v7, v1

    goto :goto_1

    :cond_1
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    move v2, p0

    move v3, p1

    move-object v8, p3

    move v9, p4

    move/from16 v10, p5

    invoke-direct/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bakeTerrainRaw(Ljava/nio/ByteBuffer;II[Ljava/nio/ByteBuffer;[I[I[I[FII)V

    return-object v0
.end method

.method private native bakeTerrainRaw(Ljava/nio/ByteBuffer;II[Ljava/nio/ByteBuffer;[I[I[I[FII)V
.end method

.method public static native calcFlexiSections([FI[F[FIFFFFFFFFFFZ)V
.end method

.method public static native checkFrustrumOcclusion([F[FFFF)I
.end method

.method private native decompress(Ljava/lang/String;IIZII)Ljava/nio/ByteBuffer;
.end method

.method private native decompressTGA([BZZFFZ)Ljava/nio/ByteBuffer;
.end method

.method private native drawBuf(Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;IIIIZZZZ)V
.end method

.method public static native getFlexiDataSize(I)I
.end method

.method public static native meshPrepareInfluenceBuffer(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V
.end method

.method public static native meshPrepareSeparateInfluenceBuffer(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V
.end method

.method private native readRaw(Ljava/lang/String;)Ljava/nio/ByteBuffer;
.end method

.method private native release(Ljava/nio/ByteBuffer;)V
.end method

.method private native setComponentBuf(Ljava/nio/ByteBuffer;IIIIIB)V
.end method

.method private native writeJPEG2K(Ljava/lang/String;Ljava/nio/ByteBuffer;IIII)I
.end method

.method private native writeRaw(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
.end method


# virtual methods
.method public CompressETC1()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x3

    const/4 v2, 0x0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    if-ne v0, v3, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_extra_components:I

    if-nez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    if-ne v0, v3, :cond_2

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    invoke-static {v0, v1}, Landroid/opengl/ETC1;->getEncodedDataSize(II)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->allocateRaw(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    if-nez v5, :cond_1

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Out of memory for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " allocation"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v6, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    mul-int/2addr v4, v6

    invoke-static/range {v0 .. v5}, Landroid/opengl/ETC1;->encodeImage(Ljava/nio/Buffer;IIIILjava/nio/Buffer;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->releaseOpenJpegMemory(IZ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->release(Ljava/nio/ByteBuffer;)V

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->allocOpenJpegMemory(IZ)V

    const/16 v0, 0x378

    iput v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/4 v0, 0x1

    return v0

    :cond_2
    return v2
.end method

.method public SaveJPEG2K(Ljava/io/File;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    iget v6, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_extra_components:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->writeJPEG2K(Ljava/lang/String;Ljava/nio/ByteBuffer;IIII)I

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Failed to save JPEG2k to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method public SaveRaw(Ljava/io/File;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->writeRaw(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public SaveToFile(Ljava/io/File;)V
    .locals 3

    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public SetAsImmutableTexture()I
    .locals 11
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const/16 v9, 0x1903

    const/4 v5, 0x2

    const/4 v10, 0x1

    const/4 v1, 0x0

    const/16 v0, 0xde1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/16 v3, 0x378

    if-ne v2, v3, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    const v4, 0x9274

    invoke-static {v0, v10, v4, v2, v3}, Landroid/opengl/GLES30;->glTexStorage2D(IIIII)V

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v7

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    const v6, 0x9274

    move v2, v1

    move v3, v1

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES30;->glCompressedTexSubImage2D(IIIIIIIILjava/nio/Buffer;)V

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getLoadedSize()I

    move-result v0

    return v0

    :cond_1
    const/16 v3, 0x1401

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->SetAsTexture()I

    move-result v0

    return v0

    :pswitch_1
    const v2, 0x8058

    const/16 v6, 0x1908

    :cond_2
    :goto_1
    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    if-ne v4, v5, :cond_4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_4

    const v3, 0x8363

    move v7, v3

    :goto_2
    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    invoke-static {v0, v10, v2, v3, v4}, Landroid/opengl/GLES30;->glTexStorage2D(IIIII)V

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    move v2, v1

    move v3, v1

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES30;->glTexSubImage2D(IIIIIIIILjava/nio/Buffer;)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    if-ne v1, v10, :cond_0

    const v1, 0x8e42

    invoke-static {v0, v1, v10}, Landroid/opengl/GLES30;->glTexParameteri(III)V

    const v1, 0x8e43

    invoke-static {v0, v1, v10}, Landroid/opengl/GLES30;->glTexParameteri(III)V

    const v1, 0x8e44

    invoke-static {v0, v1, v10}, Landroid/opengl/GLES30;->glTexParameteri(III)V

    const v1, 0x8e45

    invoke-static {v0, v1, v9}, Landroid/opengl/GLES30;->glTexParameteri(III)V

    goto :goto_0

    :pswitch_2
    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    if-ne v2, v5, :cond_3

    const v2, 0x8d62

    :goto_3
    const/16 v6, 0x1907

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    if-ne v4, v5, :cond_2

    const v3, 0x8363

    goto :goto_1

    :cond_3
    const v2, 0x8051

    goto :goto_3

    :pswitch_3
    const v2, 0x8229

    move v6, v9

    goto :goto_1

    :cond_4
    move v7, v3

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public SetAsTexture()I
    .locals 9

    const/16 v0, 0xde1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/16 v3, 0x378

    if-ne v2, v3, :cond_1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v6

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    const v2, 0x8d64

    move v5, v1

    invoke-static/range {v0 .. v7}, Landroid/opengl/GLES10;->glCompressedTexImage2D(IIIIIIILjava/nio/Buffer;)V

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getLoadedSize()I

    move-result v0

    return v0

    :cond_1
    const/16 v7, 0x1401

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    :goto_1
    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_2

    const v7, 0x8363

    :cond_2
    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    move v5, v1

    move v6, v2

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES10;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_0

    :pswitch_1
    const/16 v2, 0x1908

    goto :goto_1

    :pswitch_2
    const/16 v2, 0x1907

    goto :goto_1

    :pswitch_3
    const/16 v2, 0x1906

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public SetAsTextureTarget(I)I
    .locals 9

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/16 v2, 0x378

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v6

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    const v2, 0x8d64

    move v0, p1

    move v5, v1

    invoke-static/range {v0 .. v7}, Landroid/opengl/GLES20;->glCompressedTexImage2D(IIIIIIILjava/nio/Buffer;)V

    :goto_0
    return v6

    :cond_0
    const/16 v7, 0x1401

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    :goto_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_1

    const v7, 0x8363

    :cond_1
    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    move v0, p1

    move v5, v1

    move v6, v2

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    mul-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    mul-int v6, v0, v1

    goto :goto_0

    :pswitch_1
    const/16 v2, 0x1908

    goto :goto_1

    :pswitch_2
    const/16 v2, 0x1907

    goto :goto_1

    :pswitch_3
    const/16 v2, 0x1906

    goto :goto_1

    :cond_2
    move v6, v1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public blendAlpha(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Z)V
    .locals 14

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v6, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v7, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v8, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v13, 0x0

    move-object v0, p0

    move/from16 v12, p2

    invoke-direct/range {v0 .. v13}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->drawBuf(Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;IIIIZZZZ)V

    :cond_0
    return-void
.end method

.method public draw(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;IZ)V
    .locals 14

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v6, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v7, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v8, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v0, p0

    move/from16 v9, p2

    move/from16 v10, p3

    invoke-direct/range {v0 .. v13}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->drawBuf(Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;IIIIZZZZ)V

    :cond_0
    return-void
.end method

.method public drawBump(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;IZZ)V
    .locals 14

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_extra_components:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v6, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v7, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v8, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x1

    move-object v0, p0

    move/from16 v12, p4

    invoke-direct/range {v0 .. v13}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->drawBuf(Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;IIIIZZZZ)V

    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->mmapped:Z

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->releaseOpenJpegMemory(IZ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->release(Ljava/nio/ByteBuffer;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public getAsBitmap()Landroid/graphics/Bitmap;
    .locals 10

    const/4 v5, 0x0

    const/4 v1, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-nez v4, :cond_0

    return-object v5

    :cond_0
    move v0, v1

    :goto_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    if-ge v0, v2, :cond_4

    move v2, v1

    :goto_1
    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    if-ge v2, v3, :cond_3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v5, 0x1

    if-ne v3, v5, :cond_1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    mul-int/2addr v3, v0

    add-int/2addr v3, v2

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v3, v5

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v5, v3, 0x10

    const/high16 v6, -0x1000000

    or-int/2addr v5, v6

    shl-int/lit8 v6, v3, 0x8

    or-int/2addr v5, v6

    or-int/2addr v3, v5

    :goto_2
    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    add-int/lit8 v5, v5, -0x1

    sub-int/2addr v5, v0

    invoke-virtual {v4, v2, v5, v3}, Landroid/graphics/Bitmap;->setPixel(III)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    mul-int/2addr v3, v0

    add-int/2addr v3, v2

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v3, v5

    add-int/lit8 v3, v3, 0x0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getByte(I)B

    move-result v3

    and-int/lit16 v5, v3, 0xff

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    mul-int/2addr v3, v0

    add-int/2addr v3, v2

    iget v6, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v3, v6

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getByte(I)B

    move-result v3

    and-int/lit16 v6, v3, 0xff

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    mul-int/2addr v3, v0

    add-int/2addr v3, v2

    iget v7, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v3, v7

    add-int/lit8 v3, v3, 0x2

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getByte(I)B

    move-result v3

    and-int/lit16 v7, v3, 0xff

    const/16 v3, 0xff

    iget v8, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v9, 0x4

    if-lt v8, v9, :cond_2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    mul-int/2addr v3, v0

    add-int/2addr v3, v2

    iget v8, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v3, v8

    add-int/lit8 v3, v3, 0x3

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    :cond_2
    shl-int/lit8 v3, v3, 0x18

    shl-int/lit8 v5, v5, 0x10

    or-int/2addr v3, v5

    shl-int/lit8 v5, v6, 0x8

    or-int/2addr v3, v5

    or-int/2addr v3, v7

    goto :goto_2

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-object v4
.end method

.method public getByte(I)B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getExtraAsBitmap()Landroid/graphics/Bitmap;
    .locals 7

    const/4 v1, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    move v0, v1

    :goto_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    if-ge v0, v2, :cond_1

    move v2, v1

    :goto_1
    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    if-ge v2, v3, :cond_0

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_extra_components:I

    const/4 v5, 0x1

    if-ne v3, v5, :cond_2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    mul-int/2addr v3, v5

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v3, v5

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    mul-int/2addr v5, v0

    add-int/2addr v3, v5

    add-int/2addr v3, v2

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v5, v3, 0x10

    const/high16 v6, -0x1000000

    or-int/2addr v5, v6

    shl-int/lit8 v6, v3, 0x8

    or-int/2addr v5, v6

    or-int/2addr v3, v5

    :goto_2
    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    add-int/lit8 v5, v5, -0x1

    sub-int/2addr v5, v0

    invoke-virtual {v4, v2, v5, v3}, Landroid/graphics/Bitmap;->setPixel(III)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object v4

    :cond_2
    move v3, v1

    goto :goto_2
.end method

.method public getExtraComponentsBuffer()Ljava/nio/ByteBuffer;
    .locals 4

    const/4 v3, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_extra_components:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v1, v2

    if-ltz v1, :cond_0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    if-gt v1, v2, :cond_0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-object v0

    :cond_0
    return-object v3
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    return v0
.end method

.method public getLoadedSize()I
    .locals 3

    const/4 v2, 0x3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/16 v1, 0x378

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    if-ne v0, v2, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    if-ne v0, v2, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    mul-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v0, v1

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    mul-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    mul-int/2addr v0, v1

    goto :goto_0
.end method

.method public getNumComponents()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    return v0
.end method

.method public getRGB(I)I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    const/high16 v1, 0xff0000

    and-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    return v0
.end method

.method public hasAlphaLayer()Z
    .locals 4

    const/4 v1, 0x0

    const/4 v0, 0x1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    const/16 v3, 0x378

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    if-ne v2, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public putPixelRow(I[II)V
    .locals 6

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    mul-int/2addr v1, v2

    mul-int/2addr v1, p1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    :goto_0
    if-ge v0, p3, :cond_1

    aget v2, p2, v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v4, v1, 0x1

    shr-int/lit8 v5, v2, 0x10

    int-to-byte v5, v5

    invoke-virtual {v3, v1, v5}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v3, v4, 0x1

    shr-int/lit8 v5, v2, 0x8

    int-to-byte v5, v5

    invoke-virtual {v1, v4, v5}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v3, 0x1

    int-to-byte v2, v2

    invoke-virtual {v4, v3, v2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_1

    :goto_1
    if-ge v0, p3, :cond_1

    aget v2, p2, v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v4, v1, 0x1

    shr-int/lit8 v5, v2, 0x10

    int-to-byte v5, v5

    invoke-virtual {v3, v1, v5}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v3, v4, 0x1

    shr-int/lit8 v5, v2, 0x8

    int-to-byte v5, v5

    invoke-virtual {v1, v4, v5}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v4, v3, 0x1

    int-to-byte v5, v2

    invoke-virtual {v1, v3, v5}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v4, 0x1

    shr-int/lit8 v2, v2, 0x18

    int-to-byte v2, v2

    invoke-virtual {v3, v4, v2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public setComponent(IB)V
    .locals 8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->rawBuffer:Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_extra_components:I

    move-object v0, p0

    move v6, p1

    move v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponentBuf(Ljava/nio/ByteBuffer;IIIIIB)V

    :cond_0
    return-void
.end method
