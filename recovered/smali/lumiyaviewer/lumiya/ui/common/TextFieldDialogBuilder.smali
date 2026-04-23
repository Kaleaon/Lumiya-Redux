.class public Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;,
        Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;
    }
.end annotation


# instance fields
.field private cancelledListener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;

.field private final context:Landroid/content/Context;

.field private defaultText:Ljava/lang/String;

.field private listener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->title:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->defaultText:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->listener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->cancelledListener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_TextFieldDialogBuilder_2200(Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->cancelledListener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->cancelledListener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;->onTextCancelled()V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_TextFieldDialogBuilder_2416(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .locals 2

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->listener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->listener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;->onTextEntered(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public setDefaultText(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->defaultText:Ljava/lang/String;

    return-object p0
.end method

.method public setOnTextCancelledListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->cancelledListener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;

    return-object p0
.end method

.method public setOnTextEnteredListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->listener:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;

    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->title:Ljava/lang/String;

    return-object p0
.end method

.method public show()V
    .locals 7

    const/4 v5, 0x1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->defaultText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v5}, Landroid/widget/EditText;->setSingleLine(Z)V

    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v5, v4, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v3, v3

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput v3, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v3, v4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v2, "Cancel"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$PTYOAfnVIwPVEdUoAgskdOeAqDw;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$PTYOAfnVIwPVEdUoAgskdOeAqDw;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v2, "OK"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$PTYOAfnVIwPVEdUoAgskdOeAqDw$1;

    invoke-direct {v3, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$PTYOAfnVIwPVEdUoAgskdOeAqDw$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
