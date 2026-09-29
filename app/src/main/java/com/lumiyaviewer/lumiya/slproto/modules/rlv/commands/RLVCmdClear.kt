package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.HashSet
import java.util.UUID

open class RLVCmdClear : RLVCommand {
    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        val hashSet = HashSet<RLVRestrictionType>()
        for (rlvRestrictionType in RLVRestrictionType.values()) {
            if (option == "") {
                hashSet.add(rlvRestrictionType)
            } else if (rlvRestrictionType.toString().contains(option)) {
                hashSet.add(rlvRestrictionType)
            }
        }
        controller.getRestrictions().removeRestrictions(objectId, hashSet)
    }
}
