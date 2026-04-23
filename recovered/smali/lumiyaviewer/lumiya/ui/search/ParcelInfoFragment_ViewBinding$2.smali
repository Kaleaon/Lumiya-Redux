.class Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$2;
.super Lbutterknife/internal/DebouncingOnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$2;->val$target:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$2;->val$target:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->onParcelOwnerProfileClick()V

    return-void
.end method
