.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(ZIZZ)Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;-><init>(ZIZZ)V

    return-object v0
.end method


# virtual methods
.method public abstract hasHUDs()Z
.end method

.method public abstract isFlying()Z
.end method

.method public abstract isSitting()Z
.end method

.method public abstract sittingOn()I
.end method
