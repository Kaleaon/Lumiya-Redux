.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPermissions$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPermissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public Field:I

.field public Mask:I

.field public ObjectLocalID:I

.field public Set:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
