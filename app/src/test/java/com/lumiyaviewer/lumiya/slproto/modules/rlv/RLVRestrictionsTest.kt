package com.lumiyaviewer.lumiya.slproto.modules.rlv

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
        // Secure variant (e.g., sendchat, tplm in secure mode)
        // Empty restrictions -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sendchat, targetUUID, null, objectA))

        // Restricted by Object A
        restrictions.addRestriction(RLVRestrictionType.sendchat, objectA, "")
        // Asking object is Object A -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.sendchat, targetUUID, null, objectA))
        // Asking object is Object B or null -> restricted
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendchat, targetUUID, null, objectB))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendchat, targetUUID, null, null))

        // Restricted by both Object A and Object B -> no single object owns all restrictions
        restrictions.addRestriction(RLVRestrictionType.sendchat, objectB, "")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendchat, targetUUID, null, objectA))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.sendchat, targetUUID, null, objectB))
    }

    @Test
    fun testTargetSpecifiesException() {
        // e.g. recvchat, sendim
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
        // e.g. detach, remoutfit, addoutfit, redirchat
        // Empty restrictions -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, "", objectA))

        // Restrict specific target
        restrictions.addRestriction(RLVRestrictionType.detach, objectA, "specific_loc")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.detach, "specific_loc", objectA))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, "other_loc", objectA))

        // Add blanket restriction "" by Object A
        restrictions.addRestriction(RLVRestrictionType.detach, objectA, "")
        // Object A is the setter -> allowed
        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, "other_loc", objectA))
        // Object B or null -> restricted
        assertFalse(restrictions.isAllowed(RLVRestrictionType.detach, "other_loc", objectB))
        assertFalse(restrictions.isAllowed(RLVRestrictionType.detach, "other_loc", null))
    }

    @Test
    fun testDefensiveNullAndEmptyHandling() {
        // Null option string
        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, null, null))

        // Null object UUID
        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, "", null))

        // Adding restriction with null string (should default to "")
        restrictions.addRestriction(RLVRestrictionType.detach, objectA, null)
        assertFalse(restrictions.isAllowed(RLVRestrictionType.detach, "", null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, "", objectA))

        // Removing restriction with null string
        restrictions.removeRestriction(RLVRestrictionType.detach, objectA, null)
        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, "", null))
    }

    @Test
    fun testRemoveRestrictionsByObject() {
        restrictions.addRestriction(RLVRestrictionType.detach, objectA, "")
        restrictions.addRestriction(RLVRestrictionType.redirchat, objectA, "loc")
        assertFalse(restrictions.isAllowed(RLVRestrictionType.detach, "", null))

        val set = mutableSetOf(RLVRestrictionType.detach, RLVRestrictionType.redirchat)
        restrictions.removeRestrictions(objectA, set)

        assertTrue(restrictions.isAllowed(RLVRestrictionType.detach, "", null))
        assertTrue(restrictions.isAllowed(RLVRestrictionType.redirchat, "loc", null))
    }
}
