.class public Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;,
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;,
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$InventoryEntrySpan;,
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;,
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;
    }
.end annotation


# static fields
.field private static final DELIM_ANY:Ljava/lang/String; = " \t\n"

.field private static final DELIM_EOL:Ljava/lang/String; = "\n"


# instance fields
.field private attachments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;",
            ">;"
        }
    .end annotation
.end field

.field private isScript:Z

.field private notecardText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/text/Spanned;Z)V
    .locals 11

    const/4 v5, -0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->isScript:Z

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    invoke-interface {p1}, Landroid/text/Spanned;->length()I

    move-result v0

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$InventoryEntrySpan;

    invoke-interface {p1, v2, v0, v1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$InventoryEntrySpan;

    array-length v1, v0

    new-array v8, v1, [I

    array-length v1, v0

    new-array v9, v1, [I

    move v1, v2

    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    aget-object v3, v0, v1

    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    aput v3, v8, v1

    aget-object v3, v0, v1

    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v3

    aput v3, v9, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v2

    move v3, v2

    :goto_1
    invoke-interface {p1}, Landroid/text/Spanned;->length()I

    move-result v4

    if-ge v3, v4, :cond_3

    move v4, v2

    :goto_2
    array-length v6, v0

    if-ge v4, v6, :cond_5

    aget v6, v8, v4

    if-lt v6, v3, :cond_2

    :goto_3
    invoke-interface {p1}, Landroid/text/Spanned;->length()I

    move-result v6

    if-eq v4, v5, :cond_1

    aget v6, v8, v4

    :cond_1
    invoke-interface {p1, v3, v6}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    if-eq v4, v5, :cond_4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;

    aget-object v10, v0, v4

    invoke-interface {v10}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$InventoryEntrySpan;->getEntry()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v10

    invoke-direct {v6, v1, v10}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;-><init>(ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const v3, 0xdbc0

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const v3, 0xdc00

    add-int/2addr v3, v1

    int-to-char v3, v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    aget v3, v9, v4

    goto :goto_1

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_3
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    return-void

    :cond_4
    move v3, v6

    goto :goto_1

    :cond_5
    move v4, v5

    goto :goto_3
.end method

.method public constructor <init>(Z)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->isScript:Z

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([BZ)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->isScript:Z

    if-eqz p2, :cond_2

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    :cond_1
    return-void

    :cond_2
    new-instance v1, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v2, " \t\n"

    invoke-direct {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "Linden text version 2"

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v0, "{"

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    :goto_0
    const-string/jumbo v0, " \t\n"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "LLEmbeddedItems"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v0, "\n"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->parseEmbeddedItems(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    goto :goto_0

    :cond_3
    const-string/jumbo v2, "Text"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v0, "length"

    const-string/jumbo v2, " \t\n"

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v0, "\n"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    move-result v0

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->skipOneDelimiter(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getSubstring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    goto :goto_0

    :cond_4
    new-instance v1, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unknown tag type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static createSingleEditableAttachment(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Landroid/text/Spanned;
    .locals 5

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    const-string/jumbo v1, "\u27f9"

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x21

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object v0
.end method

.method private findAttachmentByCode(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->extCharIndex:I

    if-ne v2, p1, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    return-object v0

    :cond_1
    return-object v3
.end method

.method private parseEmbeddedItems(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    const-string/jumbo v0, "{"

    const-string/jumbo v1, "\n"

    invoke-virtual {p1, v0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v0, "count"

    const-string/jumbo v1, " \t\n"

    invoke-virtual {p1, v0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v0, "\n"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    move-result v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    const-string/jumbo v3, "{"

    const-string/jumbo v4, "\n"

    invoke-virtual {p1, v3, v4}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v3, "ext"

    const-string/jumbo v4, " \t\n"

    invoke-virtual {p1, v3, v4}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    move-result-object v3

    const-string/jumbo v4, "char"

    const-string/jumbo v5, " \t\n"

    invoke-virtual {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    move-result-object v3

    const-string/jumbo v4, "index"

    const-string/jumbo v5, " \t\n"

    invoke-virtual {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v3, "\n"

    invoke-virtual {p1, v3}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    move-result v3

    const-string/jumbo v4, "inv_item"

    const-string/jumbo v5, " \t\n"

    invoke-virtual {p1, v4, v5}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v4, "\n"

    invoke-virtual {p1, v4}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parseString(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v4

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;

    invoke-direct {v5, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;-><init>(ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string/jumbo v3, "}"

    const-string/jumbo v4, "\n"

    invoke-virtual {p1, v3, v4}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "}"

    const-string/jumbo v1, "\n"

    invoke-virtual {p1, v0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    return-object v2
.end method


# virtual methods
.method public toLindenText()[B
    .locals 9

    const/4 v8, 0x1

    const/4 v7, 0x0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->isScript:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, "Linden text version 2\n{\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "LLEmbeddedItems version 1\n{\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "count "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->attachments:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;

    const-string/jumbo v3, "{\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "ext char index "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->extCharIndex:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\tinv_item\t0\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t{\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "item_id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    if-eqz v3, :cond_1

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "parent_id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string/jumbo v3, "\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "permissions"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " 0\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "{\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "base_mask"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "%08x"

    new-array v5, v8, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "owner_mask"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "%08x"

    new-array v5, v8, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "group_mask"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "%08x"

    new-array v5, v8, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "everyone_mask"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "%08x"

    new-array v5, v8, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "next_owner_mask"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "%08x"

    new-array v5, v8, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    if-eqz v3, :cond_2

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "creator_id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    if-eqz v3, :cond_3

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "owner_id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    if-eqz v3, :cond_4

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "last_owner_id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    if-eqz v3, :cond_5

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "group_id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    const-string/jumbo v3, "\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "}\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    if-eqz v3, :cond_6

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "asset_id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "type"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getStringCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "inv_type"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getStringCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "flags"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "%08x"

    new-array v5, v8, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "sale_info"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t0\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "{\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "sale_type"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->getStringCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "sale_price"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "}\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "name"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "|\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "desc"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "|\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\t\t"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "creation_date"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$NotecardAttachment;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "\t}\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "}\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    :cond_7
    const-string/jumbo v0, "}\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    const-string/jumbo v2, "UTF-8"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    const-string/jumbo v2, "Text length "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v0, v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    const-string/jumbo v0, "}\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_2
.end method

.method public toSpannableString(ZLcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;)Landroid/text/SpannableStringBuilder;
    .locals 6

    const/4 v0, 0x0

    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->isScript:Z

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    return-object v2

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const v1, 0xdc00

    sub-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->findAttachmentByCode(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_5

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    const-string/jumbo v0, "\u27f9"

    :goto_0
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const/16 v5, 0x21

    invoke-virtual {v2, v1, v4, v0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_1
    add-int/lit8 v0, v3, 0x1

    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    const v3, 0xdbc0

    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    if-gez v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    :cond_3
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v1, v0, :cond_6

    add-int/lit8 v3, v1, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->notecardText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v3, v0, :cond_0

    :cond_4
    return-object v2

    :cond_5
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;

    invoke-direct {v1, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentClickableSpan;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getReadableTextForLink()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_6
    move v0, v1

    goto :goto_1
.end method
