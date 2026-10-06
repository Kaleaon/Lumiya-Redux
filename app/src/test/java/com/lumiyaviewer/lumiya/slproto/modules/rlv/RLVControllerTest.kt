package com.lumiyaviewer.lumiya.slproto.modules.rlv

import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLCircuitInfo
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.UUID

class RLVControllerTest {

    private class MockAgentCircuit : SLAgentCircuit {
        constructor() : super(
            SLGridConnection(),
            SLCircuitInfo(),
            SLAuthReply(),
            null
        ) {
            circuitInfo.agentID = UUID.randomUUID()
        }

        override fun execute(runnable: Runnable) {
            runnable.run()
        }
    }

    private lateinit var circuit: MockAgentCircuit
    private lateinit var controller: RLVController
    private val testUUID = UUID.randomUUID()
    private val objectUUID = UUID.randomUUID()

    @Before
    fun setUp() {
        GlobalOptions.getInstance().setRLVEnabled(true)
        circuit = MockAgentCircuit()
        controller = RLVController(circuit)
    }

    @Test
    fun testAllEighteenCallersWithDefaultAllowedState() {
        // Test all 18 callers when no restrictions are set; none should throw UnsupportedOperationException
        assertFalse(controller.autoAcceptTeleport(testUUID))
        assertTrue(controller.canDetachItem(0, objectUUID))
        assertTrue(controller.canRecvChat("hello", testUUID))
        assertTrue(controller.canRecvIM(testUUID))
        assertTrue(controller.canSendIM(testUUID))
        assertTrue(controller.canShowInventory())
        assertTrue(controller.canSit())
        assertTrue(controller.canStandUp())
        assertTrue(controller.canTakeItemOff(SLWearableType.WT_SHIRT))
        assertTrue(controller.canTeleportBySitting())
        assertTrue(controller.canTeleportToLandmark())
        assertTrue(controller.canTeleportToLocation())
        assertTrue(controller.canTeleportToLure(testUUID))
        assertTrue(controller.canViewNotecard())
        assertTrue(controller.canWearItem(SLWearableType.WT_SHIRT))
        assertTrue(controller.onSendLocalChat(0, "test chat"))
        assertTrue(controller.onSendLocalChat(1, "test chat channel 1"))
        controller.teleportToGlobalPos(objectUUID, LLVector3(100.0f, 100.0f, 20.0f))
    }

    @Test
    fun testAllEighteenCallersWithActiveRestrictions() {
        val restr = controller.getRestrictions()
        assertNotNull(restr)

        // Apply blanket restrictions
        restr.addRestriction(RLVRestrictionType.detach, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.recvchat, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.recvim, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.sendim, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.showinv, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.sit, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.unsit, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.remoutfit, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.sittp, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.tplm, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.tploc, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.tplure, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.viewnote, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.addoutfit, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.sendchat, objectUUID, "")
        restr.addRestriction(RLVRestrictionType.sendchannel, objectUUID, "")

        // Verify restricted behavior without exceptions
        assertFalse(controller.canDetachItem(0, testUUID))
        assertFalse(controller.canRecvChat("hello", testUUID))
        assertFalse(controller.canRecvIM(testUUID))
        assertFalse(controller.canSendIM(testUUID))
        assertFalse(controller.canShowInventory())
        assertFalse(controller.canSit())
        assertFalse(controller.canStandUp())
        assertFalse(controller.canTakeItemOff(SLWearableType.WT_SHIRT))
        assertFalse(controller.canTeleportBySitting())
        assertFalse(controller.canTeleportToLandmark())
        assertFalse(controller.canTeleportToLocation())
        assertFalse(controller.canTeleportToLure(testUUID))
        assertFalse(controller.canViewNotecard())
        assertFalse(controller.canWearItem(SLWearableType.WT_SHIRT))
        assertFalse(controller.onSendLocalChat(0, "test chat"))
        assertFalse(controller.onSendLocalChat(1, "test chat channel 1"))
    }
}
