.class public abstract Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;,
        Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatEvent$ChatMessageTypeSwitchesValues:[I = null

.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I = null

.field public static final CHAT_AUDIBLE_BARELY:I = 0x0

.field public static final CHAT_AUDIBLE_FULLY:I = 0x1

.field public static final CHAT_AUDIBLE_NOT:I = -0x1

.field public static final CHAT_SOURCE_AGENT:I = 0x1

.field public static final CHAT_SOURCE_OBJECT:I = 0x2

.field public static final CHAT_SOURCE_SYSTEM:I = 0x0

.field public static final CHAT_SOURCE_UNKNOWN:I = 0x3

.field public static final CHAT_TYPE_DEBUG_MSG:I = 0x6

.field public static final CHAT_TYPE_NORMAL:I = 0x1

.field public static final CHAT_TYPE_OWNER:I = 0x8

.field public static final CHAT_TYPE_REGION:I = 0x7

.field public static final CHAT_TYPE_SHOUT:I = 0x2

.field public static final CHAT_TYPE_START:I = 0x4

.field public static final CHAT_TYPE_STOP:I = 0x5

.field public static final CHAT_TYPE_WHISPER:I = 0x0

.field public static final IM_BUSY_AUTO_RESPONSE:I = 0x14

.field public static final IM_CONSOLE_AND_CHAT_HISTORY:I = 0x15

.field public static final IM_FRIENDSHIP_ACCEPTED:I = 0x27

.field public static final IM_FRIENDSHIP_DECLINED:I = 0x28

.field public static final IM_FRIENDSHIP_OFFERED:I = 0x26

.field public static final IM_FROM_TASK:I = 0x13

.field public static final IM_FROM_TASK_AS_ALERT:I = 0x1f

.field public static final IM_GODLIKE_LURE_USER:I = 0x19

.field public static final IM_GOTO_URL:I = 0x1c

.field public static final IM_GROUP_ELECTION_DEPRECATED:I = 0x1b

.field public static final IM_GROUP_INVITATION:I = 0x3

.field public static final IM_GROUP_INVITATION_ACCEPT:I = 0x23

.field public static final IM_GROUP_INVITATION_DECLINE:I = 0x24

.field public static final IM_GROUP_MESSAGE_DEPRECATED:I = 0x8

.field public static final IM_GROUP_NOTICE:I = 0x20

.field public static final IM_GROUP_NOTICE_INVENTORY_ACCEPTED:I = 0x21

.field public static final IM_GROUP_NOTICE_INVENTORY_DECLINED:I = 0x22

.field public static final IM_GROUP_NOTICE_REQUESTED:I = 0x25

.field public static final IM_GROUP_VOTE:I = 0x7

.field public static final IM_INVENTORY_ACCEPTED:I = 0x5

.field public static final IM_INVENTORY_DECLINED:I = 0x6

.field public static final IM_INVENTORY_OFFERED:I = 0x4

.field public static final IM_LURE_ACCEPTED:I = 0x17

.field public static final IM_LURE_DECLINED:I = 0x18

.field public static final IM_LURE_USER:I = 0x16

.field public static final IM_MESSAGEBOX:I = 0x1

.field public static final IM_MESSAGEBOX_COUNTDOWN:I = 0x2

.field public static final IM_NEW_USER_DEFAULT:I = 0xc

.field public static final IM_NOTHING_SPECIAL:I = 0x0

.field public static final IM_SESSION_CONFERENCE_START:I = 0x10

.field public static final IM_SESSION_GROUP_START:I = 0xf

.field public static final IM_SESSION_INVITE:I = 0xd

.field public static final IM_SESSION_LEAVE:I = 0x12

.field public static final IM_SESSION_P2P_INVITE:I = 0xe

.field public static final IM_SESSION_SEND:I = 0x11

.field public static final IM_TASK_INVENTORY_ACCEPTED:I = 0xa

.field public static final IM_TASK_INVENTORY_DECLINED:I = 0xb

.field public static final IM_TASK_INVENTORY_OFFERED:I = 0x9

.field public static final IM_TELEPORT_REQUEST:I = 0x1a

.field public static final IM_TYPING_START:I = 0x29

.field public static final IM_TYPING_STOP:I = 0x2a


# instance fields
.field protected final agentUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final isOffline:Z

.field private final originalTimestamp:Ljava/util/Date;

.field protected final source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final timestamp:Ljava/util/Date;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-chat-generic-SLChatEvent$ChatMessageTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatEvent$ChatMessageTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatEvent$ChatMessageTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->values()[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->BalanceChanged:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_15

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->EnableRLVOffer:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_14

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->FriendshipOffered:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_13

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->FriendshipResult:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_12

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->GroupInvitation:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_11

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->GroupInvitationSent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_10

    :goto_5
    :try_start_6
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->InventoryItemOffered:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_f

    :goto_6
    :try_start_7
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->InventoryItemOfferedByGroupNotice:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_e

    :goto_7
    :try_start_8
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->InventoryItemOfferedByYou:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_d

    :goto_8
    :try_start_9
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->Lure:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_c

    :goto_9
    :try_start_a
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->LureRequest:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_b

    :goto_a
    :try_start_b
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->LureRequested:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_a

    :goto_b
    :try_start_c
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->MissedVoiceCall:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_9

    :goto_c
    :try_start_d
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->PermissionRequest:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_8

    :goto_d
    :try_start_e
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_7

    :goto_e
    :try_start_f
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->SessionMark:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_6

    :goto_f
    :try_start_10
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->SystemMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_5

    :goto_10
    :try_start_11
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->Text:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_4

    :goto_11
    :try_start_12
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->TextBoxDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_3

    :goto_12
    :try_start_13
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->VoiceUpgrade:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_2

    :goto_13
    :try_start_14
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->WentOffline:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_1

    :goto_14
    :try_start_15
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->WentOnline:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_0

    :goto_15
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatEvent$ChatMessageTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_15

    :catch_1
    move-exception v1

    goto :goto_14

    :catch_2
    move-exception v1

    goto :goto_13

    :catch_3
    move-exception v1

    goto :goto_12

    :catch_4
    move-exception v1

    goto :goto_11

    :catch_5
    move-exception v1

    goto :goto_10

    :catch_6
    move-exception v1

    goto :goto_f

    :catch_7
    move-exception v1

    goto :goto_e

    :catch_8
    move-exception v1

    goto :goto_d

    :catch_9
    move-exception v1

    goto :goto_c

    :catch_a
    move-exception v1

    goto :goto_b

    :catch_b
    move-exception v1

    goto/16 :goto_a

    :catch_c
    move-exception v1

    goto/16 :goto_9

    :catch_d
    move-exception v1

    goto/16 :goto_8

    :catch_e
    move-exception v1

    goto/16 :goto_7

    :catch_f
    move-exception v1

    goto/16 :goto_6

    :catch_10
    move-exception v1

    goto/16 :goto_5

    :catch_11
    move-exception v1

    goto/16 :goto_4

    :catch_12
    move-exception v1

    goto/16 :goto_3

    :catch_13
    move-exception v1

    goto/16 :goto_2

    :catch_14
    move-exception v1

    goto/16 :goto_1

    :catch_15
    move-exception v1

    goto/16 :goto_0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/16 v2, 0x19

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->System:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/16 v2, 0x1a

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Unknown:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/16 v2, 0x1b

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getTimestamp()Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getIsOffline()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isOffline:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getOrigTimestamp()Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->originalTimestamp:Ljava/util/Date;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->loadFrom(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->agentUUID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V
    .locals 7
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v6, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->agentUUID:Ljava/util/UUID;

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isOffline:Z

    new-instance v0, Ljava/util/Date;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    int-to-long v2, v1

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->originalTimestamp:Ljava/util/Date;

    :goto_0
    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    return-void

    :cond_0
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isOffline:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->originalTimestamp:Ljava/util/Date;

    goto :goto_0

    :cond_1
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isOffline:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->originalTimestamp:Ljava/util/Date;

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->originalTimestamp:Ljava/util/Date;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isOffline:Z

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->agentUUID:Ljava/util/UUID;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    return-void
.end method

.method public static createViewHolder(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->getResourceId()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->createViewHolder(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public static loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .locals 3
    .param p0    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    if-eqz p0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getMessageType()I

    move-result v1

    aget-object v0, v0, v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-getcom-lumiyaviewer-lumiya-slproto-chat-generic-SLChatEvent$ChatMessageTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    return-object v2

    :pswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByGroupNoticeEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByGroupNoticeEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByYouEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByYouEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipOfferedEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipOfferedEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipResultEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipResultEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationSentEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationSentEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestedEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestedEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;Z)V

    return-object v0

    :pswitch_d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;Z)V

    return-object v0

    :pswitch_e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_10
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_11
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLEnableRLVOfferEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLEnableRLVOfferEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_12
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_13
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_14
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :pswitch_15
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLMissedVoiceCallEvent;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLMissedVoiceCallEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-object v0

    :cond_0
    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_11
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_9
        :pswitch_b
        :pswitch_a
        :pswitch_15
        :pswitch_e
        :pswitch_f
        :pswitch_12
        :pswitch_13
        :pswitch_0
        :pswitch_10
        :pswitch_14
        :pswitch_d
        :pswitch_c
    .end packed-switch
.end method


# virtual methods
.method public bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V
    .locals 10
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v9, 0x2

    const/16 v8, 0x8

    const/4 v7, -0x1

    const/4 v1, 0x0

    const/4 v6, 0x0

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v0, v3, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->agentUUID:Ljava/util/UUID;

    invoke-static {v0, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v3, :cond_0

    if-eqz v0, :cond_0

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    :cond_0
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v3, :cond_1

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eq v3, v2, :cond_1

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v6, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v7, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setDefaultIcon(IZ)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v7}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setForceIcon(I)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v8}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIcon:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setAttachedMessageSource(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    :cond_1
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v3, :cond_2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eq v3, v2, :cond_2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v6, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v7, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setDefaultIcon(IZ)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v7}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setForceIcon(I)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v8}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->chatSourceIconRight:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v3, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setAttachedMessageSource(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    :cond_2
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->bubbleView:Landroid/view/View;

    if-eqz v3, :cond_4

    if-eqz v0, :cond_c

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->bubbleView:Landroid/view/View;

    const v4, 0x7f020140

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_1
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->bubbleView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    if-eqz v0, :cond_d

    const v0, 0x7f01005b

    :goto_2
    const/4 v5, 0x1

    invoke-virtual {v4, v0, v3, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->bubbleView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_3

    iget v3, v3, Landroid/util/TypedValue;->data:I

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v3, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->bubbleView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_4
    if-eqz v2, :cond_5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->-getcom-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues()[I

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v3

    aget v0, v0, v3

    packed-switch v0, :pswitch_data_0

    invoke-virtual {v2, v6, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    invoke-virtual {v2, v7, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setDefaultIcon(IZ)V

    invoke-virtual {v2, v7}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setForceIcon(I)V

    invoke-virtual {v2, v8}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    invoke-virtual {v2, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setAttachedMessageSource(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    :cond_5
    :goto_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->timestampView:Landroid/widget/TextView;

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getShowTimestamps()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->setupTimestampUpdate(Landroid/content/Context;J)V

    if-eqz p3, :cond_6

    invoke-virtual {p3, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->addViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;)V

    :cond_6
    :goto_4
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->textView:Landroid/widget/TextView;

    if-eqz v0, :cond_a

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v2, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0, v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Landroid/text/SpannableStringBuilder;

    invoke-direct {v4}, Landroid/text/SpannableStringBuilder;-><init>()V

    invoke-static {v2}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_11

    invoke-virtual {v4, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-static {v3}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isActionMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Z

    move-result v5

    if-eqz v5, :cond_10

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :goto_5
    invoke-virtual {v4, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_7
    new-instance v3, Landroid/text/style/StyleSpan;

    const/4 v5, 0x1

    invoke-direct {v3, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v5, 0x21

    invoke-virtual {v4, v3, v1, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_8
    :goto_6
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isOffline:Z

    if-eqz v1, :cond_9

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, " (sent at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v9, v9}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->originalTimestamp:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance v2, Landroid/text/style/StyleSpan;

    invoke-direct {v2, v9}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v1, v3, v1

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const/16 v5, 0x21

    invoke-virtual {v4, v2, v1, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_9
    :try_start_0
    sget-object v1, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {v0, v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_a
    :goto_7
    return-void

    :cond_b
    move v0, v1

    goto/16 :goto_0

    :cond_c
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->bubbleView:Landroid/view/View;

    const v4, 0x7f02013f

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_1

    :cond_d
    const v0, 0x7f01005a

    goto/16 :goto_2

    :pswitch_0
    invoke-virtual {v2, v6, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    const v0, 0x7f0200c6

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setForceIcon(I)V

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setAttachedMessageSource(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    goto/16 :goto_3

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_e

    const-string/jumbo v3, "chatterBindPic: name %s, sourceUUID %s"

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v5, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setAttachedMessageSource(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    goto/16 :goto_3

    :cond_e
    invoke-virtual {v2, v6, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    invoke-virtual {v2, v7, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setDefaultIcon(IZ)V

    invoke-virtual {v2, v7}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setForceIcon(I)V

    invoke-virtual {v2, v8}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    goto/16 :goto_3

    :cond_f
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    :cond_10
    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_5

    :cond_11
    invoke-static {v3}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    invoke-virtual {v4, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_6

    :catch_0
    move-exception v1

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_7

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getAgentUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->agentUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getDatabaseObject()Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;-><init>()V

    :cond_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    return-object v0
.end method

.method protected abstract getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;
    .locals 6

    const-string/jumbo v4, ": "

    const-string/jumbo v5, " "

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5

    if-eqz p3, :cond_1

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isActionMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isActionMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2, p5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :goto_1
    invoke-virtual {v2, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_0
    new-instance v1, Landroid/text/style/StyleSpan;

    const/4 v3, 0x1

    invoke-direct {v1, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x0

    const/16 v4, 0x21

    invoke-virtual {v2, v1, v3, v0, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object v2

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {v2, p4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_1

    :cond_3
    return-object v1
.end method

.method public getSource()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    return-object v0
.end method

.method protected abstract getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
.end method

.method public getTimestamp()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    return-object v0
.end method

.method public abstract getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
.end method

.method protected abstract isActionMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Z
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
.end method

.method public isObjectPopup()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent_21084(Landroid/content/Context;Landroid/view/MenuItem;)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    return v3

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->agentUUID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v0, v2, :cond_1

    const-string/jumbo v0, "clipboard"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    invoke-virtual {v0, v1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    const-string/jumbo v0, "Message copied to clipboard"

    invoke-static {p1, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return v4

    :cond_1
    const-string/jumbo v0, "clipboard"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    const-string/jumbo v2, "Message"

    invoke-static {v2, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f1002fb
        :pswitch_0
    .end packed-switch
.end method

.method protected notifyEventUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->notifyChatEventUpdated(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    :cond_0
    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/support/v7/widget/PopupMenu;

    invoke-direct {v1, v0, p1}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    const v2, 0x7f120002

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/PopupMenu;->inflate(I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;

    invoke-direct {v2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$6;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    invoke-virtual {v1}, Landroid/support/v7/widget/PopupMenu;->show()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public opensNewChatter()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->timestamp:Ljava/util/Date;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setTimestamp(Ljava/util/Date;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isOffline:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setIsOffline(Ljava/lang/Boolean;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->originalTimestamp:Ljava/util/Date;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setOrigTimestamp(Ljava/util/Date;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setMessageType(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setViewType(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->serializeTo(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    return-void
.end method
