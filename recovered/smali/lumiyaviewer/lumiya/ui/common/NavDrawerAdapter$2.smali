.class final Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$2;
.super Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(III)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;-><init>(III)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/Context;)V
    .locals 1

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->show(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method
