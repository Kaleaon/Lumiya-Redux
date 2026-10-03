package com.lumiyaviewer.lumiya.net

import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthParams
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.UUID

class NetworkRebindingTest {

    private lateinit var gridConnection: SLGridConnection

    @Before
    fun setUp() {
        gridConnection = SLGridConnection()
    }

    @Test
    fun testInitialNetworkStateIsNull() {
        assertNull("Initial rebound network should be null", gridConnection.getActiveNetwork())
    }

    @Test
    fun testOnNetworkReboundUpdatesActiveNetwork() {
        val mockNetwork = "MockNetwork_WiFi"
        gridConnection.onNetworkRebound(mockNetwork)
        assertEquals("Active network should update on rebound", mockNetwork, gridConnection.getActiveNetwork())
    }

    @Test
    fun testNetworkReboundTriggersReconnectWhenUserWantsConnectedAndIdle() {
        val authParams = SLAuthParams("testuser", "testpass", UUID.randomUUID(), "home", "http://127.0.0.1:8080", "Second Life")
        gridConnection.Connect(authParams)

        // Force disconnect so connection becomes idle but userWantsConnected remains true
        gridConnection.forceDisconnect(false)
        assertEquals("Connection state should be Idle after disconnect", SLGridConnection.ConnectionState.Idle, gridConnection.getConnectionState())

        val mockCellularNetwork = "MockNetwork_Cellular"
        gridConnection.onNetworkRebound(mockCellularNetwork)

        assertEquals("Active network should be updated to cellular", mockCellularNetwork, gridConnection.getActiveNetwork())
        assertTrue("Connection state should transition to Connecting or Reconnecting",
            gridConnection.getConnectionState() == SLGridConnection.ConnectionState.Connecting || gridConnection.getIsReconnecting())
    }

    @Test
    fun testOnNetworkLostLogsState() {
        gridConnection.onNetworkRebound("MockNetwork_1")
        gridConnection.onNetworkLost()
        assertNotNull(gridConnection.getActiveNetwork())
    }
}
