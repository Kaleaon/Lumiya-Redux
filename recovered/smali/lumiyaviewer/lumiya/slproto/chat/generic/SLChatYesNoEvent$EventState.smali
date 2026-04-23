.class public final enum Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EventState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

.field public static final enum EventAccepted:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

.field public static final enum EventCancelled:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

.field public static final enum EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

.field public static final VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    const-string/jumbo v1, "EventNew"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    const-string/jumbo v1, "EventAccepted"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventAccepted:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    const-string/jumbo v1, "EventCancelled"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventCancelled:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventAccepted:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventCancelled:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->values()[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    return-object v0
.end method
