.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLObjectPayInfoEvent;
.super Ljava/lang/Object;


# instance fields
.field public objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLObjectPayInfoEvent;->objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    return-void
.end method
