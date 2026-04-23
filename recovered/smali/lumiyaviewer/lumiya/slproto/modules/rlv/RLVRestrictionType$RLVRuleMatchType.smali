.class public final enum Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RLVRuleMatchType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

.field public static final enum TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

.field public static final enum TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

.field public static final enum TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

.field public static final enum TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const-string/jumbo v1, "TargetSpecifiesException"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const-string/jumbo v1, "TargetSpecifiesRestriction"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const-string/jumbo v1, "TargetNoExceptions"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const-string/jumbo v1, "TargetSpecifiesAllowance"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    return-object v0
.end method
