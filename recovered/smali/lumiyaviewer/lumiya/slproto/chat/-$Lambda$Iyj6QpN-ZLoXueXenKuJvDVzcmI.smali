.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->lambda$-com_lumiyaviewer_lumiya_slproto_chat_SLChatTextBoxDialog_4314(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onTextCancelled()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;->$m$0()V

    return-void
.end method
