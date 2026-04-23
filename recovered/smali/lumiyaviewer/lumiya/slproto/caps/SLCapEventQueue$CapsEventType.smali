.class public final enum Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CapsEventType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum AgentGroupDataUpdate:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum AvatarGroupsReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum BulkUpdateInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum ChatterBoxInvitation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum ChatterBoxSessionStartReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum EstablishAgentCommunication:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum ParcelProperties:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum TeleportFailed:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum TeleportFinish:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

.field public static final enum UnknownCapsEvent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "AgentGroupDataUpdate"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AgentGroupDataUpdate:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "AvatarGroupsReply"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AvatarGroupsReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "ChatterBoxInvitation"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ChatterBoxInvitation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "ChatterBoxSessionStartReply"

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ChatterBoxSessionStartReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "ParcelProperties"

    invoke-direct {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ParcelProperties:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "TeleportFailed"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->TeleportFailed:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "TeleportFinish"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->TeleportFinish:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "BulkUpdateInventory"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->BulkUpdateInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "EstablishAgentCommunication"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->EstablishAgentCommunication:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const-string/jumbo v1, "UnknownCapsEvent"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->UnknownCapsEvent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AgentGroupDataUpdate:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AvatarGroupsReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ChatterBoxInvitation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ChatterBoxSessionStartReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ParcelProperties:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->TeleportFailed:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->TeleportFinish:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->BulkUpdateInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->EstablishAgentCommunication:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->UnknownCapsEvent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    return-object v0
.end method
