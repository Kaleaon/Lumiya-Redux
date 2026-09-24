package com.lumiyaviewer.lumiya.dao;

import com.lumiyaviewer.lumiya.utils.Identifiable;
import java.util.Date;
import java.util.UUID;

public class ChatMessage implements Identifiable<Long> {
    private Boolean accepted;
    private Integer assetType;
    private Integer chatChannel;
    private long chatterID;
    private byte[] dialogButtons;
    private Boolean dialogIgnored;
    private String dialogSelectedOption;
    private Integer eventState;
    private Long id;
    private Boolean isOffline;
    private UUID itemID;
    private String itemName;
    private String messageText;
    private int messageType;
    private Integer newBalance;
    private String objectName;
    private Integer origIMType;
    private Date origTimestamp;
    private Integer questionMask;
    private String senderLegacyName;
    private String senderName;
    private Integer senderType;
    private UUID senderUUID;
    private UUID sessionID;
    private boolean syncedToGoogleDrive;
    private Integer textBoxButtonIndex;
    private Date timestamp;
    private Integer transactionAmount;
    private UUID userID;
    private int viewType;

    public ChatMessage() {
    }

    public ChatMessage(Long id) {
        this.id = id;
    }

    public ChatMessage(Long id, long chatterID, Date date, int viewType, Date origTimestamp, Boolean bool, UUID uuid, Integer num, String senderName, String senderLegacyName, String messageText, int messageType, Integer eventState, Integer origIMType, UUID sessionID, UUID itemID, String itemName, Integer assetType, Integer transactionAmount, Integer newBalance, Integer chatChannel, Boolean dialogIgnored, Boolean accepted, UUID userID, String objectName, Integer questionMask, byte[] bytes, String dialogSelectedOption, Integer textBoxButtonIndex, boolean syncedToGoogleDrive) {
        this.id = id;
        this.chatterID = chatterID;
        this.timestamp = date;
        this.viewType = viewType;
        this.origTimestamp = origTimestamp;
        this.isOffline = bool;
        this.senderUUID = uuid;
        this.senderType = num;
        this.senderName = senderName;
        this.senderLegacyName = senderLegacyName;
        this.messageText = messageText;
        this.messageType = messageType;
        this.eventState = eventState;
        this.origIMType = origIMType;
        this.sessionID = sessionID;
        this.itemID = itemID;
        this.itemName = itemName;
        this.assetType = assetType;
        this.transactionAmount = transactionAmount;
        this.newBalance = newBalance;
        this.chatChannel = chatChannel;
        this.dialogIgnored = dialogIgnored;
        this.accepted = accepted;
        this.userID = userID;
        this.objectName = objectName;
        this.questionMask = questionMask;
        this.dialogButtons = bytes;
        this.dialogSelectedOption = dialogSelectedOption;
        this.textBoxButtonIndex = textBoxButtonIndex;
        this.syncedToGoogleDrive = syncedToGoogleDrive;
    }

    public Boolean getAccepted() {
        return this.accepted;
    }

    public Integer getAssetType() {
        return this.assetType;
    }

    public Integer getChatChannel() {
        return this.chatChannel;
    }

    public long getChatterID() {
        return this.chatterID;
    }

    public byte[] getDialogButtons() {
        return this.dialogButtons;
    }

    public Boolean getDialogIgnored() {
        return this.dialogIgnored;
    }

    public String getDialogSelectedOption() {
        return this.dialogSelectedOption;
    }

    public Integer getEventState() {
        return this.eventState;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public Long getId() {
        return this.id;
    }

    public Boolean getIsOffline() {
        return this.isOffline;
    }

    public UUID getItemID() {
        return this.itemID;
    }

    public String getItemName() {
        return this.itemName;
    }

    public String getMessageText() {
        return this.messageText;
    }

    public int getMessageType() {
        return this.messageType;
    }

    public Integer getNewBalance() {
        return this.newBalance;
    }

    public String getObjectName() {
        return this.objectName;
    }

    public Integer getOrigIMType() {
        return this.origIMType;
    }

    public Date getOrigTimestamp() {
        return this.origTimestamp;
    }

    public Integer getQuestionMask() {
        return this.questionMask;
    }

    public String getSenderLegacyName() {
        return this.senderLegacyName;
    }

    public String getSenderName() {
        return this.senderName;
    }

    public Integer getSenderType() {
        return this.senderType;
    }

    public UUID getSenderUUID() {
        return this.senderUUID;
    }

    public UUID getSessionID() {
        return this.sessionID;
    }

    public boolean getSyncedToGoogleDrive() {
        return this.syncedToGoogleDrive;
    }

    public Integer getTextBoxButtonIndex() {
        return this.textBoxButtonIndex;
    }

    public Date getTimestamp() {
        return this.timestamp;
    }

    public Integer getTransactionAmount() {
        return this.transactionAmount;
    }

    public UUID getUserID() {
        return this.userID;
    }

    public int getViewType() {
        return this.viewType;
    }

    public void setAccepted(Boolean bool) {
        this.accepted = bool;
    }

    public void setAssetType(Integer num) {
        this.assetType = num;
    }

    public void setChatChannel(Integer num) {
        this.chatChannel = num;
    }

    public void setChatterID(long chatterID) {
        this.chatterID = chatterID;
    }

    public void setDialogButtons(byte[] bytes) {
        this.dialogButtons = bytes;
    }

    public void setDialogIgnored(Boolean bool) {
        this.dialogIgnored = bool;
    }

    public void setDialogSelectedOption(String dialogSelectedOption) {
        this.dialogSelectedOption = dialogSelectedOption;
    }

    public void setEventState(Integer num) {
        this.eventState = num;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setIsOffline(Boolean bool) {
        this.isOffline = bool;
    }

    public void setItemID(UUID uuid) {
        this.itemID = uuid;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public void setMessageText(String messageText) {
        this.messageText = messageText;
    }

    public void setMessageType(int messageType) {
        this.messageType = messageType;
    }

    public void setNewBalance(Integer num) {
        this.newBalance = num;
    }

    public void setObjectName(String objectName) {
        this.objectName = objectName;
    }

    public void setOrigIMType(Integer num) {
        this.origIMType = num;
    }

    public void setOrigTimestamp(Date date) {
        this.origTimestamp = date;
    }

    public void setQuestionMask(Integer num) {
        this.questionMask = num;
    }

    public void setSenderLegacyName(String senderLegacyName) {
        this.senderLegacyName = senderLegacyName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public void setSenderType(Integer num) {
        this.senderType = num;
    }

    public void setSenderUUID(UUID uuid) {
        this.senderUUID = uuid;
    }

    public void setSessionID(UUID uuid) {
        this.sessionID = uuid;
    }

    public void setSyncedToGoogleDrive(boolean syncedToGoogleDrive) {
        this.syncedToGoogleDrive = syncedToGoogleDrive;
    }

    public void setTextBoxButtonIndex(Integer num) {
        this.textBoxButtonIndex = num;
    }

    public void setTimestamp(Date date) {
        this.timestamp = date;
    }

    public void setTransactionAmount(Integer num) {
        this.transactionAmount = num;
    }

    public void setUserID(UUID uuid) {
        this.userID = uuid;
    }

    public void setViewType(int viewType) {
        this.viewType = viewType;
    }
}
