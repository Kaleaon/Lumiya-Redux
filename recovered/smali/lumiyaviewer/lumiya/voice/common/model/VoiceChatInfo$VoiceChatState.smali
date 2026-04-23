.class public final enum Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VoiceChatState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

.field public static final enum Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

.field public static final enum Connecting:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

.field public static final enum None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

.field public static final enum Ringing:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const-string/jumbo v1, "None"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const-string/jumbo v1, "Ringing"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Ringing:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const-string/jumbo v1, "Connecting"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Connecting:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const-string/jumbo v1, "Active"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Ringing:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Connecting:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->$VALUES:[Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->$VALUES:[Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    return-object v0
.end method
