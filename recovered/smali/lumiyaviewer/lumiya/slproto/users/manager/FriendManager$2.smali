.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onListUpdated()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->FriendsOnline:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->notifyListUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method
