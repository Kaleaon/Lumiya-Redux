package com.lumiyaviewer.lumiya.render.shaders

import com.google.common.collect.ImmutableMap
import java.io.BufferedReader
import java.io.IOException

class ShaderPreprocessor(definedMacros: Map<String, String>) {
    private val definedMacros: ImmutableMap<String, String> = ImmutableMap.copyOf(definedMacros)

    private fun processCode(reader: BufferedReader, out: StringBuilder?): String? {
        var last: String? = null
        while (true) {
            val line = reader.readLine() ?: return last
            val trimmed = line.trim()
            if (trimmed.startsWith("#endif") || trimmed.startsWith("#else")) {
                return trimmed
            }
            if (trimmed.startsWith("#ifdef") || trimmed.startsWith("#ifndef")) {
                val isIfdef = trimmed.startsWith("#ifdef")
                val macroDefined = definedMacros.containsKey(trimmed.substring(trimmed.indexOf(' ')).trim())
                var branchResult = processCode(reader, if (isIfdef == macroDefined) out else null)
                if (branchResult == "#else") {
                    branchResult = processCode(reader, if (isIfdef != macroDefined) out else null)
                }
                if (branchResult != "#endif") {
                    throw IOException("#endif expected")
                }
            } else if (out != null) {
                var substituted = trimmed
                for ((key, value) in definedMacros) {
                    substituted = substituted.replace(key, value)
                }
                out.append(substituted).append("\r\n")
                last = substituted
            }
            last = trimmed
        }
    }

    @Throws(IOException::class)
    fun processCode(reader: BufferedReader): String {
        val sb = StringBuilder()
        processCode(reader, sb)
        return sb.toString()
    }
}
