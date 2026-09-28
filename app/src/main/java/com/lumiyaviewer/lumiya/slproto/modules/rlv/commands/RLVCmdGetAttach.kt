package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import java.util.UUID

open class RLVCmdGetAttach : RLVCommand {
    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        try {
            val parseInt = option.toInt()
            val avatarAppearance = controller.getModules().avatarAppearance
            var str3 = ""
            for (i in 0 until NUM_ATTACHMENT_POINTS_LSL) {
                val lowerCase = if (SLAttachmentPoint.attachmentPoints[i] != null) SLAttachmentPoint.attachmentPoints[i]!!.name.lowercase() else "nonexistent"
                if (parameter == "" || lowerCase.equals(parameter, ignoreCase = true)) {
                    str3 = if (avatarAppearance.getAttachmentUUID(i) != null) str3 + "1" else str3 + "0"
                }
            }
            controller.sayOnChannel(parseInt, str3)
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }

    companion object {
        private const val NUM_ATTACHMENT_POINTS_LSL: Int = 41
    }
}
