.class public Lcom/lumiyaviewer/lumiya/GridConnectionService$GridServiceBinder;
.super Landroid/os/Binder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/GridConnectionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GridServiceBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/GridConnectionService;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$GridServiceBinder;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getEventBus()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$GridServiceBinder;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-get0(Lcom/lumiyaviewer/lumiya/GridConnectionService;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    return-object v0
.end method

.method public getGridConn()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-get1()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    return-object v0
.end method
