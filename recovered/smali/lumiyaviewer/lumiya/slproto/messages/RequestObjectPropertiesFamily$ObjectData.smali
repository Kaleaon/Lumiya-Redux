.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public ObjectID:Ljava/util/UUID;

.field public RequestFlags:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
