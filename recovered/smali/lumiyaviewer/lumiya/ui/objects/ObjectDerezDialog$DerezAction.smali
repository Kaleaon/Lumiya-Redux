.class public final enum Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DerezAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

.field public static final enum Delete:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

.field public static final enum Take:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

.field public static final enum TakeCopy:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;


# instance fields
.field public final deRezDestination:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

.field public final derezQuestionId:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    const-string/jumbo v1, "Take"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_TAKE_INTO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const v3, 0x7f0900e3

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->Take:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    const-string/jumbo v1, "TakeCopy"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_ACQUIRE_TO_AGENT_INVENTORY:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const v3, 0x7f0900e4

    invoke-direct {v0, v1, v5, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->TakeCopy:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    const-string/jumbo v1, "Delete"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->DRD_TRASH:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    const v3, 0x7f0900e2

    invoke-direct {v0, v1, v6, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->Delete:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->Take:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->TakeCopy:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->Delete:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    aput-object v1, v0, v6

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->derezQuestionId:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->deRezDestination:Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    return-object v0
.end method
