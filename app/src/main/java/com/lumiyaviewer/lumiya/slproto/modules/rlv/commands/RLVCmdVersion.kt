package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import java.util.UUID

open class RLVCmdVersion : RLVCommand {

    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        try {
            val parseInt = option.toInt()
            when (commands) {
                RLVCommands.version, RLVCommands.versionnew -> {
                    val objArr = arrayOfNulls<Any>(7)
                    objArr[0] = if (commands == RLVCommands.versionnew) "RestrainedLove" else "RestrainedLife"
                    objArr[1] = RLV_VERSION_MAJOR
                    objArr[2] = RLV_VERSION_MINOR
                    objArr[3] = RLV_VERSION_PATCH
                    objArr[4] = RLVa_VERSION_MAJOR
                    objArr[5] = RLVa_VERSION_MINOR
                    objArr[6] = RLVa_VERSION_PATCH
                    controller.sayOnChannel(parseInt, String.format("%s viewer v%d.%d.%d (RLVa %d.%d.%d)", *objArr))
                }
                RLVCommands.versionnum -> {
                    controller.sayOnChannel(parseInt, String.format("%d%02d%02d%02d", RLV_VERSION_MAJOR, RLV_VERSION_MINOR, RLV_VERSION_PATCH, RLV_VERSION_BUILD))
                }
                else -> {}
            }
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }

    companion object {
        private const val RLV_VERSION_BUILD: Int = 0
        private const val RLV_VERSION_MAJOR: Int = 1
        private const val RLV_VERSION_MINOR: Int = 10
        private const val RLV_VERSION_PATCH: Int = 1
        private const val RLVa_VERSION_MAJOR: Int = 1
        private const val RLVa_VERSION_MINOR: Int = 10
        private const val RLVa_VERSION_PATCH: Int = 1

        @JvmStatic
        fun getManualVersionReply(): String {
            return String.format("RestrainedLove viewer v%d.%d.%d", 1, 10, 1)
        }
    }
}
