package com.lumiyaviewer.lumiya.slproto.template

import java.io.InputStream
import java.io.InputStreamReader

object MessageTemplateParser {

    @JvmStatic
    fun parseStream(inputStream: InputStream): List<MessageTemplateSchema> {
        val text = InputStreamReader(inputStream, Charsets.UTF_8).use { it.readText() }
        return parseText(text)
    }

    @JvmStatic
    fun parseText(text: String): List<MessageTemplateSchema> {
        val tokens = tokenize(text)
        val schemas = mutableListOf<MessageTemplateSchema>()
        var idx = 0

        while (idx < tokens.size) {
            val token = tokens[idx]
            if (token == "{") {
                idx++
                if (idx >= tokens.size) break
                val msgName = tokens[idx++]
                if (idx >= tokens.size) break
                val freq = tokens[idx++]
                if (idx >= tokens.size) break
                val numStr = tokens[idx++]
                if (idx >= tokens.size) break
                val trust = tokens[idx++]
                if (idx >= tokens.size) break
                val encoding = tokens[idx++]

                val isZeroCoded = encoding.equals("Zerocoded", ignoreCase = true)
                val msgID = calculateMessageID(freq, numStr)

                // Skip any remaining flags until block or end of message
                while (idx < tokens.size && tokens[idx] != "{" && tokens[idx] != "}") {
                    idx++
                }

                val blocks = mutableListOf<TemplateBlockSchema>()
                while (idx < tokens.size && tokens[idx] == "{") {
                    idx++ // Consume '{' for block
                    if (idx >= tokens.size) break
                    val blockName = tokens[idx++]
                    if (idx >= tokens.size) break
                    val repeatStr = tokens[idx++]

                    val repeatType = when (repeatStr.uppercase()) {
                        "SINGLE" -> BlockRepeatType.SINGLE
                        "MULTIPLE" -> BlockRepeatType.MULTIPLE
                        "VARIABLE" -> BlockRepeatType.VARIABLE
                        else -> BlockRepeatType.SINGLE
                    }

                    var count = 1
                    if (repeatType == BlockRepeatType.MULTIPLE) {
                        if (idx < tokens.size && tokens[idx] != "{" && tokens[idx] != "}") {
                            count = tokens[idx++].toIntOrNull() ?: 1
                        }
                    }

                    val fields = mutableListOf<TemplateFieldSchema>()
                    while (idx < tokens.size && tokens[idx] == "{") {
                        idx++ // Consume '{' for field
                        if (idx >= tokens.size) break
                        val fieldName = tokens[idx++]
                        if (idx >= tokens.size) break
                        val fieldTypeStr = tokens[idx++]

                        val type = parseFieldType(fieldTypeStr)
                        var fieldSize = 1

                        if (type == FieldType.VARIABLE || type == FieldType.FIXED) {
                            if (idx < tokens.size && tokens[idx] != "}") {
                                val possibleSize = tokens[idx].toIntOrNull()
                                if (possibleSize != null) {
                                    fieldSize = possibleSize
                                    idx++
                                }
                            }
                        }

                        // Consume until field closing brace '}'
                        while (idx < tokens.size && tokens[idx] != "}") {
                            idx++
                        }
                        if (idx < tokens.size && tokens[idx] == "}") {
                            idx++ // Consume '}' for field
                        }

                        fields.add(TemplateFieldSchema(fieldName, type, fieldSize))
                    }

                    if (idx < tokens.size && tokens[idx] == "}") {
                        idx++ // Consume '}' for block
                    }

                    blocks.add(TemplateBlockSchema(blockName, repeatType, count, fields))
                }

                if (idx < tokens.size && tokens[idx] == "}") {
                    idx++ // Consume '}' for message
                }

                schemas.add(MessageTemplateSchema(msgName, freq, numStr, msgID, isZeroCoded, blocks))
            } else {
                idx++
            }
        }

        return schemas
    }

    private fun tokenize(text: String): List<String> {
        val tokens = mutableListOf<String>()
        val lines = text.lines()
        for (line in lines) {
            val commentIdx = line.indexOf("//")
            val cleanLine = if (commentIdx >= 0) line.substring(0, commentIdx) else line
            var i = 0
            while (i < cleanLine.length) {
                val c = cleanLine[i]
                if (c == '{' || c == '}') {
                    tokens.add(c.toString())
                    i++
                } else if (c.isWhitespace()) {
                    i++
                } else {
                    val start = i
                    while (i < cleanLine.length && !cleanLine[i].isWhitespace() && cleanLine[i] != '{' && cleanLine[i] != '}') {
                        i++
                    }
                    tokens.add(cleanLine.substring(start, i))
                }
            }
        }
        return tokens
    }

    @JvmStatic
    fun calculateMessageID(freq: String, numStr: String): Int {
        val parsedNum = parseNumber(numStr)
        return when (freq.uppercase()) {
            "HIGH" -> parsedNum
            "MEDIUM" -> 65280 or (parsedNum and 0xFF)
            "LOW" -> -65536 or (parsedNum and 0xFFFF)
            "FIXED" -> parsedNum
            else -> parsedNum
        }
    }

    private fun parseNumber(str: String): Int {
        val s = str.trim()
        return if (s.startsWith("0x", ignoreCase = true)) {
            s.substring(2).toLong(16).toInt()
        } else {
            s.toLongOrNull()?.toInt() ?: s.toIntOrNull() ?: 0
        }
    }

    private fun parseFieldType(typeStr: String): FieldType {
        return when (typeStr.uppercase()) {
            "U8" -> FieldType.U8
            "U16" -> FieldType.U16
            "U32" -> FieldType.U32
            "U64" -> FieldType.U64
            "S8" -> FieldType.S8
            "S16" -> FieldType.S16
            "S32" -> FieldType.S32
            "S64" -> FieldType.S64
            "F32" -> FieldType.F32
            "F64" -> FieldType.F64
            "LLUUID" -> FieldType.LLUUID
            "BOOL" -> FieldType.BOOL
            "LLVECTOR3" -> FieldType.LLVECTOR3
            "LLVECTOR3D" -> FieldType.LLVECTOR3D
            "LLVECTOR4" -> FieldType.LLVECTOR4
            "LLQUATERNION" -> FieldType.LLQUATERNION
            "IPADDR" -> FieldType.IPADDR
            "IPPORT" -> FieldType.IPPORT
            "VARIABLE", "VARIABLE1", "VARIABLE2" -> FieldType.VARIABLE
            "FIXED" -> FieldType.FIXED
            else -> FieldType.VARIABLE
        }
    }
}
