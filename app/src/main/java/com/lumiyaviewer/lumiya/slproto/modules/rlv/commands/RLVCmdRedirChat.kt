package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdRedirChat : RLVCommand {
    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        var str2 = parameter
        if (str2 == null) {
            str2 = ""
        }
        if (str2 == "") {
            return
        }
        try {
            val parseInt = str2.toInt()
            if (option == "n" || option == "add") {
                controller.getRestrictions().addRestriction(RLVRestrictionType.redirchat, objectId, parseInt.toString())
            } else if (option == "y" || option == "rem") {
                controller.getRestrictions().removeRestriction(RLVRestrictionType.redirchat, objectId, parseInt.toString())
            }
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
