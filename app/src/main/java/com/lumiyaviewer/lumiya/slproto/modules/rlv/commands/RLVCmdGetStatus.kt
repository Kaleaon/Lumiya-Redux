package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import java.util.UUID

open class RLVCmdGetStatus : RLVCommand {
    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        val substring3: String
        val part2: String
        try {
            val parseInt = option.toInt()
            val str5 = parameter ?: ""
            val indexOf = str5.indexOf(';')
            if (indexOf >= 0) {
                val substring = str5.substring(indexOf + 1)
                val part = str5.substring(0, indexOf)
                substring3 = substring
                part2 = part
            } else {
                substring3 = "/"
                part2 = str5
            }
            val lowerCase = part2.lowercase()
            var str6 = ""
            for (rlvRestrictionType in controller.getRestrictions().getRestrictionsByObject(objectId)) {
                str6 = if (lowerCase == "" || rlvRestrictionType.toString().indexOf(lowerCase) >= 0) str6 + substring3 + rlvRestrictionType.toString() else str6
            }
            controller.sayOnChannel(parseInt, str6)
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
