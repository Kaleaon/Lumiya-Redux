.class public Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;
.super Landroid/support/v4/view/ActionProvider;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;
    }
.end annotation


# instance fields
.field private objectPopupCount:I

.field private objectPopupsClickListener:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private popupCountTextView:Landroid/widget/TextView;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Landroid/support/v4/view/ActionProvider;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupCount:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->popupCountTextView:Landroid/widget/TextView;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupsClickListener:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;

    return-void
.end method


# virtual methods
.method public isVisible()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupCount:I

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupsClickListener:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupsClickListener:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;->onObjectPopupsClicked()V

    :cond_0
    return-void
.end method

.method public onCreateActionView()Landroid/view/View;
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040079

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f10023e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->popupCountTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->popupCountTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->popupCountTextView:Landroid/widget/TextView;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupCount:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v1
.end method

.method public overridesItemVisibility()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setObjectPopupCount(I)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupCount:I

    if-eq v0, p1, :cond_1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->popupCountTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->popupCountTextView:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->refreshVisibility()V

    :cond_1
    return-void
.end method

.method public setObjectPopupsClickListener(Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->objectPopupsClickListener:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;

    return-void
.end method
