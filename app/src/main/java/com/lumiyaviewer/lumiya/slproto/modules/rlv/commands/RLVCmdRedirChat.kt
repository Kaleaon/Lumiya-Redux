package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdRedirChat : RLVCommand {
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        if (str2 == null) {
            str2 = ""
        }
        if (str2.equals("")) {
            return
        }
        try {
            var parseInt: Int = Integer.parseInt(str2)
            if (str.equals("n") || str.equals("add")) {
                rlvController.getRestrictions().addRestriction(RLVRestrictionType.redirchat, uuid, Integer.toString(parseInt))
            } else if (str.equals("y") || str.equals("rem")) {
                rlvController.getRestrictions().removeRestriction(RLVRestrictionType.redirchat, uuid, Integer.toString(parseInt))
            }
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
