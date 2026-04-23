.class public Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
    }
.end annotation


# static fields
.field private static final emptyChatState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

.field private static final interner:Lcom/google/common/collect/Interner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Interner",
            "<",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final activeSpeakerID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final isConference:Z

.field public final localMicActive:Z

.field public final numActiveSpeakers:I

.field public final previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v3, 0x0

    invoke-static {}, Lcom/google/common/collect/Interners;->newWeakInterner()Lcom/google/common/collect/Interner;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->interner:Lcom/google/common/collect/Interner;

    sget-object v7, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->interner:Lcom/google/common/collect/Interner;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v2, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const/4 v4, 0x0

    move v5, v3

    move v6, v3

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;ILjava/util/UUID;ZZ)V

    invoke-interface {v7, v0}, Lcom/google/common/collect/Interner;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->emptyChatState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    return-void
.end method

.method private constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v1, "state"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const-string/jumbo v1, "previousState"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    const-string/jumbo v1, "numActiveSpeakers"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    const-string/jumbo v1, "activeSpeakerID"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    const-string/jumbo v0, "isConference"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->isConference:Z

    const-string/jumbo v0, "localMicActive"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    return-void

    :cond_0
    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    goto :goto_0
.end method

.method private constructor <init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;ILjava/util/UUID;ZZ)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->isConference:Z

    iput-boolean p6, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    return-void
.end method

.method public static create(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
    .locals 2
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->interner:Lcom/google/common/collect/Interner;

    new-instance v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;-><init>(Landroid/os/Bundle;)V

    invoke-interface {v0, v1}, Lcom/google/common/collect/Interner;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    return-object v0
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;ILjava/util/UUID;ZZ)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
    .locals 8
    .param p0    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v7, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->interner:Lcom/google/common/collect/Interner;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;ILjava/util/UUID;ZZ)V

    invoke-interface {v7, v0}, Lcom/google/common/collect/Interner;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    return-object v0
.end method

.method public static empty()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->emptyChatState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    if-eq p0, p1, :cond_1

    if-nez p1, :cond_2

    :cond_0
    return v0

    :cond_1
    return v1

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    iget v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->isConference:Z

    iget-boolean v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->isConference:Z

    if-ne v2, v3, :cond_4

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    iget-boolean v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    if-ne v2, v3, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v2, v3, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    if-nez v2, :cond_8

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    if-eqz v2, :cond_9

    :goto_0
    return v0

    :cond_3
    return v0

    :cond_4
    return v0

    :cond_5
    return v0

    :cond_6
    return v0

    :cond_7
    return v0

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_9
    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->hashCode()I

    move-result v3

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    iget v3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    add-int/2addr v0, v3

    mul-int/lit8 v3, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v3

    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->isConference:Z

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    if-nez v3, :cond_2

    :goto_2
    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    move v1, v2

    goto :goto_2
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 4

    const/4 v0, 0x0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "state"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "previousState"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    const-string/jumbo v3, "numActiveSpeakers"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    const-string/jumbo v3, "activeSpeakerID"

    if-nez v2, :cond_0

    :goto_0
    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->isConference:Z

    const-string/jumbo v2, "isConference"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    const-string/jumbo v2, "localMicActive"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "VoiceChatInfo{state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", previousState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", numActiveSpeakers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", activeSpeakerID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isConference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->isConference:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", localMicActive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
