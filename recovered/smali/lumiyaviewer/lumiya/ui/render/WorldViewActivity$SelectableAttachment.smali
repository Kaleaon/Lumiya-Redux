.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SelectableAttachment"
.end annotation


# instance fields
.field private attachmentName:Ljava/lang/String;

.field private localID:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;->localID:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;->attachmentName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getLocalID()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;->localID:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;->attachmentName:Ljava/lang/String;

    return-object v0
.end method
