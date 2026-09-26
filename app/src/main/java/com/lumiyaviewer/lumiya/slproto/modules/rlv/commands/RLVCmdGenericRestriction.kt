package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictions
import java.util.UUID

open class RLVCmdGenericRestriction : RLVCommand {
    private var canHaveExceptions: Boolean = false
    private var restrictionType: RLVRestrictionType = null

    constructor(rlvRestrictionType: RLVRestrictionType, canHaveExceptions: Boolean) {
        this.restrictionType = rlvRestrictionType
        this.canHaveExceptions = canHaveExceptions
    }
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        var str3: String = ""
        var str4: String = ""
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
        if (str.equals(str3) || str.equals("add")) {
            var restrictions: RLVRestrictions = rlvController.getRestrictions()
            var restrictionType: RLVRestrictionType = this.restrictionType
            if (!this.canHaveExceptions) {
                str2 = ""
            }
            restrictions.addRestriction(restrictionType, uuid, str2)
            return
        }
        if (!str.equals(str4) && !str.equals("rem")) {
            if (str.equals("force")) {
                HandleForce(rlvController, uuid, str2)
            }
        } else {
            var restrictions2: RLVRestrictions = rlvController.getRestrictions()
            var restrictionType2: RLVRestrictionType = this.restrictionType
            if (!this.canHaveExceptions) {
                str2 = ""
            }
            restrictions2.removeRestriction(restrictionType2, uuid, str2)
        }
    }

    protected fun HandleForce(rlvController: RLVController, uuid: UUID, str: String) {
        Debug.Printf("RLV: force option not supported for restriction '%s'", this.restrictionType.toString())
    }
}
