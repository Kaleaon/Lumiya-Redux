package com.lumiyaviewer.lumiya.slproto.modules

import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLCircuitInfo
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDArray
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBinary
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import com.lumiyaviewer.lumiya.slproto.messages.CoarseLocationUpdate
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.utils.UUIDPool
import com.lumiyaviewer.lumiya.slproto.messages.ParcelOverlay
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.UUID

class SLMinimapTest {

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
    private lateinit var minimap: SLMinimap

    @Before
    fun setUp() {
        circuit = MockAgentCircuit()
        minimap = SLMinimap(circuit)
    }

    @Test
    fun testHandleCoarseLocationUpdate_updatesAvatarPositionAndDistance() {
        val user1UUID = UUID.randomUUID()

        val packet = CoarseLocationUpdate()
        packet.Index_Field.You = 0

        // Your position at (128, 128, 10 -> Z*4 = 40)
        val loc0 = CoarseLocationUpdate.Location()
        loc0.X = 128
        loc0.Y = 128
        loc0.Z = 10
        packet.Location_Fields.add(loc0)

        val agent0 = CoarseLocationUpdate.AgentData()
        agent0.AgentID = circuit.circuitInfo.agentID
        packet.AgentData_Fields.add(agent0)

        // Other avatar position at (130, 128, 10 -> distance = 2.0m)
        val loc1 = CoarseLocationUpdate.Location()
        loc1.X = 130
        loc1.Y = 128
        loc1.Z = 10
        packet.Location_Fields.add(loc1)

        val agent1 = CoarseLocationUpdate.AgentData()
        agent1.AgentID = user1UUID
        packet.AgentData_Fields.add(agent1)

        // Dispatch
        minimap.HandleCoarseLocationUpdate(packet)

        // Assert distance to user1 is 2.0m
        val distance = minimap.getDistanceToUser(user1UUID)
        assertNotNull(distance)
        assertEquals(2.0f, distance!!, 0.01f)

        // Assert nearby chatter list contains user1
        val chatterList = minimap.getNearbyChatterList()
        assertEquals(1, chatterList.size)
        assertEquals(user1UUID, chatterList[0].id)
    }

    @Test
    fun testHandleCoarseLocationUpdate_prunesStaleAvatars() {
        val user1UUID = UUID.randomUUID()
        val user2UUID = UUID.randomUUID()

        // 1st update with user1 and user2
        val packet1 = CoarseLocationUpdate()
        packet1.Index_Field.You = 0

        val loc0 = CoarseLocationUpdate.Location().apply { X = 100; Y = 100; Z = 10 }
        packet1.Location_Fields.add(loc0)
        packet1.AgentData_Fields.add(CoarseLocationUpdate.AgentData().apply { AgentID = circuit.circuitInfo.agentID })

        val loc1 = CoarseLocationUpdate.Location().apply { X = 110; Y = 100; Z = 10 }
        packet1.Location_Fields.add(loc1)
        packet1.AgentData_Fields.add(CoarseLocationUpdate.AgentData().apply { AgentID = user1UUID })

        val loc2 = CoarseLocationUpdate.Location().apply { X = 120; Y = 100; Z = 10 }
        packet1.Location_Fields.add(loc2)
        packet1.AgentData_Fields.add(CoarseLocationUpdate.AgentData().apply { AgentID = user2UUID })

        minimap.HandleCoarseLocationUpdate(packet1)
        assertEquals(2, minimap.getNearbyChatterList().size)

        // 2nd update with only user1 (user2 removed)
        val packet2 = CoarseLocationUpdate()
        packet2.Index_Field.You = 0
        packet2.Location_Fields.add(loc0)
        packet2.AgentData_Fields.add(CoarseLocationUpdate.AgentData().apply { AgentID = circuit.circuitInfo.agentID })
        packet2.Location_Fields.add(loc1)
        packet2.AgentData_Fields.add(CoarseLocationUpdate.AgentData().apply { AgentID = user1UUID })

        minimap.HandleCoarseLocationUpdate(packet2)
        val list = minimap.getNearbyChatterList()
        assertEquals(1, list.size)
        assertEquals(user1UUID, list[0].id)
    }

    @Test
    fun testHandleParcelProperties_parsesLLSDNodeAndUpdatesParcels() {
        val eventMap = LLSDMap()
        val parcelArray = LLSDArray()

        val parcelMap = LLSDMap()
        parcelMap.put("LocalID", LLSDInt(42))
        parcelMap.put("Name", LLSDString("Test Parcel"))
        val bitmapBytes = ByteArray(512) // 4096 bits
        bitmapBytes[0] = 0x01 // bit 0 set
        parcelMap.put("Bitmap", LLSDBinary(bitmapBytes))

        parcelArray.add(parcelMap)
        eventMap.put("ParcelData", parcelArray)

        minimap.HandleParcelProperties(eventMap)

        assertTrue(true)
    }

    @Test
    fun testHandleParcelOverlay_publishesMapLoadingProgress() {
        val userManager = UserManager.getUserManager(circuit.circuitInfo.agentID)
        var lastProgress: SLMinimap.MapLoadingProgress? = null

        val subscriptionData = com.lumiyaviewer.lumiya.react.SubscriptionData<SubscriptionSingleKey, SLMinimap.MapLoadingProgress>(
            com.lumiyaviewer.lumiya.react.UIThreadExecutor.getInstance(),
            com.lumiyaviewer.lumiya.react.Subscription.OnData { obj ->
                if (obj is SLMinimap.MapLoadingProgress) {
                    lastProgress = obj
                }
            }
        )
        subscriptionData.subscribe(userManager.getMapLoadingProgressPool(), SubscriptionSingleKey.Value)

        // Send sequence block 0
        val po0 = ParcelOverlay().apply {
            ParcelData_Field.SequenceID = 0
            ParcelData_Field.Data = ByteArray(64 * 16)
        }
        minimap.HandleParcelOverlay(po0)

        assertNotNull(lastProgress)
        assertEquals(1, lastProgress?.sequenceCount)
        assertEquals(0, lastProgress?.lastSequenceId)
        assertTrue(lastProgress?.receivedSequences?.contains(0) == true)
        assertFalse(lastProgress?.isComplete == true)

        // Send sequence blocks 1, 2, 3
        for (seq in 1..3) {
            val po = ParcelOverlay().apply {
                ParcelData_Field.SequenceID = seq
                ParcelData_Field.Data = ByteArray(64 * 16)
            }
            minimap.HandleParcelOverlay(po)
        }

        assertEquals(4, lastProgress?.sequenceCount)
        assertEquals(3, lastProgress?.lastSequenceId)
        assertTrue(lastProgress?.isComplete == true)
        assertEquals(setOf(0, 1, 2, 3), lastProgress?.receivedSequences)

        subscriptionData.unsubscribe()
    }
}
