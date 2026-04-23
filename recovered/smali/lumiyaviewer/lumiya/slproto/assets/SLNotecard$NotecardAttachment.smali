.class Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NotecardAttachment"
.end annotation


# instance fields
.field entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field extCharIndex:I


# direct methods
.method public constructor <init>(ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->extCharIndex:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    return-void
.end method
