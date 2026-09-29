package com.lumiyaviewer.lumiya

import android.util.Log
import java.nio.ByteBuffer

object Debug {
    @JvmField
    val LOG_TAG = "Lumiya"

    @JvmStatic
    fun AlwaysPrintf(str: String, vararg objArr: Any?) {
        val stackTraceElement = Thread.currentThread().stackTrace[3]
        val className = stackTraceElement.className
        Log.d(
            LOG_TAG,
            "[${className.substring(className.lastIndexOf('.') + 1)}::${stackTraceElement.methodName}] ${String.format(str, *objArr)}"
        )
    }

    @JvmStatic
    fun DumpBuffer(str: String, byteBuffer: ByteBuffer) {}

    @JvmStatic
    fun DumpBuffer(str: String, bytes: ByteArray) {}

    @JvmStatic
    fun DumpBuffer(str: String, bytes: ByteArray, i: Int) {}

    @JvmStatic
    fun Log(str: String) {}

    @JvmStatic
    fun Printf(str: String, vararg objArr: Any?) {}

    @JvmStatic
    fun Warning(th: Throwable) {}

    @JvmStatic
    fun isDebugBuild(): Boolean = false
}
