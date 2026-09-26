package com.lumiyaviewer.lumiya.dao

class CachedResponse {
    private var data: ByteArray? = null
    private var key: String? = null
    private var mustRevalidate: Boolean = false

    constructor()

    constructor(key: String?) {
        this.key = key
    }

    constructor(key: String?, bytes: ByteArray?, mustRevalidate: Boolean) {
        this.key = key
        this.data = bytes
        this.mustRevalidate = mustRevalidate
    }

    fun getData(): ByteArray? = data

    fun getKey(): String? = key

    fun getMustRevalidate(): Boolean = mustRevalidate

    fun setData(bytes: ByteArray?) {
        this.data = bytes
    }

    fun setKey(key: String?) {
        this.key = key
    }

    fun setMustRevalidate(mustRevalidate: Boolean) {
        this.mustRevalidate = mustRevalidate
    }
}
