.class public Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;
.super Ljava/lang/Object;


# instance fields
.field private distance:F

.field private distanceSet:Z

.field private isActiveGroup:Z

.field private isOnline:Z

.field private label:Ljava/lang/String;

.field private lastMessage:Ljava/lang/String;

.field private onlineVisible:Z

.field private thumbnailChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

.field private thumbnailDefaultIcon:I

.field private thumbnailLabel:Ljava/lang/String;

.field private unreadCount:I

.field private voiceActive:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->onlineVisible:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distanceSet:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->reset()V

    return-void
.end method


# virtual methods
.method public getView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 9
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const v3, 0x7f100142

    const/4 v8, 0x1

    const/16 v2, 0x8

    const/4 v1, 0x0

    const/4 v4, 0x0

    if-eqz p2, :cond_17

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v0

    const v5, 0x7f10013e

    if-ne v0, v5, :cond_17

    move-object v0, p2

    :goto_0
    if-nez v0, :cond_16

    const v0, 0x7f04002c

    invoke-virtual {p1, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    :goto_1
    if-eqz v5, :cond_a

    const v0, 0x7f100140

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->label:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f100145

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->onlineVisible:Z

    if-eqz v6, :cond_b

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    :goto_2
    const v0, 0x7f100143

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->voiceActive:Z

    if-eqz v0, :cond_c

    move v0, v1

    :goto_3
    invoke-virtual {v6, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    if-eqz p4, :cond_d

    move v0, v3

    :goto_4
    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_2

    iget-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distanceSet:Z

    if-eqz v6, :cond_10

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distance:F

    const/high16 v6, 0x41180000    # 9.5f

    cmpl-float v4, v4, v6

    if-ltz v4, :cond_e

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distance:F

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    :goto_5
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, " m"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distance:F

    const/high16 v6, 0x41a00000    # 20.0f

    cmpg-float v4, v4, v6

    if-gtz v4, :cond_f

    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v0, v4, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :goto_6
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_2
    :goto_7
    if-nez p4, :cond_12

    :goto_8
    invoke-virtual {v5, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    const v0, 0x7f100144

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->unreadCount:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->unreadCount:I

    if-eqz v3, :cond_13

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_4
    :goto_9
    const v0, 0x7f100141

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_5

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->lastMessage:Ljava/lang/String;

    if-eqz v3, :cond_14

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->lastMessage:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_5
    :goto_a
    const v0, 0x7f100146

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->isActiveGroup:Z

    if-eqz v0, :cond_15

    move v0, v1

    :goto_b
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_6
    const v0, 0x7f10013f

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v0, :cond_9

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailDefaultIcon:I

    invoke-virtual {v0, v3, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setDefaultIcon(IZ)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailLabel:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-nez v3, :cond_7

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailDefaultIcon:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_8

    :cond_7
    move v2, v1

    :cond_8
    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    :cond_9
    const v0, 0x7f100120

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;

    if-eqz v0, :cond_a

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_a
    return-object v5

    :cond_b
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    :cond_c
    move v0, v2

    goto/16 :goto_3

    :cond_d
    const v0, 0x7f100147

    goto/16 :goto_4

    :cond_e
    const-string/jumbo v4, "%.1f"

    new-array v6, v8, [Ljava/lang/Object;

    iget v7, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distance:F

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_5

    :cond_f
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-static {v4, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto/16 :goto_6

    :cond_10
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p4, :cond_11

    move v4, v2

    :goto_c
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_7

    :cond_11
    const/4 v4, 0x4

    goto :goto_c

    :cond_12
    const v3, 0x7f100147

    goto/16 :goto_8

    :cond_13
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_9

    :cond_14
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_a

    :cond_15
    move v0, v2

    goto/16 :goto_b

    :cond_16
    move-object v5, v0

    goto/16 :goto_1

    :cond_17
    move-object v0, v4

    goto/16 :goto_0
.end method

.method public reset()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->label:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->onlineVisible:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distanceSet:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->unreadCount:I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->lastMessage:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->isActiveGroup:Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailLabel:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailDefaultIcon:I

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->voiceActive:Z

    return-void
.end method

.method public setActiveGroup(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->isActiveGroup:Z

    return-void
.end method

.method public setDistance(F)V
    .locals 1

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distanceSet:Z

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distanceSet:Z

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->distance:F

    goto :goto_0
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->label:Ljava/lang/String;

    return-void
.end method

.method public setLastMessage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->lastMessage:Ljava/lang/String;

    return-void
.end method

.method public setOnlineStatusIcon(ZZ)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->onlineVisible:Z

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->isOnline:Z

    return-void
.end method

.method public setThumbnailChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailLabel:Ljava/lang/String;

    return-void
.end method

.method public setThumbnailDefaultIcon(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->thumbnailDefaultIcon:I

    return-void
.end method

.method public setUnreadCount(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->unreadCount:I

    return-void
.end method

.method public setVoiceActive(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->voiceActive:Z

    return-void
.end method
