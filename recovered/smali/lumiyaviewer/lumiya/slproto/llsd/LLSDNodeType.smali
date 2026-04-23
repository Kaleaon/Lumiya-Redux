.class public final enum Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdArray:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdBoolean:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdDate:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdDouble:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdInteger:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdKey:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdMap:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdRoot:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdString:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdURI:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdUUID:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field public static final enum llsdUndef:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

.field private static final tagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final tagName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v0, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdRoot"

    const-string/jumbo v3, "llsd"

    invoke-direct {v1, v2, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdRoot:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdUndef"

    const-string/jumbo v3, "undef"

    invoke-direct {v1, v2, v5, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdUndef:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdBoolean"

    const-string/jumbo v3, "boolean"

    invoke-direct {v1, v2, v6, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdBoolean:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdInteger"

    const-string/jumbo v3, "integer"

    invoke-direct {v1, v2, v7, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdInteger:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdDouble"

    const-string/jumbo v3, "real"

    invoke-direct {v1, v2, v8, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdDouble:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdUUID"

    const-string/jumbo v3, "uuid"

    const/4 v4, 0x5

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdUUID:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdString"

    const-string/jumbo v3, "string"

    const/4 v4, 0x6

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdString:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdDate"

    const-string/jumbo v3, "date"

    const/4 v4, 0x7

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdDate:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdURI"

    const-string/jumbo v3, "uri"

    const/16 v4, 0x8

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdURI:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdBinary"

    const-string/jumbo v3, "binary"

    const/16 v4, 0x9

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdArray"

    const-string/jumbo v3, "array"

    const/16 v4, 0xa

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdArray:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdMap"

    const-string/jumbo v3, "map"

    const/16 v4, 0xb

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdMap:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const-string/jumbo v2, "llsdKey"

    const-string/jumbo v3, "key"

    const/16 v4, 0xc

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdKey:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/16 v1, 0xd

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdRoot:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    aput-object v2, v1, v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdUndef:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    aput-object v2, v1, v5

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdBoolean:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    aput-object v2, v1, v6

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdInteger:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    aput-object v2, v1, v7

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdDouble:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    aput-object v2, v1, v8

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdUUID:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/4 v3, 0x5

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdString:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/4 v3, 0x6

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdDate:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/4 v3, 0x7

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdURI:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/16 v3, 0x8

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/16 v3, 0x9

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdArray:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/16 v3, 0xa

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdMap:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/16 v3, 0xb

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdKey:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    const/16 v3, 0xc

    aput-object v2, v1, v3

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    new-instance v1, Ljava/util/HashMap;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->values()[Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    move-result-object v2

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->tagMap:Ljava/util/Map;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->values()[Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    move-result-object v1

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->tagMap:Ljava/util/Map;

    iget-object v5, v3, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->tagName:Ljava/lang/String;

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->tagName:Ljava/lang/String;

    return-void
.end method

.method public static byTag(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->tagMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    return-object v0
.end method
