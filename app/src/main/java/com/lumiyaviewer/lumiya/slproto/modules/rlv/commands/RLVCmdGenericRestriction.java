package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictions;
import java.util.UUID;

public class RLVCmdGenericRestriction implements RLVCommand {
    private boolean canHaveExceptions;
    private RLVRestrictionType restrictionType;

    public RLVCmdGenericRestriction(RLVRestrictionType rlvRestrictionType, boolean canHaveExceptions) {
        this.restrictionType = rlvRestrictionType;
        this.canHaveExceptions = canHaveExceptions;
    }

    @Override
    public void Handle(RLVController rlvController, UUID uuid, RLVCommands rlvCommands, String str, String str2) {
        String str3;
        String str4;
        if (str2 == null) {
            str2 = "";
        }
        if (this.restrictionType.getRuleMatchType() == RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance) {
            str3 = "y";
            str4 = "n";
        } else {
            str3 = "n";
            str4 = "y";
        }
        if (str.equals(str3) || str.equals("add")) {
            RLVRestrictions restrictions = rlvController.getRestrictions();
            RLVRestrictionType restrictionType = this.restrictionType;
            if (!this.canHaveExceptions) {
                str2 = "";
            }
            restrictions.addRestriction(restrictionType, uuid, str2);
            return;
        }
        if (!str.equals(str4) && !str.equals("rem")) {
            if (str.equals("force")) {
                HandleForce(rlvController, uuid, str2);
            }
        } else {
            RLVRestrictions restrictions2 = rlvController.getRestrictions();
            RLVRestrictionType restrictionType2 = this.restrictionType;
            if (!this.canHaveExceptions) {
                str2 = "";
            }
            restrictions2.removeRestriction(restrictionType2, uuid, str2);
        }
    }

    protected void HandleForce(RLVController rlvController, UUID uuid, String str) {
        Debug.Printf("RLV: force option not supported for restriction '%s'", this.restrictionType.toString());
    }
}
