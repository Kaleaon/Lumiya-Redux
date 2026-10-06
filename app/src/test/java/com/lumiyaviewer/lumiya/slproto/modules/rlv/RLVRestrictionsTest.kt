package com.lumiyaviewer.lumiya.slproto.modules.rlv

import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.UUID

class RLVRestrictionsTest {

    private lateinit var restrictions: RLVRestrictions
    private val objectA = UUID.randomUUID()
    private val objectB = UUID.randomUUID()
    private val targetUUID = UUID.randomUUID().toString()

    @Before
    fun setUp() {
        restrictions = RLVRestrictions()
    }

    @Test
    fun testTargetSpecifiesAllowance() {
        // RLVRestrictionType.notify or similar allowance-based rules
        // Initially empty -> disallowed
        assertFalse(restrictions.isAllowed(RLVRestrictionType.accepttp, targetUUID, null))

        // Add allowance for specific target
        restrictions.addRestriction(RLVRestrictionType.accepttp, objectA, targetUUID)
        assertTrue(restrictions.isAllowed(RLVRestrictionType.accepttp, targetUUID, null))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.accepttp, "other_target", null))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.accepttp, "", null))

        // Add blanket allowance ""
        restrictions.addRestriction(RLVRestrictionType.accepttp, objectB, "")
        assertTrue(restrictions.isAllowed(RLVRestrictionType.accepttp, targetUUID, null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.accepttp, "other_target", null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.accepttp, "", null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.accepttp, null, null))
    }

    @Test
    fun testTargetNoExceptions() {
        // Secure variant (e.g., sendim, recvim in secure mode)
        // Empty restrictions -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sendim, targetUUID, null, objectA))

        // Restricted by Object A
        restrictions.addRestriction(RLVRestrictionType.sendim, objectA, "")
        // Asking object is Object A -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sendim, targetUUID, null, objectA))
        // Asking object is Object B or null -> restricted
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendim, targetUUID, null, objectB))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendim, targetUUID, null, null))

        // Restricted by both Object A and Object B -> no single object owns all restrictions
        restrictions.addRestriction(RLVRestrictionType.sendim, objectB, "")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendim, targetUUID, null, objectA))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendim, targetUUID, null, objectB))
    }

    @Test
    fun testTargetSpecifiesException() {
        // e.g. recvchat, sendchat
        // Empty restrictions -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.recvchat, targetUUID, null))

        // Add blanket restriction ""
        restrictions.addRestriction(RLVRestrictionType.recvchat, objectA, "")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.recvchat, "", null))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.recvchat, targetUUID, null))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.recvchat, null, null))

        // Add exception for targetUUID
        restrictions.addRestriction(RLVRestrictionType.recvchat, objectA, targetUUID)
        assertTrue(restrictions.isAllowed(RLVRestrictionType.recvchat, targetUUID, null))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.recvchat, "other_target", null))
    }

    @Test
    fun testTargetSpecifiesRestriction() {
        // e.g. tploc, detach, sit
        // Empty restrictions -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.tploc, "", objectA))

        // Restrict specific target
        restrictions.addRestriction(RLVRestrictionType.tploc, objectA, "specific_loc")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.tploc, "specific_loc", objectA))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.tploc, "other_loc", objectA))

        // Add blanket restriction "" by Object A
        restrictions.addRestriction(RLVRestrictionType.tploc, objectA, "")
        // Object A is the setter -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.tploc, "other_loc", objectA))
        // Object B or null -> restricted
        assertFalse(restrictions.isAllowed(RLVRestrictionType.tploc, "other_loc", objectB))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.tploc, "other_loc", null))
    }

    @Test
    fun testDefensiveNullAndEmptyHandling() {
        // Null option string
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, null, null))

        // Null object UUID
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, "", null))

        // Adding restriction with null string (should default to "")
        restrictions.addRestriction(RLVRestrictionType.sit, objectA, null)
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sit, "", null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, "", objectA))

        // Removing restriction with null string
        restrictions.removeRestriction(RLVRestrictionType.sit, objectA, null)
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, "", null))
    }

    @Test
    fun testRemoveRestrictionsByObject() {
        restrictions.addRestriction(RLVRestrictionType.sit, objectA, "")
        restrictions.addRestriction(RLVRestrictionType.tploc, objectA, "loc")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sit, "", null))

        val set = mutableSetOf(RLVRestrictionType.sit, RLVRestrictionType.tploc)
        restrictions.removeRestrictions(objectA, set)

        assertTrue(restrictions.isAllowed(RLVRestrictionType.sit, "", null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.tploc, "loc", null))
    }
}
