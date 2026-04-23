.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->-com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->-com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->System:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Unknown:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->-com-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static loadFrom(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
    .locals 2
    .param p0    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getSenderType()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->-getcom-lumiyaviewer-lumiya-slproto-users-chatsrc-ChatMessageSource$ChatMessageSourceTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Unknown message type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v0

    return-object v0

    :pswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceSystem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceSystem;-><init>()V

    return-object v0

    :pswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    return-object v0

    :pswitch_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    return-object v0

    :pswitch_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public abstract getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract getSourceUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public serializeTo(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->ordinal()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSenderType(Ljava/lang/Integer;)V

    return-void
.end method
