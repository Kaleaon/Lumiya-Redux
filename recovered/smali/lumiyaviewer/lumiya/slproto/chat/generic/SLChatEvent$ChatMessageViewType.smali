.class public final enum Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
.super Ljava/lang/Enum;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ChatMessageViewType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

.field public static final VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

.field public static final enum VIEW_TYPE_DIALOG:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

.field public static final enum VIEW_TYPE_NORMAL:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

.field public static final enum VIEW_TYPE_PLAIN:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

.field public static final enum VIEW_TYPE_SESSION_MARK:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

.field public static final enum VIEW_TYPE_TEXTBOX:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

.field public static final enum VIEW_TYPE_YESNO:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;


# instance fields
.field private final alwaysInflate:Z

.field private final resourceId:I

.field private final viewHolderFactory:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;


# direct methods
.method static synthetic -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-0(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-object v0
.end method

.method static synthetic -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-1(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-object v0
.end method

.method static synthetic -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-2(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-object v0
.end method

.method static synthetic -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-3(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-object v0
.end method

.method static synthetic -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-4(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-object v0
.end method

.method static synthetic -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-5(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 13

    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const-string/jumbo v1, "VIEW_TYPE_NORMAL"

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls;-><init>()V

    const v3, 0x7f040026

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;-><init>(Ljava/lang/String;IIZLcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_NORMAL:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const-string/jumbo v4, "VIEW_TYPE_YESNO"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$1;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$1;-><init>()V

    const v6, 0x7f04002b

    move v5, v9

    move v7, v2

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;-><init>(Ljava/lang/String;IIZLcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_YESNO:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const-string/jumbo v4, "VIEW_TYPE_DIALOG"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$2;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$2;-><init>()V

    const v6, 0x7f040027

    move v5, v10

    move v7, v2

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;-><init>(Ljava/lang/String;IIZLcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_DIALOG:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const-string/jumbo v4, "VIEW_TYPE_TEXTBOX"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$3;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$3;-><init>()V

    const v6, 0x7f04002a

    move v5, v11

    move v7, v9

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;-><init>(Ljava/lang/String;IIZLcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_TEXTBOX:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const-string/jumbo v4, "VIEW_TYPE_SESSION_MARK"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$4;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$4;-><init>()V

    const v6, 0x7f040029

    move v5, v12

    move v7, v2

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;-><init>(Ljava/lang/String;IIZLcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_SESSION_MARK:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const-string/jumbo v4, "VIEW_TYPE_PLAIN"

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$5;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/-$Lambda$2ey8fl8aDXV9bCTwS1nc4b06kls$5;-><init>()V

    const/4 v5, 0x5

    const v6, 0x7f040028

    move v7, v2

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;-><init>(Ljava/lang/String;IIZLcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_PLAIN:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_NORMAL:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_YESNO:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_DIALOG:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_TEXTBOX:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    aput-object v1, v0, v11

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_SESSION_MARK:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    aput-object v1, v0, v12

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_PLAIN:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->values()[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIZLcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->resourceId:I

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->alwaysInflate:Z

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->viewHolderFactory:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-object v0
.end method


# virtual methods
.method public final createViewHolder(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->viewHolderFactory:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;

    invoke-interface {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder$Factory;->createViewHolder(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public final getAlwaysInflate()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->alwaysInflate:Z

    return v0
.end method

.method public final getResourceId()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->resourceId:I

    return v0
.end method
