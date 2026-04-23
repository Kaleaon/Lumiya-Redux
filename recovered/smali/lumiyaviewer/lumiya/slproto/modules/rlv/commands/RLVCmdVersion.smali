.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVCommandsSwitchesValues:[I = null

.field private static final RLV_VERSION_BUILD:I = 0x0

.field private static final RLV_VERSION_MAJOR:I = 0x1

.field private static final RLV_VERSION_MINOR:I = 0xa

.field private static final RLV_VERSION_PATCH:I = 0x1

.field private static final RLVa_VERSION_MAJOR:I = 0x1

.field private static final RLVa_VERSION_MINOR:I = 0xa

.field private static final RLVa_VERSION_PATCH:I = 0x1


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-modules-rlv-RLVCommandsSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;->-com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVCommandsSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;->-com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVCommandsSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1b

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1a

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->clear:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_19

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_18

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->edit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_17

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getattach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_16

    :goto_5
    :try_start_6
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_15

    :goto_6
    :try_start_7
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getstatus:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_14

    :goto_7
    :try_start_8
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_13

    :goto_8
    :try_start_9
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_12

    :goto_9
    :try_start_a
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_11

    :goto_a
    :try_start_b
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_10

    :goto_b
    :try_start_c
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->rez:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_f

    :goto_c
    :try_start_d
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_e

    :goto_d
    :try_start_e
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_d

    :goto_e
    :try_start_f
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_c

    :goto_f
    :try_start_10
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_b

    :goto_10
    :try_start_11
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_a

    :goto_11
    :try_start_12
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_9

    :goto_12
    :try_start_13
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x17

    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_8

    :goto_13
    :try_start_14
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x18

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_7

    :goto_14
    :try_start_15
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x19

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_6

    :goto_15
    :try_start_16
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->tpto:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x1a

    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_5

    :goto_16
    :try_start_17
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x1b

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_4

    :goto_17
    :try_start_18
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->version:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_18} :catch_3

    :goto_18
    :try_start_19
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->versionnew:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_19} :catch_2

    :goto_19
    :try_start_1a
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->versionnum:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a .. :try_end_1a} :catch_1

    :goto_1a
    :try_start_1b
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v1

    const/16 v2, 0x1c

    aput v2, v0, v1
    :try_end_1b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_1b} :catch_0

    :goto_1b
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;->-com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVCommandsSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_1b

    :catch_1
    move-exception v1

    goto :goto_1a

    :catch_2
    move-exception v1

    goto :goto_19

    :catch_3
    move-exception v1

    goto :goto_18

    :catch_4
    move-exception v1

    goto :goto_17

    :catch_5
    move-exception v1

    goto :goto_16

    :catch_6
    move-exception v1

    goto :goto_15

    :catch_7
    move-exception v1

    goto :goto_14

    :catch_8
    move-exception v1

    goto :goto_13

    :catch_9
    move-exception v1

    goto :goto_12

    :catch_a
    move-exception v1

    goto :goto_11

    :catch_b
    move-exception v1

    goto/16 :goto_10

    :catch_c
    move-exception v1

    goto/16 :goto_f

    :catch_d
    move-exception v1

    goto/16 :goto_e

    :catch_e
    move-exception v1

    goto/16 :goto_d

    :catch_f
    move-exception v1

    goto/16 :goto_c

    :catch_10
    move-exception v1

    goto/16 :goto_b

    :catch_11
    move-exception v1

    goto/16 :goto_a

    :catch_12
    move-exception v1

    goto/16 :goto_9

    :catch_13
    move-exception v1

    goto/16 :goto_8

    :catch_14
    move-exception v1

    goto/16 :goto_7

    :catch_15
    move-exception v1

    goto/16 :goto_6

    :catch_16
    move-exception v1

    goto/16 :goto_5

    :catch_17
    move-exception v1

    goto/16 :goto_4

    :catch_18
    move-exception v1

    goto/16 :goto_3

    :catch_19
    move-exception v1

    goto/16 :goto_2

    :catch_1a
    move-exception v1

    goto/16 :goto_1

    :catch_1b
    move-exception v1

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getManualVersionReply()Ljava/lang/String;
    .locals 5

    const/4 v4, 0x1

    const-string/jumbo v0, "RestrainedLove viewer v%d.%d.%d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    :try_start_0
    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;->-getcom-lumiyaviewer-lumiya-slproto-modules-rlv-RLVCommandsSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    const-string/jumbo v2, "%s viewer v%d.%d.%d (RLVa %d.%d.%d)"

    const/4 v0, 0x7

    new-array v3, v0, [Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->versionnew:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    if-ne p3, v0, :cond_0

    const-string/jumbo v0, "RestrainedLove"

    :goto_1
    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v3, v4

    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x2

    aput-object v0, v3, v4

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x3

    aput-object v0, v3, v4

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x4

    aput-object v0, v3, v4

    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x5

    aput-object v0, v3, v4

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x6

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->sayOnChannel(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    :try_start_1
    const-string/jumbo v0, "RestrainedLife"

    goto :goto_1

    :pswitch_1
    const-string/jumbo v0, "%d%02d%02d%02d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->sayOnChannel(ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
