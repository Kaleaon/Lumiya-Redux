package com.lumiyaviewer.lumiya.slproto.modules.rlv

import java.util.UUID

/**
 * Strategy for [RLVRestrictionType.RLVRuleMatchType.TargetNoExceptions].
 *
 * For secure behaviours (e.g. "sendim"), restrictions apply with no target exceptions.
 * If restMap is empty, the action is allowed.
 * If restMap is non-empty, the action is allowed only if sourceObject is specified and
 * every restriction in restMap was imposed solely by sourceObject.
 */
class TargetNoExceptionsStrategy : IRLVRuleStrategy {
    override fun isAllowed(
        restMap: Map<String, HashSet<UUID>>,
        target: String,
        sourceObject: UUID?,
        targetObject: UUID?
    ): Boolean {
        if (restMap.isEmpty()) {
            return true
        }
        if (sourceObject == null) {
            return false
        }
        for (sources in restMap.values) {
            if (sources.size != 1 || !sources.contains(sourceObject)) {
                return false
            }
        }
        return true
    }
}
