package com.lumiyaviewer.lumiya.slproto.modules.rlv

import java.util.UUID

fun interface RLVCommand {
    @Suppress("FunctionName")
    fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?)
}
