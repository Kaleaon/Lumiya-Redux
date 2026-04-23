.class final synthetic Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-com_lumiyaviewer_lumiya_GridConnectionService-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onData(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0;->$m$0(Ljava/lang/Object;)V

    return-void
.end method
