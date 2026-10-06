package com.lumiyaviewer.lumiya.slproto.modules.rlv

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.UUID

class RLVRestrictionEvaluatorTest {

    private val sourceObj1 = UUID.fromString("00000000-0000-0000-0000-000000000001")
    private val sourceObj2 = UUID.fromString("00000000-0000-0000-0000-000000000002")
    private val targetObj1 = UUID.fromString("00000000-0000-0000-0000-000000000003")
    private val targetObj2 = UUID.fromString("00000000-0000-0000-0000-000000000004")

    private val targetString1 = targetObj1.toString().lowercase()
    private val targetString2 = targetObj2.toString().lowercase()

    @Test
    fun testStrategyRetrieval() {
        assertNotNull(RLVRestrictionEvaluator.getStrategy(RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance))
        assertNotNull(RLVRestrictionEvaluator.getStrategy(RLVRestrictionType.RLVRuleMatchType.TargetNoExceptions))
        assertNotNull(RLVRestrictionEvaluator.getStrategy(RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesException))
        assertNotNull(RLVRestrictionEvaluator.getStrategy(RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesRestriction))
        assertNull(RLVRestrictionEvaluator.getStrategy(null))
    }

    @Test
    fun testNullInputsToEvaluator() {
        assertTrue(RLVRestrictionEvaluator.evaluate(null, emptyMap(), "test", sourceObj1, targetObj1))
        assertTrue(RLVRestrictionEvaluator.evaluate(RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesRestriction, null, null, null, null))
        assertFalse(RLVRestrictionEvaluator.evaluate(RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance, null, null, null, null))
    }

    @Test
    fun testTargetSpecifiesAllowanceStrategy() {
        val strategy = TargetSpecifiesAllowanceStrategy()
        val restMap = mutableMapOf<String, HashSet<UUID>>()

        // Empty map -> disallowed
        assertFalse(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))

        // Wildcard "" present -> allowed for any target
        restMap[""] = hashSetOf(sourceObj1)
        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))
        assertTrue(strategy.isAllowed(restMap, "", sourceObj1, targetObj1))

        // Specific target present without wildcard
        restMap.clear()
        restMap[targetString1] = hashSetOf(sourceObj1)
        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))
        assertFalse(strategy.isAllowed(restMap, targetString2, sourceObj1, targetObj1))
        assertFalse(strategy.isAllowed(restMap, "", sourceObj1, targetObj1))
    }

    @Test
    fun testTargetNoExceptionsStrategy() {
        val strategy = TargetNoExceptionsStrategy()
        val restMap = mutableMapOf<String, HashSet<UUID>>()

        // Empty map -> allowed
        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))

        // Map with restriction set by sourceObj1
        restMap[""] = hashSetOf(sourceObj1)
        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))
        assertFalse(strategy.isAllowed(restMap, targetString1, sourceObj2, targetObj1))
        assertFalse(strategy.isAllowed(restMap, targetString1, null, targetObj1))

        // Restriction set by multiple objects -> disallowed even for sourceObj1
        restMap[""] = hashSetOf(sourceObj1, sourceObj2)
        assertFalse(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))

        // Multiple entries, one set solely by sourceObj1, another by sourceObj2 -> disallowed
        restMap.clear()
        restMap[""] = hashSetOf(sourceObj1)
        restMap["other"] = hashSetOf(sourceObj2)
        assertFalse(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))
    }

    @Test
    fun testTargetSpecifiesExceptionStrategy() {
        val strategy = TargetSpecifiesExceptionStrategy()
        val restMap = mutableMapOf<String, HashSet<UUID>>()

        // Empty map -> allowed
        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))

        // Map without "" -> allowed
        restMap["some_target"] = hashSetOf(sourceObj1)
        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))

        // Map with "" (base restriction) and an exception for targetString1
        restMap[""] = hashSetOf(sourceObj1)
        restMap[targetString1] = hashSetOf(sourceObj1)

        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))
        assertFalse(strategy.isAllowed(restMap, targetString2, sourceObj1, targetObj1))
        assertFalse(strategy.isAllowed(restMap, "", sourceObj1, targetObj1))
    }

    @Test
    fun testTargetSpecifiesRestrictionStrategy() {
        val strategy = TargetSpecifiesRestrictionStrategy()
        val restMap = mutableMapOf<String, HashSet<UUID>>()

        // Empty map -> allowed
        assertTrue(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))

        // Target explicitly in restMap -> disallowed
        restMap[targetString1] = hashSetOf(sourceObj1)
        assertFalse(strategy.isAllowed(restMap, targetString1, sourceObj1, targetObj1))

        // Target not in restMap, "" present in restMap
        restMap.clear()
        restMap[""] = hashSetOf(targetObj1) // targetObj1 imposed base restriction

        // targetObject is targetObj1 (the object that imposed base restriction) -> allowed
        assertTrue(strategy.isAllowed(restMap, targetString2, sourceObj1, targetObj1))

        // targetObject is targetObj2 (not the object that imposed base restriction) -> disallowed
        assertFalse(strategy.isAllowed(restMap, targetString2, sourceObj1, targetObj2))

        // null targetObject -> disallowed when base restriction exists
        assertFalse(strategy.isAllowed(restMap, targetString2, sourceObj1, null))
    }

    @Test
    fun testRLVRestrictionsIntegration() {
        val restrictions = RLVRestrictions()

        // Test default state (nothing added)
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, "", null))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.accepttp, "", null))

        // Add sit restriction
        restrictions.addRestriction(RLVRestrictionType.sit, targetObj1, "")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sit, "", null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, "", null, targetObj1))

        // Add accepttp restriction
        restrictions.addRestriction(RLVRestrictionType.accepttp, sourceObj1, "")
        assertTrue(restrictions.isAllowed(RLVRestrictionType.accepttp, "", null))

        // Remove restrictions for targetObj1
        restrictions.removeRestrictions(targetObj1, mutableSetOf(RLVRestrictionType.sit))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, "", null))
    }
}
