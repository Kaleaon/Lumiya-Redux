.class Lcom/lumiyaviewer/lumiya/res/ResourceManager$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/ResourceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$3;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$3;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->collectReferences()V

    return-void
.end method
