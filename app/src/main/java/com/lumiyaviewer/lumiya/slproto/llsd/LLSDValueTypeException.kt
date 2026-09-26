package com.lumiyaviewer.lumiya.slproto.llsd

open class LLSDValueTypeException : LLSDException {
    constructor() : super("Invalid value type")
    constructor(requested: String, node: LLSDNode) :
        super("Invalid value type: requested $requested, actual ${node.javaClass.simpleName}")

    companion object { private const val serialVersionUID: Long = -1831477542961670453L }
}
