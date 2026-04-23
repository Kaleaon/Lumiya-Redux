.class public final enum Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_ACQUIRE_TO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_ATTACHMENT:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_ATTACHMENT_EXISTS:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_ATTACHMENT_TO_INV:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_FORCE_TO_GOD_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_RETURN_TO_LAST_OWNER:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_RETURN_TO_OWNER:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_SAVE_INTO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_SAVE_INTO_TASK_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_TAKE_INTO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public static final enum DRD_TRASH:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;


# instance fields
.field private final code:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_SAVE_INTO_AGENT_INVENTORY"

    invoke-direct {v0, v1, v4, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_SAVE_INTO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_ACQUIRE_TO_AGENT_INVENTORY"

    invoke-direct {v0, v1, v5, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ACQUIRE_TO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_SAVE_INTO_TASK_INVENTORY"

    invoke-direct {v0, v1, v6, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_SAVE_INTO_TASK_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_ATTACHMENT"

    invoke-direct {v0, v1, v7, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ATTACHMENT:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_TAKE_INTO_AGENT_INVENTORY"

    invoke-direct {v0, v1, v8, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_TAKE_INTO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_FORCE_TO_GOD_INVENTORY"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_FORCE_TO_GOD_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_TRASH"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_TRASH:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_ATTACHMENT_TO_INV"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ATTACHMENT_TO_INV:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_ATTACHMENT_EXISTS"

    const/16 v2, 0x8

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ATTACHMENT_EXISTS:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_RETURN_TO_OWNER"

    const/16 v2, 0x9

    const/16 v3, 0x9

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_RETURN_TO_OWNER:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const-string/jumbo v1, "DRD_RETURN_TO_LAST_OWNER"

    const/16 v2, 0xa

    const/16 v3, 0xa

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_RETURN_TO_LAST_OWNER:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const/16 v0, 0xb

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_SAVE_INTO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ACQUIRE_TO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_SAVE_INTO_TASK_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ATTACHMENT:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_TAKE_INTO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_FORCE_TO_GOD_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_TRASH:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ATTACHMENT_TO_INV:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ATTACHMENT_EXISTS:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_RETURN_TO_OWNER:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_RETURN_TO_LAST_OWNER:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->code:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    return-object v0
.end method


# virtual methods
.method public final getCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->code:I

    return v0
.end method
