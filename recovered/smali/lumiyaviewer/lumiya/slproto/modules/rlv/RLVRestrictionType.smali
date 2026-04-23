.class public final enum Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum edit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum rez:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

.field public static final enum viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;


# instance fields
.field private ruleMatchType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "detach"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "sendchat"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "recvchat"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "sendim"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-direct {v0, v1, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "recvim"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-direct {v0, v1, v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "tplm"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "tploc"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/4 v3, 0x6

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "sittp"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/4 v3, 0x7

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "tplure"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0x8

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "accepttp"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0x9

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "showinv"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0xa

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "viewnote"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0xb

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "edit"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0xc

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->edit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "rez"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0xd

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->rez:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "unsit"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0xe

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "sit"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0xf

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "remoutfit"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0x10

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "addoutfit"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0x11

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "redirchat"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0x12

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v1, "sendchannel"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/16 v3, 0x13

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v0, 0x14

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->edit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->rez:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->ruleMatchType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    return-object v0
.end method


# virtual methods
.method public getRuleMatchType()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->ruleMatchType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    return-object v0
.end method
