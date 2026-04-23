.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public ChatChannel:I

.field public FirstName:[B

.field public ImageID:Ljava/util/UUID;

.field public LastName:[B

.field public Message:[B

.field public ObjectID:Ljava/util/UUID;

.field public ObjectName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
