package com.lumiyaviewer.lumiya.slproto.template

enum class FieldType {
    U8, U16, U32, U64,
    S8, S16, S32, S64,
    F32, F64,
    LLUUID,
    BOOL,
    LLVECTOR3,
    LLVECTOR3D,
    LLVECTOR4,
    LLQUATERNION,
    IPADDR,
    IPPORT,
    VARIABLE,
    FIXED
}

data class TemplateFieldSchema(
    val name: String,
    val type: FieldType,
    val size: Int = 1
)

enum class BlockRepeatType {
    SINGLE,
    MULTIPLE,
    VARIABLE
}

data class TemplateBlockSchema(
    val name: String,
    val repeatType: BlockRepeatType,
    val count: Int = 1,
    val fields: List<TemplateFieldSchema> = emptyList()
)

data class MessageTemplateSchema(
    val name: String,
    val frequency: String,
    val rawNumber: String,
    val messageID: Int,
    val isZeroCoded: Boolean,
    val blocks: List<TemplateBlockSchema> = emptyList()
)
