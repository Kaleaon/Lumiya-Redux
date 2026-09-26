package com.lumiyaviewer.lumiya.slproto.assets

open class AssetFormatException : Exception {
    constructor() : super("Unsupported asset format")
    constructor(message: String) : super(message)
    constructor(message: String, cause: Throwable) : super(message, cause)
    companion object { private const val serialVersionUID: Long = -8391424207465457690L }
}
