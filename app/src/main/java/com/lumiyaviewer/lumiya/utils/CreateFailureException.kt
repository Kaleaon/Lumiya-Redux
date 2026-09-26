package com.lumiyaviewer.lumiya.utils

open class CreateFailureException(message: String) : Exception(message) {
    companion object { private const val serialVersionUID: Long = 1L }
}
