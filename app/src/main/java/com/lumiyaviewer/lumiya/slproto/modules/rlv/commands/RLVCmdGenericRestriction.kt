package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictions
import java.util.UUID

open class RLVCmdGenericRestriction(private val restrictionType: RLVRestrictionType, private val canHaveExceptions: Boolean) : RLVCommand {

    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        var str2 = parameter
        val str3: String
        val str4: String
        if (str2 == null) {
            str2 = ""
        }
        if (this.restrictionType.getRuleMatchType() == RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance) {
            str3 = "y"
            str4 = "n"
        } else {
            str3 = "n"
            str4 = "y"
        }
        if (option == str3 || option == "add") {
            val restrictions: RLVRestrictions = controller.getRestrictions()
            val restrictionType: RLVRestrictionType = this.restrictionType
            if (!this.canHaveExceptions) {
                str2 = ""
            }
            restrictions.addRestriction(restrictionType, objectId, str2)
            return
        }
        if (!(option == str4) && option != "rem") {
            if (option == "force") {
                HandleForce(controller, objectId, str2)
            }
        } else {
            val restrictions2: RLVRestrictions = controller.getRestrictions()
            val restrictionType2: RLVRestrictionType = this.restrictionType
            if (!this.canHaveExceptions) {
                str2 = ""
            }
            restrictions2.removeRestriction(restrictionType2, objectId, str2)
        }
    }

    @Suppress("FunctionName")
    protected open fun HandleForce(rlvController: RLVController, uuid: UUID, str: String?) {
        Debug.Printf("RLV: force option not supported for restriction '%s'", this.restrictionType.toString())
    }
}
