package com.lumiyaviewer.lumiya.slproto.modules.rlv

import java.util.UUID

/**
 * Strategy for [RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesException].
 *
 * For exception rules (e.g. sendim, tploc), the action is allowed if base restriction ""
 * is NOT present. If "" is present, the action is allowed only if target is specified and
 * target is explicitly listed in restMap as an exception.
 */
class TargetSpecifiesExceptionStrategy : IRLVRuleStrategy {
    override fun isAllowed(
        restMap: Map<String, HashSet<UUID>>,
        target: String,
        sourceObject: UUID?,
        targetObject: UUID?
    ): Boolean {
        val baseSources = restMap[""]
        return baseSources == null || (target.isNotEmpty() && restMap.containsKey(target))
    }
}
