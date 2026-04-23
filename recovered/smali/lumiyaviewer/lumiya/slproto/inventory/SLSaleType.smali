.class public final enum Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

.field public static final enum FS_CONTENTS:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

.field public static final enum FS_COPY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

.field public static final enum FS_NOT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

.field public static final enum FS_ORIGINAL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

.field public static final enum FS_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;


# instance fields
.field private stringCode:Ljava/lang/String;

.field private typeCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    const-string/jumbo v1, "FS_NOT"

    const-string/jumbo v2, "not"

    invoke-direct {v0, v1, v4, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_NOT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    const-string/jumbo v1, "FS_ORIGINAL"

    const-string/jumbo v2, "orig"

    invoke-direct {v0, v1, v5, v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_ORIGINAL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    const-string/jumbo v1, "FS_COPY"

    const-string/jumbo v2, "copy"

    invoke-direct {v0, v1, v6, v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_COPY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    const-string/jumbo v1, "FS_CONTENTS"

    const-string/jumbo v2, "cntn"

    invoke-direct {v0, v1, v7, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_CONTENTS:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    const-string/jumbo v1, "FS_UNKNOWN"

    const-string/jumbo v2, "unknown"

    const/4 v3, -0x1

    invoke-direct {v0, v1, v8, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_NOT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_ORIGINAL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_COPY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_CONTENTS:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    aput-object v1, v0, v8

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->typeCode:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->stringCode:Ljava/lang/String;

    return-void
.end method

.method public static getByString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;
    .locals 5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    move-result-object v1

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->stringCode:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    return-object v0
.end method

.method public static getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;
    .locals 5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    move-result-object v1

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->typeCode:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->FS_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    return-object v0
.end method


# virtual methods
.method public getStringCode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->stringCode:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->typeCode:I

    return v0
.end method
