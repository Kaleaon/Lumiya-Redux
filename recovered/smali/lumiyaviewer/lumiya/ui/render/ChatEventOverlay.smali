.class Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;
.super Ljava/lang/Object;


# instance fields
.field final textView:Landroid/widget/TextView;

.field final timestamp:J


# direct methods
.method constructor <init>(JLandroid/widget/TextView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;->timestamp:J

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;->textView:Landroid/widget/TextView;

    return-void
.end method
