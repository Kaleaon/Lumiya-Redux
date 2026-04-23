.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NotecardData"
.end annotation


# instance fields
.field public NotecardItemID:Ljava/util/UUID;

.field public ObjectID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
