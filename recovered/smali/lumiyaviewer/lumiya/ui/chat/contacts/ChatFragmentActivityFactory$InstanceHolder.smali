.class Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final Instance:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
