.class public Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;
.super Ljava/lang/Object;


# instance fields
.field public final clientID:Ljava/util/UUID;

.field public final gridName:Ljava/lang/String;

.field public final loginName:Ljava/lang/String;

.field public final loginURL:Ljava/lang/String;

.field public final passwordHash:Ljava/lang/String;

.field public final startLocation:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Intent;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "login"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    const-string/jumbo v0, "password"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    const-string/jumbo v0, "client_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    const-string/jumbo v0, "start_location"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    const-string/jumbo v0, "login_url"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    const-string/jumbo v0, "grid_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    :cond_1
    return v1

    :cond_2
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_5

    :cond_3
    return v1

    :cond_4
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    if-nez v2, :cond_3

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_8

    :cond_6
    return v1

    :cond_7
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    if-nez v2, :cond_6

    :cond_8
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_b

    :cond_9
    return v1

    :cond_a
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    if-nez v2, :cond_9

    :cond_b
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_e

    :cond_c
    return v1

    :cond_d
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    if-nez v2, :cond_c

    :cond_e
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    if-eqz v2, :cond_10

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_11

    :cond_f
    return v1

    :cond_10
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    if-nez v2, :cond_f

    :cond_11
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    if-eqz v2, :cond_13

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_12
    :goto_0
    return v0

    :cond_13
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    if-eqz v2, :cond_12

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_2

    :cond_4
    move v0, v1

    goto :goto_3

    :cond_5
    move v0, v1

    goto :goto_4
.end method

.method public withLocation(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;
    .locals 7

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    move-object v4, p1

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
