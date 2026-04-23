.class public final enum Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Order"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

.field public static final enum XYZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

.field public static final enum XZY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

.field public static final enum YXZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

.field public static final enum YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

.field public static final enum ZXY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

.field public static final enum ZYX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const-string/jumbo v1, "XYZ"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->XYZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const-string/jumbo v1, "YZX"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const-string/jumbo v1, "ZXY"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ZXY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const-string/jumbo v1, "XZY"

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->XZY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const-string/jumbo v1, "YXZ"

    invoke-direct {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YXZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const-string/jumbo v1, "ZYX"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ZYX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->XYZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ZXY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->XZY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YXZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ZYX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    return-object v0
.end method
