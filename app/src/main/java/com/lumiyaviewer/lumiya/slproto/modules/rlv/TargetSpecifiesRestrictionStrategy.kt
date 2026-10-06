package com.lumiyaviewer.lumiya.slproto.modules.rlv

import java.util.UUID

/**
 * Strategy for [RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesRestriction].
 *
 * For target-specific restrictions (e.g. edit, sit, touch), if target is explicitly in restMap,
 * action is restricted (false). If not explicitly in restMap, and base restriction "" is present,
 * action is allowed only if targetObject is specified and restMap[""] contains targetObject.
 * If "" is not present, action is allowed (true).
 */
class TargetSpecifiesRestrictionStrategy : IRLVRuleStrategy {
    override fun isAllowed(
        restMap: Map<String, HashSet<UUID>>,
        target: String,
        sourceObject: UUID?,
        targetObject: UUID?
    ): Boolean {
        if (target.isNotEmpty() && restMap.containsKey(target)) {
            return false
        }
        val baseSources = restMap[""]
        if (baseSources != null) {
            return targetObject != null && baseSources.contains(targetObject)
        }
        return true
    }
}
