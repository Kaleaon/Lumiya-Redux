package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdGetStatus : RLVCommand {
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        var substring3: String = ""
        var part2: String = ""
        try {
            var parseInt: Int = Integer.parseInt(str)
            var str5: String = if (str2 != null) str2 else ""
            var indexOf: Int = str5.indexOf(59)
            if (indexOf >= 0) {
                var substring: String = str5.substring(indexOf + 1)
                var part: String = str5.substring(0, indexOf)
                substring3 = substring
                part2 = part
            } else {
                substring3 = "/"
                part2 = str5
            }
            var lowerCase: String = part2.toLowerCase()
            var str6: String = ""
            for (rlvRestrictionType in rlvController.getRestrictions().getRestrictionsByObject(uuid)) {
                str6 = (lowerCase.equals("") || rlvRestrictionType.toString().indexOf(lowerCase) >= 0) ? str6 + substring3 + rlvRestrictionType.toString() : str6
            }
            rlvController.sayOnChannel(parseInt, str6)
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
