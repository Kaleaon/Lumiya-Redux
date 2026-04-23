.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChatData"
.end annotation


# instance fields
.field public Channel:I

.field public ID:Ljava/util/UUID;

.field public Message:[B

.field public Name:[B

.field public OwnerID:Ljava/util/UUID;

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Radius:F

.field public SimAccess:I

.field public SourceType:I

.field public Type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
