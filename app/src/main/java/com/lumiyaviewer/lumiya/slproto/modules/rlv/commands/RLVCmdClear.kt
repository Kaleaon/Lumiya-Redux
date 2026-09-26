package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.HashSet
import java.util.UUID

open class RLVCmdClear : RLVCommand {
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        var hashSet: HashSet = HashSet()
        for (rlvRestrictionType in RLVRestrictionType.values()) {
            if (str == "") {
                hashSet.add(rlvRestrictionType)
            } else if (rlvRestrictionType.toString().contains(str)) {
                hashSet.add(rlvRestrictionType)
            }
        }
        rlvController.getRestrictions().removeRestrictions(uuid, hashSet)
    }
}
