.class public Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static askForObjectDerez(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;Ljava/util/UUID;I)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget v0, p1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->derezQuestionId:I

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;

    invoke-direct {v3, p2, p3, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$1;-><init>(Ljava/util/UUID;ILcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$2;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$2;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
