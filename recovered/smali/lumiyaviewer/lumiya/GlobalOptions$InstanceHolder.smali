.class Lcom/lumiyaviewer/lumiya/GlobalOptions$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/GlobalOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final Instance:Lcom/lumiyaviewer/lumiya/GlobalOptions;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/GlobalOptions;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/GlobalOptions;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/GlobalOptions;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/GlobalOptions;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
