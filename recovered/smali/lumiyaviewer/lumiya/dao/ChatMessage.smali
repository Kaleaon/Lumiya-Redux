.class public Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/utils/Identifiable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/utils/Identifiable",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field private accepted:Ljava/lang/Boolean;

.field private assetType:Ljava/lang/Integer;

.field private chatChannel:Ljava/lang/Integer;

.field private chatterID:J

.field private dialogButtons:[B

.field private dialogIgnored:Ljava/lang/Boolean;

.field private dialogSelectedOption:Ljava/lang/String;

.field private eventState:Ljava/lang/Integer;

.field private id:Ljava/lang/Long;

.field private isOffline:Ljava/lang/Boolean;

.field private itemID:Ljava/util/UUID;

.field private itemName:Ljava/lang/String;

.field private messageText:Ljava/lang/String;

.field private messageType:I

.field private newBalance:Ljava/lang/Integer;

.field private objectName:Ljava/lang/String;

.field private origIMType:Ljava/lang/Integer;

.field private origTimestamp:Ljava/util/Date;

.field private questionMask:Ljava/lang/Integer;

.field private senderLegacyName:Ljava/lang/String;

.field private senderName:Ljava/lang/String;

.field private senderType:Ljava/lang/Integer;

.field private senderUUID:Ljava/util/UUID;

.field private sessionID:Ljava/util/UUID;

.field private syncedToGoogleDrive:Z

.field private textBoxButtonIndex:Ljava/lang/Integer;

.field private timestamp:Ljava/util/Date;

.field private transactionAmount:Ljava/lang/Integer;

.field private userID:Ljava/util/UUID;

.field private viewType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;JLjava/util/Date;ILjava/util/Date;Ljava/lang/Boolean;Ljava/util/UUID;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Integer;Ljava/lang/Integer;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/Integer;[BLjava/lang/String;Ljava/lang/Integer;Z)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->id:Ljava/lang/Long;

    iput-wide p2, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->chatterID:J

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->timestamp:Ljava/util/Date;

    iput p5, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->viewType:I

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->origTimestamp:Ljava/util/Date;

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->isOffline:Ljava/lang/Boolean;

    iput-object p8, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderUUID:Ljava/util/UUID;

    iput-object p9, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderType:Ljava/lang/Integer;

    iput-object p10, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderName:Ljava/lang/String;

    iput-object p11, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderLegacyName:Ljava/lang/String;

    iput-object p12, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->messageText:Ljava/lang/String;

    iput p13, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->messageType:I

    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->eventState:Ljava/lang/Integer;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->origIMType:Ljava/lang/Integer;

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->sessionID:Ljava/util/UUID;

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->itemID:Ljava/util/UUID;

    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->itemName:Ljava/lang/String;

    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->assetType:Ljava/lang/Integer;

    move-object/from16 v0, p20

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->transactionAmount:Ljava/lang/Integer;

    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->newBalance:Ljava/lang/Integer;

    move-object/from16 v0, p22

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->chatChannel:Ljava/lang/Integer;

    move-object/from16 v0, p23

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogIgnored:Ljava/lang/Boolean;

    move-object/from16 v0, p24

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->accepted:Ljava/lang/Boolean;

    move-object/from16 v0, p25

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->userID:Ljava/util/UUID;

    move-object/from16 v0, p26

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->objectName:Ljava/lang/String;

    move-object/from16 v0, p27

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->questionMask:Ljava/lang/Integer;

    move-object/from16 v0, p28

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogButtons:[B

    move-object/from16 v0, p29

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogSelectedOption:Ljava/lang/String;

    move-object/from16 v0, p30

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->textBoxButtonIndex:Ljava/lang/Integer;

    move/from16 v0, p31

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->syncedToGoogleDrive:Z

    return-void
.end method


# virtual methods
.method public getAccepted()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->accepted:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getAssetType()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->assetType:Ljava/lang/Integer;

    return-object v0
.end method

.method public getChatChannel()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->chatChannel:Ljava/lang/Integer;

    return-object v0
.end method

.method public getChatterID()J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->chatterID:J

    return-wide v0
.end method

.method public getDialogButtons()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogButtons:[B

    return-object v0
.end method

.method public getDialogIgnored()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogIgnored:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getDialogSelectedOption()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogSelectedOption:Ljava/lang/String;

    return-object v0
.end method

.method public getEventState()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->eventState:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public bridge synthetic getId()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getIsOffline()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->isOffline:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getItemID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->itemID:Ljava/util/UUID;

    return-object v0
.end method

.method public getItemName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->itemName:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->messageText:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->messageType:I

    return v0
.end method

.method public getNewBalance()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->newBalance:Ljava/lang/Integer;

    return-object v0
.end method

.method public getObjectName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->objectName:Ljava/lang/String;

    return-object v0
.end method

.method public getOrigIMType()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->origIMType:Ljava/lang/Integer;

    return-object v0
.end method

.method public getOrigTimestamp()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->origTimestamp:Ljava/util/Date;

    return-object v0
.end method

.method public getQuestionMask()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->questionMask:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSenderLegacyName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderLegacyName:Ljava/lang/String;

    return-object v0
.end method

.method public getSenderName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderName:Ljava/lang/String;

    return-object v0
.end method

.method public getSenderType()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderType:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSenderUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getSessionID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->sessionID:Ljava/util/UUID;

    return-object v0
.end method

.method public getSyncedToGoogleDrive()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->syncedToGoogleDrive:Z

    return v0
.end method

.method public getTextBoxButtonIndex()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->textBoxButtonIndex:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTimestamp()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->timestamp:Ljava/util/Date;

    return-object v0
.end method

.method public getTransactionAmount()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->transactionAmount:Ljava/lang/Integer;

    return-object v0
.end method

.method public getUserID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->userID:Ljava/util/UUID;

    return-object v0
.end method

.method public getViewType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->viewType:I

    return v0
.end method

.method public setAccepted(Ljava/lang/Boolean;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->accepted:Ljava/lang/Boolean;

    return-void
.end method

.method public setAssetType(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->assetType:Ljava/lang/Integer;

    return-void
.end method

.method public setChatChannel(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->chatChannel:Ljava/lang/Integer;

    return-void
.end method

.method public setChatterID(J)V
    .locals 1

    iput-wide p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->chatterID:J

    return-void
.end method

.method public setDialogButtons([B)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogButtons:[B

    return-void
.end method

.method public setDialogIgnored(Ljava/lang/Boolean;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogIgnored:Ljava/lang/Boolean;

    return-void
.end method

.method public setDialogSelectedOption(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->dialogSelectedOption:Ljava/lang/String;

    return-void
.end method

.method public setEventState(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->eventState:Ljava/lang/Integer;

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->id:Ljava/lang/Long;

    return-void
.end method

.method public setIsOffline(Ljava/lang/Boolean;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->isOffline:Ljava/lang/Boolean;

    return-void
.end method

.method public setItemID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->itemID:Ljava/util/UUID;

    return-void
.end method

.method public setItemName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->itemName:Ljava/lang/String;

    return-void
.end method

.method public setMessageText(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->messageText:Ljava/lang/String;

    return-void
.end method

.method public setMessageType(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->messageType:I

    return-void
.end method

.method public setNewBalance(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->newBalance:Ljava/lang/Integer;

    return-void
.end method

.method public setObjectName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->objectName:Ljava/lang/String;

    return-void
.end method

.method public setOrigIMType(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->origIMType:Ljava/lang/Integer;

    return-void
.end method

.method public setOrigTimestamp(Ljava/util/Date;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->origTimestamp:Ljava/util/Date;

    return-void
.end method

.method public setQuestionMask(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->questionMask:Ljava/lang/Integer;

    return-void
.end method

.method public setSenderLegacyName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderLegacyName:Ljava/lang/String;

    return-void
.end method

.method public setSenderName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderName:Ljava/lang/String;

    return-void
.end method

.method public setSenderType(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderType:Ljava/lang/Integer;

    return-void
.end method

.method public setSenderUUID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->senderUUID:Ljava/util/UUID;

    return-void
.end method

.method public setSessionID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->sessionID:Ljava/util/UUID;

    return-void
.end method

.method public setSyncedToGoogleDrive(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->syncedToGoogleDrive:Z

    return-void
.end method

.method public setTextBoxButtonIndex(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->textBoxButtonIndex:Ljava/lang/Integer;

    return-void
.end method

.method public setTimestamp(Ljava/util/Date;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->timestamp:Ljava/util/Date;

    return-void
.end method

.method public setTransactionAmount(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->transactionAmount:Ljava/lang/Integer;

    return-void
.end method

.method public setUserID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->userID:Ljava/util/UUID;

    return-void
.end method

.method public setViewType(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->viewType:I

    return-void
.end method
