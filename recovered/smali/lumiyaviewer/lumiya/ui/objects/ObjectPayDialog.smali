.class public Lcom/lumiyaviewer/lumiya/ui/objects/ObjectPayDialog;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectPayDialog_1356(Landroid/support/v7/app/AlertDialog;Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;Landroid/content/DialogInterface;)V
    .locals 9

    const v0, 0x7f10023d

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec;

    invoke-direct {v1, p5}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100224

    const v1, 0x7f100225

    const v2, 0x7f100226

    const v3, 0x7f100227

    filled-new-array {v0, v1, v2, v3}, [I

    move-result-object v3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->payPrices()Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    array-length v0, v3

    if-ge v1, v0, :cond_2

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-gt v1, v0, :cond_0

    invoke-virtual {v4, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_1
    const/4 v2, -0x2

    if-ne v0, v2, :cond_6

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v0

    move v2, v0

    :goto_2
    if-gtz v2, :cond_1

    aget v0, v3, v1

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    aget v0, v3, v1

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const v5, 0x7f100020

    invoke-virtual {v0, v5, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :goto_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    goto :goto_1

    :cond_1
    aget v0, v3, v1

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v5, 0x7f090263

    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    aget v0, v3, v1

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    aget v0, v3, v1

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const v6, 0x7f100020

    invoke-virtual {v0, v6, v5}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    aget v0, v3, v1

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$3;

    invoke-direct {v5, v2, p3, p4, p5}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$3;-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    :cond_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_5

    const v0, 0x7f100221

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v0

    if-lez v0, :cond_4

    const v0, 0x7f100221

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, 0x7f09023d

    invoke-virtual {p2, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    :goto_4
    const v0, 0x7f10021f

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_5
    const v0, 0x7f100222

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;

    invoke-direct {v1, p0, p3, p4, p5}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_4
    const v0, 0x7f100221

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    :cond_5
    const v0, 0x7f10021f

    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5

    :cond_6
    move v2, v0

    goto/16 :goto_2
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectPayDialog_1464(Landroid/content/DialogInterface;Landroid/view/View;)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectPayDialog_2986(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;ILandroid/content/DialogInterface;Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->DoPayObject(Ljava/util/UUID;I)V

    :cond_0
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectPayDialog_4340(Landroid/support/v7/app/AlertDialog;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;Landroid/content/DialogInterface;Landroid/view/View;)V
    .locals 3

    const v0, 0x7f100221

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->DoPayObject(Ljava/util/UUID;I)V

    :cond_0
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static show(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V
    .locals 6

    const/4 v5, 0x1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v3

    const v4, 0x7f0901c8

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    const v3, 0x7f090241

    invoke-virtual {p0, v3, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v0, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    const v1, 0x7f040078

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setView(I)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$2;

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$X9q_n5C700PWS1S1Fm8NW-TXuec$2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Landroid/support/v7/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method
