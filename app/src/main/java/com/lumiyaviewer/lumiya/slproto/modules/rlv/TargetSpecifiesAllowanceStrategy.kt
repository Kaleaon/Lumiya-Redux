package com.lumiyaviewer.lumiya.slproto.modules.rlv

import java.util.UUID

/**
 * Strategy for [RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance].
 *
 * For allowance rules (e.g. notify, recvchat), an action is allowed if either
 * the base behaviour is restricted (wildcard "") or the specific target is in restMap.
 */
class TargetSpecifiesAllowanceStrategy : IRLVRuleStrategy {
    override fun isAllowed(
        restMap: Map<String, HashSet<UUID>>,
        target: String,
        sourceObject: UUID?,
        targetObject: UUID?
    ): Boolean {
        return restMap.containsKey("") || (target.isNotEmpty() && restMap.containsKey(target))
    }
}
