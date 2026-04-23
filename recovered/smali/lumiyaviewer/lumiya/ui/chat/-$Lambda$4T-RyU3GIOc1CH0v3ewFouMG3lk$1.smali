.class final synthetic Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4T-RyU3GIOc1CH0v3ewFouMG3lk$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$OnChatterPictureIDListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4T-RyU3GIOc1CH0v3ewFouMG3lk$1;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterThumbnailData;->-com_lumiyaviewer_lumiya_ui_chat_ChatterThumbnailData-mthref-1(Ljava/util/UUID;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4T-RyU3GIOc1CH0v3ewFouMG3lk$1;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onChatterPictureID(Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4T-RyU3GIOc1CH0v3ewFouMG3lk$1;->$m$0(Ljava/util/UUID;)V

    return-void
.end method
