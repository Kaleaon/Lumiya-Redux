.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;
    }
.end annotation


# static fields
.field private static final dialogButtonIds:[I


# instance fields
.field private final buttons:[Ljava/lang/String;

.field private selectedOption:Ljava/lang/String;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;)[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1()[I
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->dialogButtonIds:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xc

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->dialogButtonIds:[I

    return-void

    :array_0
    .array-data 4
        0x7f100135
        0x7f100136
        0x7f100137
        0x7f100132
        0x7f100133
        0x7f100134
        0x7f10012f
        0x7f100130
        0x7f100131
        0x7f10012c
        0x7f10012d
        0x7f10012e
    .end array-data
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 3
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getDialogSelectedOption()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getDialogButtons()[B

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;Ljava/util/UUID;[Ljava/lang/String;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;Ljava/util/UUID;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V
    .locals 7
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const v6, 0x7f10012a

    const/4 v4, 0x1

    const/16 v5, 0x8

    const/4 v1, 0x0

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->setDialogEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->ignored:Z

    if-eqz v0, :cond_3

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->ignored:Z

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    const v2, 0x7f0900fe

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonsLayout:Landroid/view/View;

    const v1, 0x7f10012b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardElevation(F)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    aput-object v4, v3, v1

    const v4, 0x7f0900ff

    invoke-virtual {v2, v4, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    move v0, v1

    :goto_2
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    array-length v2, v2

    if-ge v0, v2, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_4

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    aget-object v2, v2, v0

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_3

    :cond_5
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonsLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    const/high16 v1, 0x40800000    # 4.0f

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v2}, Landroid/support/v7/widget/CardView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v4, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardElevation(F)V

    goto :goto_1
.end method

.method public getButtons()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    return-object v0
.end method

.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_DIALOG:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-object v0
.end method

.method public isObjectPopup()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onDialogButton(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V
    .locals 4

    if-ltz p2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    array-length v0, v0

    if-ge p2, v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    aget-object v0, v0, p2

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->chatChannel:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, p2, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendScriptDialogReply(Ljava/util/UUID;IILjava/lang/String;)V

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    :cond_1
    return-void
.end method

.method public onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->buttons:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setDialogButtons([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->selectedOption:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setDialogSelectedOption(Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public showDialog(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->text:Ljava/lang/String;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;-><init>(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->show()V

    return-void
.end method
