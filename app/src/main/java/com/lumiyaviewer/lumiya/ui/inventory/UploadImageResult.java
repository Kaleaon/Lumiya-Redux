package com.lumiyaviewer.lumiya.ui.inventory;

import javax.annotation.Nullable;

/* loaded from: classes.dex */
class UploadImageResult {

    @Nullable
    final String errorMessage;
    final boolean success;

    UploadImageResult(boolean z, @Nullable String str) {
        this.success = z;
        this.errorMessage = str;
    }
}
