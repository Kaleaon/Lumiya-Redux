.class public final enum Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ImageFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

.field public static final enum JPEG2000:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

.field public static final enum Raw:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

.field public static final enum TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    const-string/jumbo v1, "Raw"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->Raw:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    const-string/jumbo v1, "JPEG2000"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->JPEG2000:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    const-string/jumbo v1, "TGA"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    sget-object v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->Raw:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->JPEG2000:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    aput-object v1, v0, v4

    sput-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->$VALUES:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->$VALUES:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    return-object v0
.end method
