.class Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;
.super Lcom/lumiyaviewer/lumiya/react/SubscriptionList;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SubscriptionRequestedList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
        "<TK;TT;>;"
    }
.end annotation


# instance fields
.field requested:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;-><init>()V

    return-void
.end method
