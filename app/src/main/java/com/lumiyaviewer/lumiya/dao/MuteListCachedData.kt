package com.lumiyaviewer.lumiya.dao

class MuteListCachedData @JvmOverloads constructor(
    var id: Long? = null,
    @get:JvmName("getCRC") @set:JvmName("setCRC")
    var crc: Int = 0,
    var data: ByteArray? = null
)
