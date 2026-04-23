.class public final enum Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LLSDContentType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

.field public static final enum llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

.field public static final enum llsdXML:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    const-string/jumbo v1, "llsdXML"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdXML:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    const-string/jumbo v1, "llsdBinary"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdXML:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    return-object v0
.end method
