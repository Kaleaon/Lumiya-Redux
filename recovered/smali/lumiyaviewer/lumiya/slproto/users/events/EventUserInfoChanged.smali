.class public Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;
.super Ljava/lang/Object;


# static fields
.field public static final CHANGED_NAME:I = 0x2

.field public static final CHANGED_PROFILE:I = 0x4


# instance fields
.field public final agentUUID:Ljava/util/UUID;

.field public final changedMask:I

.field public final userUUID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Ljava/util/UUID;Ljava/util/UUID;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;->agentUUID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;->userUUID:Ljava/util/UUID;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;->changedMask:I

    return-void
.end method


# virtual methods
.method public isNameChanged()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;->changedMask:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public isProfileChanged()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;->changedMask:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
