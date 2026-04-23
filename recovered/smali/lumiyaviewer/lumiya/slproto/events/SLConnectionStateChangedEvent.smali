.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLConnectionStateChangedEvent;
.super Ljava/lang/Object;


# instance fields
.field public final connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLConnectionStateChangedEvent;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    return-void
.end method
