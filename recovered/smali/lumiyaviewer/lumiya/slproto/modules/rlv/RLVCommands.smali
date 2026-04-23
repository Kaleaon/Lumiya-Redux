.class public final enum Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum clear:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum edit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum getattach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum getoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum getstatus:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum rez:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum tpto:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum version:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum versionnew:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum versionnum:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

.field public static final enum viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;


# instance fields
.field private handler:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "version"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->version:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "versionnew"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->versionnew:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "versionnum"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->versionnum:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "clear"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdClear;

    invoke-direct {v0, v1, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->clear:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "detach"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdDetach;

    invoke-direct {v0, v1, v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "sendchat"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdSendChat;

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "recvchat"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdRecvChat;

    const/4 v3, 0x6

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "sendim"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdSendIM;

    const/4 v3, 0x7

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "recvim"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdRecvIM;

    const/16 v3, 0x8

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "tplm"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdTeleportLandmark;

    const/16 v3, 0x9

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "tploc"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdTeleportLocation;

    const/16 v3, 0xa

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "sittp"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdTeleportSit;

    const/16 v3, 0xb

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "tplure"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdTeleportLure;

    const/16 v3, 0xc

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "tpto"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdTeleportTo;

    const/16 v3, 0xd

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tpto:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "accepttp"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdAcceptTeleport;

    const/16 v3, 0xe

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "showinv"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdShowInventory;

    const/16 v3, 0xf

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "viewnote"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdViewNotecard;

    const/16 v3, 0x10

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "edit"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdEditObjects;

    const/16 v3, 0x11

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->edit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "rez"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdRezObjects;

    const/16 v3, 0x12

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->rez:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "unsit"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdUnsit;

    const/16 v3, 0x13

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "sit"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdSit;

    const/16 v3, 0x14

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "remoutfit"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdRemoveOutfit;

    const/16 v3, 0x15

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "getoutfit"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGetOutfit;

    const/16 v3, 0x16

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "addoutfit"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdAddOutfit;

    const/16 v3, 0x17

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "getattach"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGetAttach;

    const/16 v3, 0x18

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getattach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "getstatus"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGetStatus;

    const/16 v3, 0x19

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getstatus:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "sendchannel"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdSendChannel;

    const/16 v3, 0x1a

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const-string/jumbo v1, "redirchat"

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdRedirChat;

    const/16 v3, 0x1b

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v0, 0x1c

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->version:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->versionnew:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->versionnum:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->clear:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tpto:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->edit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->rez:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getattach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getstatus:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->handler:Ljava/lang/Class;

    return-void
.end method

.method public static getCommand(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    return-object v0
.end method


# virtual methods
.method public getHandler()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;
    .locals 2

    const/4 v1, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->handler:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    return-object v1

    :catch_1
    move-exception v0

    return-object v1

    :catch_2
    move-exception v0

    return-object v1
.end method
