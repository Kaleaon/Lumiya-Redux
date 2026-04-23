.class Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;
.super Landroid/text/style/ClickableSpan;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$InventoryEntrySpan;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AttachmentClickableSpan"
.end annotation


# instance fields
.field private clickListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;

.field private entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;)V
    .locals 0

    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;->clickListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;

    return-void
.end method


# virtual methods
.method public getEntry()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;->clickListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;->clickListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;->onAttachmentClick(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    return-void
.end method
