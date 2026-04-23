.class public final enum Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SessionMarkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

.field public static final enum NewSession:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

.field public static final enum Teleport:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    const-string/jumbo v1, "NewSession"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->NewSession:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    const-string/jumbo v1, "Teleport"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->Teleport:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->NewSession:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->Teleport:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    return-object v0
.end method
