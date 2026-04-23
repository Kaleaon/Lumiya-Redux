.class Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;
.super Ljava/lang/Object;


# instance fields
.field final outputFile:Ljava/io/File;

.field final rawText:Ljava/lang/String;

.field final rawTextTitle:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->outputFile:Ljava/io/File;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->rawText:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportResult;->rawTextTitle:Ljava/lang/String;

    return-void
.end method
