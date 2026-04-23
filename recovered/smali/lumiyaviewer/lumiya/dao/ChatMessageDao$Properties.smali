.class public Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Properties"
.end annotation


# static fields
.field public static final Accepted:Lde/greenrobot/dao/Property;

.field public static final AssetType:Lde/greenrobot/dao/Property;

.field public static final ChatChannel:Lde/greenrobot/dao/Property;

.field public static final ChatterID:Lde/greenrobot/dao/Property;

.field public static final DialogButtons:Lde/greenrobot/dao/Property;

.field public static final DialogIgnored:Lde/greenrobot/dao/Property;

.field public static final DialogSelectedOption:Lde/greenrobot/dao/Property;

.field public static final EventState:Lde/greenrobot/dao/Property;

.field public static final Id:Lde/greenrobot/dao/Property;

.field public static final IsOffline:Lde/greenrobot/dao/Property;

.field public static final ItemID:Lde/greenrobot/dao/Property;

.field public static final ItemName:Lde/greenrobot/dao/Property;

.field public static final MessageText:Lde/greenrobot/dao/Property;

.field public static final MessageType:Lde/greenrobot/dao/Property;

.field public static final NewBalance:Lde/greenrobot/dao/Property;

.field public static final ObjectName:Lde/greenrobot/dao/Property;

.field public static final OrigIMType:Lde/greenrobot/dao/Property;

.field public static final OrigTimestamp:Lde/greenrobot/dao/Property;

.field public static final QuestionMask:Lde/greenrobot/dao/Property;

.field public static final SenderLegacyName:Lde/greenrobot/dao/Property;

.field public static final SenderName:Lde/greenrobot/dao/Property;

.field public static final SenderType:Lde/greenrobot/dao/Property;

.field public static final SenderUUID:Lde/greenrobot/dao/Property;

.field public static final SessionID:Lde/greenrobot/dao/Property;

.field public static final SyncedToGoogleDrive:Lde/greenrobot/dao/Property;

.field public static final TextBoxButtonIndex:Lde/greenrobot/dao/Property;

.field public static final Timestamp:Lde/greenrobot/dao/Property;

.field public static final TransactionAmount:Lde/greenrobot/dao/Property;

.field public static final UserID:Lde/greenrobot/dao/Property;

.field public static final ViewType:Lde/greenrobot/dao/Property;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v4, 0x1

    const/4 v1, 0x0

    new-instance v0, Lde/greenrobot/dao/Property;

    const-class v2, Ljava/lang/Long;

    const-string/jumbo v3, "id"

    const-string/jumbo v5, "_id"

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    new-instance v3, Lde/greenrobot/dao/Property;

    sget-object v5, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const-string/jumbo v6, "chatterID"

    const-string/jumbo v8, "CHATTER_ID"

    move v7, v1

    invoke-direct/range {v3 .. v8}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ChatterID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/Date;

    const-string/jumbo v5, "timestamp"

    const-string/jumbo v7, "TIMESTAMP"

    const/4 v3, 0x2

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Timestamp:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "viewType"

    const-string/jumbo v7, "VIEW_TYPE"

    const/4 v3, 0x3

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ViewType:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/Date;

    const-string/jumbo v5, "origTimestamp"

    const-string/jumbo v7, "ORIG_TIMESTAMP"

    const/4 v3, 0x4

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->OrigTimestamp:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Boolean;

    const-string/jumbo v5, "isOffline"

    const-string/jumbo v7, "IS_OFFLINE"

    const/4 v3, 0x5

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->IsOffline:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "senderUUID"

    const-string/jumbo v7, "SENDER_UUID"

    const/4 v3, 0x6

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->SenderUUID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "senderType"

    const-string/jumbo v7, "SENDER_TYPE"

    const/4 v3, 0x7

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->SenderType:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/String;

    const-string/jumbo v5, "senderName"

    const-string/jumbo v7, "SENDER_NAME"

    const/16 v3, 0x8

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->SenderName:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/String;

    const-string/jumbo v5, "senderLegacyName"

    const-string/jumbo v7, "SENDER_LEGACY_NAME"

    const/16 v3, 0x9

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->SenderLegacyName:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/String;

    const-string/jumbo v5, "messageText"

    const-string/jumbo v7, "MESSAGE_TEXT"

    const/16 v3, 0xa

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->MessageText:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "messageType"

    const-string/jumbo v7, "MESSAGE_TYPE"

    const/16 v3, 0xb

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->MessageType:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "eventState"

    const-string/jumbo v7, "EVENT_STATE"

    const/16 v3, 0xc

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->EventState:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "origIMType"

    const-string/jumbo v7, "ORIG_IMTYPE"

    const/16 v3, 0xd

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->OrigIMType:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "sessionID"

    const-string/jumbo v7, "SESSION_ID"

    const/16 v3, 0xe

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->SessionID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "itemID"

    const-string/jumbo v7, "ITEM_ID"

    const/16 v3, 0xf

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ItemID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/String;

    const-string/jumbo v5, "itemName"

    const-string/jumbo v7, "ITEM_NAME"

    const/16 v3, 0x10

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ItemName:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "assetType"

    const-string/jumbo v7, "ASSET_TYPE"

    const/16 v3, 0x11

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->AssetType:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "transactionAmount"

    const-string/jumbo v7, "TRANSACTION_AMOUNT"

    const/16 v3, 0x12

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->TransactionAmount:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "newBalance"

    const-string/jumbo v7, "NEW_BALANCE"

    const/16 v3, 0x13

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->NewBalance:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "chatChannel"

    const-string/jumbo v7, "CHAT_CHANNEL"

    const/16 v3, 0x14

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ChatChannel:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Boolean;

    const-string/jumbo v5, "dialogIgnored"

    const-string/jumbo v7, "DIALOG_IGNORED"

    const/16 v3, 0x15

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->DialogIgnored:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Boolean;

    const-string/jumbo v5, "accepted"

    const-string/jumbo v7, "ACCEPTED"

    const/16 v3, 0x16

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Accepted:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "userID"

    const-string/jumbo v7, "USER_ID"

    const/16 v3, 0x17

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->UserID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/String;

    const-string/jumbo v5, "objectName"

    const-string/jumbo v7, "OBJECT_NAME"

    const/16 v3, 0x18

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ObjectName:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "questionMask"

    const-string/jumbo v7, "QUESTION_MASK"

    const/16 v3, 0x19

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->QuestionMask:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, [B

    const-string/jumbo v5, "dialogButtons"

    const-string/jumbo v7, "DIALOG_BUTTONS"

    const/16 v3, 0x1a

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->DialogButtons:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/String;

    const-string/jumbo v5, "dialogSelectedOption"

    const-string/jumbo v7, "DIALOG_SELECTED_OPTION"

    const/16 v3, 0x1b

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->DialogSelectedOption:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "textBoxButtonIndex"

    const-string/jumbo v7, "TEXT_BOX_BUTTON_INDEX"

    const/16 v3, 0x1c

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->TextBoxButtonIndex:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "syncedToGoogleDrive"

    const-string/jumbo v7, "SYNCED_TO_GOOGLE_DRIVE"

    const/16 v3, 0x1d

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->SyncedToGoogleDrive:Lde/greenrobot/dao/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
