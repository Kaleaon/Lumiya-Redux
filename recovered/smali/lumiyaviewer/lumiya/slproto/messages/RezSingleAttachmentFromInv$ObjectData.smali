.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public AttachmentPt:I

.field public Description:[B

.field public EveryoneMask:I

.field public GroupMask:I

.field public ItemFlags:I

.field public ItemID:Ljava/util/UUID;

.field public Name:[B

.field public NextOwnerMask:I

.field public OwnerID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
