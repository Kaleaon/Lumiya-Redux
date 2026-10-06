package com.lumiyaviewer.lumiya.slproto.modules.rlv

import java.util.UUID

/**
 * Evaluates RLV restriction rules by delegating to dedicated strategy implementations
 * for each [RLVRestrictionType.RLVRuleMatchType].
 *
 * Guarantees null safety and prevents runtime exceptions across all caller sites.
 */
object RLVRestrictionEvaluator {

    private val strategies: Map<RLVRestrictionType.RLVRuleMatchType, IRLVRuleStrategy> = mapOf(
        RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance to TargetSpecifiesAllowanceStrategy(),
        RLVRestrictionType.RLVRuleMatchType.TargetNoExceptions to TargetNoExceptionsStrategy(),
        RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesException to TargetSpecifiesExceptionStrategy(),
        RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesRestriction to TargetSpecifiesRestrictionStrategy()
    )

    /**
     * Evaluates whether an action is allowed for a given match type and restriction map.
     *
     * @param matchType rule match type, or null
     * @param restMap active restriction map, or null
     * @param target target option string, or null
     * @param sourceObject source object UUID, or null
     * @param targetObject target object UUID, or null
     * @return true if allowed, false if restricted
     */
    fun evaluate(
        matchType: RLVRestrictionType.RLVRuleMatchType?,
        restMap: Map<String, HashSet<UUID>>?,
        target: String?,
        sourceObject: UUID?,
        targetObject: UUID?
    ): Boolean {
        if (matchType == null) {
            return true
        }
        val strategy = strategies[matchType] ?: return true
        val safeMap = restMap ?: emptyMap()
        val safeTarget = target ?: ""
        return strategy.isAllowed(safeMap, safeTarget, sourceObject, targetObject)
    }

    /**
     * Retrieves the strategy instance for a given match type, or null if unknown.
     */
    fun getStrategy(matchType: RLVRestrictionType.RLVRuleMatchType?): IRLVRuleStrategy? {
        if (matchType == null) return null
        return strategies[matchType]
    }
}
