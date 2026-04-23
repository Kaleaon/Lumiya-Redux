.class public final enum Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SLCapability"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum ChatSessionRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum CopyInventoryFromNotecard:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum EventQueueGet:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum FetchInventoryDescendents2:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum GetDisplayNames:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum GetMesh:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum GetTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum GroupMemberData:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum HomeLocation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum NewFileAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum ParcelVoiceInfoRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum ProvisionVoiceAccountRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum UpdateAvatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum UpdateNotecardAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum UpdateNotecardTaskInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum UpdateScriptAgent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum UpdateScriptTask:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

.field public static final enum UploadBakedTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "EventQueueGet"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->EventQueueGet:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "GetTexture"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "UploadBakedTexture"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UploadBakedTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "FetchInventoryDescendents2"

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->FetchInventoryDescendents2:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "GetDisplayNames"

    invoke-direct {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetDisplayNames:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "UpdateNotecardAgentInventory"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateNotecardAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "NewFileAgentInventory"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->NewFileAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "CopyInventoryFromNotecard"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->CopyInventoryFromNotecard:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "UpdateAvatarAppearance"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateAvatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "GetMesh"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetMesh:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "UpdateNotecardTaskInventory"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateNotecardTaskInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "UpdateScriptTask"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateScriptTask:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "UpdateScriptAgent"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateScriptAgent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "GroupMemberData"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GroupMemberData:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "HomeLocation"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->HomeLocation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "ProvisionVoiceAccountRequest"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ProvisionVoiceAccountRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "ParcelVoiceInfoRequest"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ParcelVoiceInfoRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const-string/jumbo v1, "ChatSessionRequest"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ChatSessionRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v0, 0x12

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->EventQueueGet:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UploadBakedTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->FetchInventoryDescendents2:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetDisplayNames:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateNotecardAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->NewFileAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->CopyInventoryFromNotecard:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateAvatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetMesh:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateNotecardTaskInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateScriptTask:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateScriptAgent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GroupMemberData:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->HomeLocation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ProvisionVoiceAccountRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ParcelVoiceInfoRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ChatSessionRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    return-object v0
.end method
