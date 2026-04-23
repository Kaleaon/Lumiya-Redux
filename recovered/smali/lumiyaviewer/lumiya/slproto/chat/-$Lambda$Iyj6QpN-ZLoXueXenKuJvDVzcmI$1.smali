.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->lambda$-com_lumiyaviewer_lumiya_slproto_chat_SLChatTextBoxDialog_4223(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onTextEntered(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;->$m$0(Ljava/lang/String;)V

    return-void
.end method
