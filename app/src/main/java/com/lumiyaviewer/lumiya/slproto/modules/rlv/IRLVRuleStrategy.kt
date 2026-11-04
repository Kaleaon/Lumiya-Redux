package com.lumiyaviewer.lumiya.slproto.modules.rlv

import java.util.UUID

/**
 * Strategy interface for evaluating an RLV restriction rule matching type.
 */
interface IRLVRuleStrategy {
    /**
     * Evaluates whether an action with a given target and source/target objects is allowed
     * based on the active restriction map for a behaviour.
     *
     * @param restMap map from option string ("" = base behaviour) to the set of object UUIDs imposing it
     * @param target the target string being checked (e.g. agent UUID string or empty)
     * @param sourceObject UUID of the object making the query (for secure behaviours), or null
     * @param targetObject UUID of the target object (for TargetSpecifiesRestriction), or null
     * @return true if allowed, false if restricted
     */
    fun isAllowed(
        restMap: Map<String, HashSet<UUID>>,
        target: String,
        sourceObject: UUID?,
        targetObject: UUID?
    ): Boolean
}
