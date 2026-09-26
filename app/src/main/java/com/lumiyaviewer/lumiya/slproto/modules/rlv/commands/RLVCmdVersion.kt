package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import java.util.UUID

open class RLVCmdVersion : RLVCommand {

    @JvmStatic private var RLV_VERSION_BUILD: Int = 0
    @JvmStatic private var RLV_VERSION_MAJOR: Int = 1
    @JvmStatic private var RLV_VERSION_MINOR: Int = 10
    @JvmStatic private var RLV_VERSION_PATCH: Int = 1
    @JvmStatic private var RLVa_VERSION_MAJOR: Int = 1
    @JvmStatic private var RLVa_VERSION_MINOR: Int = 10
    @JvmStatic private var RLVa_VERSION_PATCH: Int = 1

    fun getManualVersionReply(): String {
        return String.format("RestrainedLove viewer v%d.%d.%d", 1, 10, 1)
    }
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        try {
            var parseInt: Int = Integer.parseInt(str)
            when (rlvCommands) {
                version ->
                versionnew ->
                    var objArr: Array<Any> = arrayOfNulls<Object>(7)
                    objArr[0] = rlvCommands == if (RLVCommands.versionnew) "RestrainedLove" else "RestrainedLife"
                    objArr[1] = 1
                    objArr[2] = 10
                    objArr[3] = 1
                    objArr[4] = 1
                    objArr[5] = 10
                    objArr[6] = 1
                    rlvController.sayOnChannel(parseInt, String.format("%s viewer v%d.%d.%d (RLVa %d.%d.%d)", objArr))

                versionnum ->
                    rlvController.sayOnChannel(parseInt, String.format("%d%02d%02d%02d", 1, 10, 1, 0))

            }
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
