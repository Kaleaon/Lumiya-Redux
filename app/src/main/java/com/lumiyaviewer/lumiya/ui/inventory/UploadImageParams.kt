package com.lumiyaviewer.lumiya.ui.inventory

import android.graphics.Bitmap
import java.util.UUID

open class UploadImageParams(
    @JvmField val name: String,
    @JvmField val bitmap: Bitmap,
    @JvmField val agentUUID: UUID,
    @JvmField val folderID: UUID,
)
