.class final synthetic Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;->-$f2:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    invoke-static {v0, v1, v2, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_13525(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;Ljava/lang/String;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onTextEntered(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;->$m$0(Ljava/lang/String;)V

    return-void
.end method
