.class public Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;
.super Ljava/lang/Object;


# instance fields
.field private final visualParamValues:[I
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method private constructor <init>([I)V
    .locals 0
    .param p1    # [I
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->visualParamValues:[I

    return-void
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;
    .locals 7
    .param p0    # Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/16 v6, 0xda

    const/4 v2, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "DrawableAvatar: new appearance for avatar "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;->ID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", numParams = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", appData = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->AppearanceData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    move v1, v2

    :goto_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->AppearanceData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    const-string/jumbo v3, "appData[%d]: appVer %d, cofVer %d, flags 0x%x"

    const/4 v0, 0x4

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->AppearanceData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;->AppearanceVersion:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x1

    aput-object v0, v4, v5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->AppearanceData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;->CofVersion:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x2

    aput-object v0, v4, v5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->AppearanceData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;->Flags:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x3

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    new-array v3, v6, [I

    move v1, v2

    :goto_1
    if-ge v1, v6, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$VisualParam;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$VisualParam;->ParamValue:I

    aput v0, v3, v1

    :goto_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_1
    if-eqz p0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->visualParamValues:[I

    aget v0, v0, v1

    :goto_3
    aput v0, v3, v1

    goto :goto_2

    :cond_2
    move v0, v2

    goto :goto_3

    :cond_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;-><init>([I)V

    return-object v0
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;[I)Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;
    .locals 5
    .param p0    # Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/4 v3, 0x0

    const/16 v2, 0xda

    array-length v0, p1

    if-ne v0, v2, :cond_0

    :goto_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;-><init>([I)V

    return-object v0

    :cond_0
    new-array v0, v2, [I

    array-length v1, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v1, p1

    if-ge v1, v2, :cond_1

    if-eqz p0, :cond_1

    array-length v1, p1

    rsub-int v1, v1, 0xda

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->visualParamValues:[I

    array-length v3, p1

    array-length v4, p1

    invoke-static {v2, v3, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p1, v0

    goto :goto_0

    :cond_1
    move-object p1, v0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->visualParamValues:[I

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->visualParamValues:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getParamCount()I
    .locals 1

    const/16 v0, 0xda

    return v0
.end method

.method public getParamValue(I)I
    .locals 2

    const/4 v1, 0x0

    if-ltz p1, :cond_0

    const/16 v0, 0xda

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->visualParamValues:[I

    aget v0, v0, p1

    return v0

    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->visualParamValues:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    return v0
.end method
