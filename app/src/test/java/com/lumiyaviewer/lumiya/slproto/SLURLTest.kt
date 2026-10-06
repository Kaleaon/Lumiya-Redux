package com.lumiyaviewer.lumiya.slproto

import android.app.Application
import android.content.Intent
import android.net.Uri
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [34], application = Application::class)
class SLURLTest {

    @Test
    fun testParseHttpMapUrl() {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("http://maps.secondlife.com/secondlife/Ahern/128/128/20"))
        val slurl = SLURL(intent)
        assertEquals("Ahern", slurl.locationName)
        assertEquals(128, slurl.locationX)
        assertEquals(128, slurl.locationY)
        assertEquals(20, slurl.locationZ)
    }

    @Test
    fun testParseHttpsMapUrl() {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("https://maps.secondlife.com/secondlife/Ahern/128/64/30"))
        val slurl = SLURL(intent)
        assertEquals("Ahern", slurl.locationName)
        assertEquals(128, slurl.locationX)
        assertEquals(64, slurl.locationY)
        assertEquals(30, slurl.locationZ)
    }

    @Test
    fun testParseSecondLifeSchemeUrl() {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("secondlife://Lusk/200/100/40"))
        val slurl = SLURL(intent)
        assertEquals("Lusk", slurl.locationName)
        assertEquals(200, slurl.locationX)
        assertEquals(100, slurl.locationY)
        assertEquals(40, slurl.locationZ)
    }

    @Test
    fun testInvalidSchemeThrowsException() {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("ftp://maps.secondlife.com/secondlife/Ahern/128/128/20"))
        try {
            SLURL(intent)
            fail("Expected exception for unsupported scheme")
        } catch (e: Exception) {
            assertNotNull(e.message)
        }
    }

    @Test
    fun testGetLoginStartLocation() {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("https://maps.secondlife.com/secondlife/Ahern/128/128/20"))
        val slurl = SLURL(intent)
        assertEquals("uri:Ahern&amp;128&amp;128&amp;20", slurl.loginStartLocation)
    }

    @Test
    fun testGetAgentSLURLGeneratesHttpsUrl() {
        val gridConn = SLGridConnection()
        val circuitInfo = SLCircuitInfo()
        val authReply = SLAuthReply()
        authReply.loginURL = "https://login.agni.lindenlab.com/cgi-bin/login.cgi"

        val circuit = SLAgentCircuit(gridConn, circuitInfo, authReply, null, null)

        val regionNameField = SLAgentCircuit::class.java.getDeclaredField("regionName")
        regionNameField.isAccessible = true
        regionNameField.set(circuit, "Ahern")

        val modulesField = SLAgentCircuit::class.java.getDeclaredField("modules")
        modulesField.isAccessible = true
        val modules = SLModules(circuit, null, gridConn)
        modulesField.set(circuit, modules)

        val slurl = circuit.getAgentSLURL()
        assertNotNull(slurl)
        assertTrue("URL must start with https://maps.secondlife.com", slurl!!.startsWith("https://maps.secondlife.com/secondlife/Ahern/"))
    }
}
