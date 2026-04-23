.class public abstract Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;


# instance fields
.field private avatarProperties:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_ProfileTextFieldEditFragment-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->onAvatarProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V

    return-void
.end method

.method protected abstract onAvatarProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarProperties()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$6hJe-KPqqQcY7xiCxogddm78oYc;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$6hJe-KPqqQcY7xiCxogddm78oYc;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_1
    return-void
.end method
