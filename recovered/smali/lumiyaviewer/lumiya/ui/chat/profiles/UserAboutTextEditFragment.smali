.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;
.super Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;


# static fields
.field private static final IS_FIRST_LIFE_KEY:Ljava/lang/String; = "isFirstLife"


# instance fields
.field private avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ProfileTextFieldEditFragment;-><init>()V

    return-void
.end method

.method private isFirstLife()Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "isFirstLife"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Landroid/os/Bundle;
    .locals 2

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "isFirstLife"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method


# virtual methods
.method protected decorateFragmentTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const v1, 0x7f090105

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getFieldHint(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090104

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onAvatarProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->isFirstLife()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLAboutText:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->setOriginalText(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->AboutText:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected saveEditedText(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 9

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->AboutText:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLAboutText:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->isFirstLife()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v4, p3

    :goto_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ImageID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLImageID:Ljava/util/UUID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_2

    move v5, v6

    :goto_1
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v8, v8, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    and-int/lit8 v8, v8, 0x2

    if-eqz v8, :cond_3

    :goto_2
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ProfileURL:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdateAvatarProperties(Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    move-object v3, p3

    goto :goto_0

    :cond_2
    move v5, v7

    goto :goto_1

    :cond_3
    move v6, v7

    goto :goto_2
.end method
