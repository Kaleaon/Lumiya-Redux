.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$5;
.super Lbutterknife/internal/DebouncingOnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$5;->val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$5;->val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->onSetHomeButton()V

    return-void
.end method
