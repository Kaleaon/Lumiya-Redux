.class Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;
.super Ljava/lang/ref/WeakReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/react/Subscription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SubscriptionReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/ref/WeakReference",
        "<",
        "Lcom/lumiyaviewer/lumiya/react/Subscription",
        "<TK;TT;>;>;"
    }
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/react/Subscription;Ljava/lang/ref/ReferenceQueue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;",
            "Ljava/lang/ref/ReferenceQueue",
            "<-",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;>;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/react/Subscription;->getKey()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;->key:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;->key:Ljava/lang/Object;

    return-object v0
.end method
