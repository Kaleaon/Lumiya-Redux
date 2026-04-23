.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectOwner$HeaderData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectOwner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HeaderData"
.end annotation


# instance fields
.field public GroupID:Ljava/util/UUID;

.field public Override:Z

.field public OwnerID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
