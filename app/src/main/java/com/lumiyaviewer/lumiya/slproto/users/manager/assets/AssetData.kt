package com.lumiyaviewer.lumiya.slproto.users.manager.assets

open class AssetData(private val status: Int, private val data: ByteArray) {
    fun getData(): ByteArray = data
    fun getStatus(): Int = status
}
