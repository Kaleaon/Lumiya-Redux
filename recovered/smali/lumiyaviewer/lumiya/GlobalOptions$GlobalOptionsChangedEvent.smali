.class public Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/GlobalOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GlobalOptionsChangedEvent"
.end annotation


# instance fields
.field public final preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;->preferences:Landroid/content/SharedPreferences;

    return-void
.end method
