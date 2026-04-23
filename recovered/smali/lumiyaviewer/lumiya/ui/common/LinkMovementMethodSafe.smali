.class public Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;
.super Landroid/text/method/LinkMovementMethod;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;
    }
.end annotation


# instance fields
.field private onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/text/method/LinkMovementMethod;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    return-void
.end method


# virtual methods
.method public onKeyDown(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    .locals 2

    :try_start_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/text/method/LinkMovementMethod;->onKeyDown(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    const-string/jumbo v1, "Failed to open selected URL."

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;->OnLinkOpenError(Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onKeyUp(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    .locals 2

    :try_start_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/text/method/LinkMovementMethod;->onKeyUp(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    const-string/jumbo v1, "Failed to open selected URL."

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;->OnLinkOpenError(Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTouchEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .locals 2

    :try_start_0
    invoke-super {p0, p1, p2, p3}, Landroid/text/method/LinkMovementMethod;->onTouchEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    const-string/jumbo v1, "Failed to open selected URL."

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;->OnLinkOpenError(Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .locals 2

    :try_start_0
    invoke-super {p0, p1, p2, p3}, Landroid/text/method/LinkMovementMethod;->onTrackballEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    const-string/jumbo v1, "Failed to open selected URL."

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;->OnLinkOpenError(Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setOnLinkOpenErrorListener(Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe;->onLinkOpenErrorListener:Lcom/lumiyaviewer/lumiya/ui/common/LinkMovementMethodSafe$OnLinkOpenErrorListener;

    return-void
.end method
