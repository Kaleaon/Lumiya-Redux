.class Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getFragmentClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyProfileFragment;

    return-object v0
.end method
