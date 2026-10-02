package com.lumiyaviewer.lumiya.slproto

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class AdaptiveKeepAliveTest {

    private class MockCircuit : SLCircuit {
        constructor() : super(
            SLGridConnection(),
            SLCircuitInfo(),
            com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply(),
            null
        )

        var chatSynced = false

        fun SynchronizeChatHistory() {
            chatSynced = true
        }
    }

    @Test
    fun testForegroundDefaultInterval() {
        val circuit = MockCircuit()
        assertFalse(circuit.isBackgroundState)
        assertEquals(1000, circuit.getIdleInterval())
    }

    @Test
    fun testBackgroundScalingInterval() {
        val circuit = MockCircuit()
        circuit.setBackgroundState(true)
        assertTrue(circuit.isBackgroundState)
        assertEquals(10000, circuit.getIdleInterval())
    }

    @Test
    fun testForegroundResumptionRestoresFastPolling() {
        val circuit = MockCircuit()
        circuit.setBackgroundState(true)
        assertTrue(circuit.isBackgroundState)
        assertEquals(10000, circuit.getIdleInterval())

        circuit.setBackgroundState(false)
        assertFalse(circuit.isBackgroundState)
        assertEquals(1000, circuit.getIdleInterval())
    }
}
