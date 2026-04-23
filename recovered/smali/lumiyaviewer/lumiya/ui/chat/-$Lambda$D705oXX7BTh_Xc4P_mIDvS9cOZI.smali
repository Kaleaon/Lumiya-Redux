.class final synthetic Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$D705oXX7BTh_Xc4P_mIDvS9cOZI;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$D705oXX7BTh_Xc4P_mIDvS9cOZI;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->lambda$-com_lumiyaviewer_lumiya_ui_chat_ExportChatHistoryTask_2020(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$D705oXX7BTh_Xc4P_mIDvS9cOZI;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$D705oXX7BTh_Xc4P_mIDvS9cOZI;->$m$0(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    return-void
.end method
