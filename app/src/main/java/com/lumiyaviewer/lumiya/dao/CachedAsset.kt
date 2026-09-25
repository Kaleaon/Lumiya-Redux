package com.lumiyaviewer.lumiya.dao

class CachedAsset @JvmOverloads constructor(
    var key: String? = null,
    var status: Int = 0,
    var data: ByteArray? = null,
    var mustRevalidate: Boolean = false
)
