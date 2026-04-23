.class public final enum Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ChatMessageSourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

.field public static final enum Group:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

.field public static final enum Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

.field public static final enum System:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

.field public static final enum Unknown:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

.field public static final enum User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

.field public static final VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    const-string/jumbo v1, "Unknown"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Unknown:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    const-string/jumbo v1, "System"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->System:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    const-string/jumbo v1, "User"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    const-string/jumbo v1, "Group"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    const-string/jumbo v1, "Object"

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Unknown:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->System:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    return-object v0
.end method
