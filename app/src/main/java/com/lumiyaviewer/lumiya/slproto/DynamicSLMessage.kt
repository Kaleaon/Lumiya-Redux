package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.template.BlockRepeatType
import com.lumiyaviewer.lumiya.slproto.template.FieldType
import com.lumiyaviewer.lumiya.slproto.template.MessageTemplateSchema
import com.lumiyaviewer.lumiya.slproto.template.TemplateFieldSchema
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import com.lumiyaviewer.lumiya.slproto.types.LLVector4
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

open class DynamicBlock(
    val name: String,
    val fields: MutableMap<String, Any?> = linkedMapOf()
)

open class DynamicSLMessage(val schema: MessageTemplateSchema) : SLMessage() {

    val blocks: MutableMap<String, MutableList<DynamicBlock>> = linkedMapOf()

    init {
        zeroCoded = schema.isZeroCoded
    }

    override fun CalcPayloadSize(): Int {
        var size = 0
        for (blockSchema in schema.blocks) {
            val list = blocks[blockSchema.name] ?: continue
            if (blockSchema.repeatType == BlockRepeatType.VARIABLE) {
                size += 1
            }
            for (block in list) {
                for (fieldSchema in blockSchema.fields) {
                    val value = block.fields[fieldSchema.name]
                    size += calculateFieldSize(fieldSchema, value)
                }
            }
        }
        return size
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.DefaultMessageHandler(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        for (blockSchema in schema.blocks) {
            val list = blocks[blockSchema.name] ?: emptyList()
            if (blockSchema.repeatType == BlockRepeatType.VARIABLE) {
                packByte(byteBuffer, list.size.toByte())
            }
            for (block in list) {
                for (fieldSchema in blockSchema.fields) {
                    val value = block.fields[fieldSchema.name]
                    packField(byteBuffer, fieldSchema, value)
                }
            }
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        blocks.clear()
        for (blockSchema in schema.blocks) {
            val count = when (blockSchema.repeatType) {
                BlockRepeatType.SINGLE -> 1
                BlockRepeatType.MULTIPLE -> blockSchema.count
                BlockRepeatType.VARIABLE -> unpackByte(byteBuffer).toInt() and 0xFF
            }

            val list = mutableListOf<DynamicBlock>()
            for (i in 0 until count) {
                val block = DynamicBlock(blockSchema.name)
                for (fieldSchema in blockSchema.fields) {
                    val fieldValue = unpackField(byteBuffer, fieldSchema)
                    block.fields[fieldSchema.name] = fieldValue
                }
                list.add(block)
            }
            blocks[blockSchema.name] = list
        }
    }

    fun getBlocks(blockName: String): List<DynamicBlock> {
        return blocks[blockName] ?: emptyList()
    }

    fun getSingleBlock(blockName: String): DynamicBlock? {
        return blocks[blockName]?.firstOrNull()
    }

    fun getValue(blockName: String, fieldName: String, blockIndex: Int = 0): Any? {
        return blocks[blockName]?.getOrNull(blockIndex)?.fields?.get(fieldName)
    }

    fun setValue(blockName: String, fieldName: String, fieldValue: Any?, blockIndex: Int = 0) {
        val list = blocks.getOrPut(blockName) { mutableListOf() }
        while (list.size <= blockIndex) {
            list.add(DynamicBlock(blockName))
        }
        list[blockIndex].fields[fieldName] = fieldValue
    }

    private fun unpackField(byteBuffer: ByteBuffer, fieldSchema: TemplateFieldSchema): Any? {
        return when (fieldSchema.type) {
            FieldType.U8 -> unpackByte(byteBuffer).toInt() and 0xFF
            FieldType.S8 -> unpackByte(byteBuffer)
            FieldType.BOOL -> unpackBoolean(byteBuffer)
            FieldType.U16 -> unpackShort(byteBuffer).toInt() and 0xFFFF
            FieldType.S16, FieldType.IPPORT -> unpackShort(byteBuffer)
            FieldType.U32, FieldType.S32 -> unpackInt(byteBuffer)
            FieldType.U64, FieldType.S64 -> unpackLong(byteBuffer)
            FieldType.F32 -> unpackFloat(byteBuffer)
            FieldType.F64 -> unpackDouble(byteBuffer)
            FieldType.LLUUID -> unpackUUID(byteBuffer)
            FieldType.LLVECTOR3 -> unpackLLVector3(byteBuffer)
            FieldType.LLQUATERNION -> unpackLLQuaternion(byteBuffer)
            FieldType.LLVECTOR3D -> unpackLLVector3d(byteBuffer)
            FieldType.LLVECTOR4 -> unpackLLVector4(byteBuffer)
            FieldType.IPADDR -> unpackIPAddress(byteBuffer)
            FieldType.VARIABLE -> unpackVariable(byteBuffer, fieldSchema.size)
            FieldType.FIXED -> unpackFixed(byteBuffer, fieldSchema.size)
        }
    }

    private fun packField(byteBuffer: ByteBuffer, fieldSchema: TemplateFieldSchema, value: Any?) {
        when (fieldSchema.type) {
            FieldType.U8 -> packByte(byteBuffer, ((value as? Number)?.toInt() ?: 0).toByte())
            FieldType.S8 -> packByte(byteBuffer, ((value as? Number)?.toByte() ?: 0))
            FieldType.BOOL -> packBoolean(byteBuffer, value as? Boolean ?: false)
            FieldType.U16, FieldType.S16, FieldType.IPPORT -> packShort(byteBuffer, ((value as? Number)?.toShort() ?: 0))
            FieldType.U32, FieldType.S32 -> packInt(byteBuffer, ((value as? Number)?.toInt() ?: 0))
            FieldType.U64, FieldType.S64 -> packLong(byteBuffer, ((value as? Number)?.toLong() ?: 0L))
            FieldType.F32 -> packFloat(byteBuffer, ((value as? Number)?.toFloat() ?: 0f))
            FieldType.F64 -> packDouble(byteBuffer, ((value as? Number)?.toDouble() ?: 0.0))
            FieldType.LLUUID -> packUUID(byteBuffer, value as? UUID)
            FieldType.LLVECTOR3 -> packLLVector3(byteBuffer, value as? LLVector3)
            FieldType.LLQUATERNION -> packLLQuaternion(byteBuffer, value as? LLQuaternion)
            FieldType.LLVECTOR3D -> packLLVector3d(byteBuffer, value as? LLVector3d)
            FieldType.LLVECTOR4 -> packLLVector4(byteBuffer, value as? LLVector4)
            FieldType.IPADDR -> packIPAddress(byteBuffer, value as? Inet4Address)
            FieldType.VARIABLE -> packVariable(byteBuffer, value as? ByteArray ?: ByteArray(0), fieldSchema.size)
            FieldType.FIXED -> packFixed(byteBuffer, value as? ByteArray ?: ByteArray(fieldSchema.size), fieldSchema.size)
        }
    }

    private fun calculateFieldSize(fieldSchema: TemplateFieldSchema, value: Any?): Int {
        return when (fieldSchema.type) {
            FieldType.U8, FieldType.S8, FieldType.BOOL -> 1
            FieldType.U16, FieldType.S16, FieldType.IPPORT -> 2
            FieldType.U32, FieldType.S32, FieldType.F32, FieldType.IPADDR -> 4
            FieldType.U64, FieldType.S64, FieldType.F64 -> 8
            FieldType.LLVECTOR3, FieldType.LLQUATERNION -> 12
            FieldType.LLVECTOR4, FieldType.LLUUID -> 16
            FieldType.LLVECTOR3D -> 24
            FieldType.VARIABLE -> fieldSchema.size + ((value as? ByteArray)?.size ?: 0)
            FieldType.FIXED -> fieldSchema.size
        }
    }
}
