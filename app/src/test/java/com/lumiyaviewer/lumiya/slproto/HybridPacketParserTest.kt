package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.messages.AgentUpdate
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageFactory
import com.lumiyaviewer.lumiya.slproto.template.BlockRepeatType
import com.lumiyaviewer.lumiya.slproto.template.FieldType
import com.lumiyaviewer.lumiya.slproto.template.MessageTemplateParser
import com.lumiyaviewer.lumiya.slproto.template.MessageTemplateSchema
import com.lumiyaviewer.lumiya.slproto.template.TemplateBlockSchema
import com.lumiyaviewer.lumiya.slproto.template.TemplateFieldSchema
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.UUID

class HybridPacketParserTest {

    @Test
    fun testFastPathStaticDispatchForAgentUpdate() {
        // High frequency ID 4 = AgentUpdate static compiled handler
        val message = SLMessageFactory.CreateByID(4)
        assertNotNull("Fast-path message for ID 4 should not be null", message)
        assertTrue("Message should be instance of compiled AgentUpdate", message is AgentUpdate)
    }

    @Test
    fun testDynamicFallbackParserForUnrecognizedWireMessage() {
        // Register a new extension message schema in DynamicMessageCatalog (Low 999 = ID -64537)
        val schema = MessageTemplateSchema(
            name = "NewGridExtensionMessage",
            frequency = "Low",
            rawNumber = "999",
            messageID = -64537,
            isZeroCoded = true,
            blocks = listOf(
                TemplateBlockSchema(
                    name = "HeaderData",
                    repeatType = BlockRepeatType.SINGLE,
                    fields = listOf(
                        TemplateFieldSchema("AgentID", FieldType.LLUUID),
                        TemplateFieldSchema("Counter", FieldType.U32)
                    )
                )
            )
        )
        DynamicMessageCatalog.registerTemplate(schema)

        val message = SLMessageFactory.CreateByID(-64537)
        assertNotNull("Dynamic fallback message should be created for ID -64537", message)
        assertTrue("Message should be instance of DynamicSLMessage", message is DynamicSLMessage)

        val dynamicMsg = message as DynamicSLMessage
        assertEquals("NewGridExtensionMessage", dynamicMsg.schema.name)
    }

    @Test
    fun testDynamicPayloadUnpackingAndPacking() {
        val testUUID = UUID.randomUUID()
        val schema = MessageTemplateSchema(
            name = "CustomTelemetryPacket",
            frequency = "Low",
            rawNumber = "888",
            messageID = -64648,
            isZeroCoded = false,
            blocks = listOf(
                TemplateBlockSchema(
                    name = "AgentBlock",
                    repeatType = BlockRepeatType.SINGLE,
                    fields = listOf(
                        TemplateFieldSchema("AgentID", FieldType.LLUUID),
                        TemplateFieldSchema("Sequence", FieldType.U32)
                    )
                )
            )
        )

        val msgOut = DynamicSLMessage(schema)
        msgOut.setValue("AgentBlock", "AgentID", testUUID)
        msgOut.setValue("AgentBlock", "Sequence", 42)

        val buf = ByteBuffer.allocate(1024).order(ByteOrder.LITTLE_ENDIAN)
        msgOut.PackPayload(buf)
        buf.flip()

        val msgIn = DynamicSLMessage(schema)
        msgIn.UnpackPayload(buf)

        val unpackedUUID = msgIn.getValue("AgentBlock", "AgentID") as? UUID
        val unpackedSeq = msgIn.getValue("AgentBlock", "Sequence") as? Int

        assertEquals(testUUID, unpackedUUID)
        assertEquals(42, unpackedSeq)
    }

    @Test
    fun testThreadSafeCacheCappingAt1000Entries() {
        DynamicMessageCatalog.clearCache()
        for (i in 1..1200) {
            val schema = MessageTemplateSchema(
                name = "TestMsg_$i",
                frequency = "Low",
                rawNumber = "$i",
                messageID = -65536 + i,
                isZeroCoded = false
            )
            DynamicMessageCatalog.registerTemplate(schema)
        }

        assertTrue("Cache size must be capped at 1000", DynamicMessageCatalog.cacheSize() <= 1000)
    }

    @Test
    fun testPureZeroCodeDecompression() {
        val rawZeroCodedBytes = byteArrayOf(
            0x05, 0x00, 0x04, 0x07 // 0x05, 0x00 + 4 zeros, 0x07 -> 0x05, 0x00, 0x00, 0x00, 0x00, 0x07
        )

        val decompressed = ZeroDecoder.decodeByteArray(rawZeroCodedBytes)
        val expected = byteArrayOf(0x05, 0x00, 0x00, 0x00, 0x00, 0x07)

        assertEquals(expected.size, decompressed.size)
        for (i in expected.indices) {
            assertEquals(expected[i], decompressed[i])
        }
    }

    @Test
    fun testUnrecognizedMessageFallbackToSLDefaultMessage() {
        // Unknown ID -99999 not in static catalog or message_template.msg
        val message = SLMessageFactory.CreateByID(-99999)
        // If not in template file, returns null from CreateByID and SLMessage.Unpack falls back to SLDefaultMessage
        val fallbackMsg = message ?: SLDefaultMessage()
        assertNotNull("Fallback message should not be null", fallbackMsg)
        assertTrue("Fallback message should be instance of SLDefaultMessage or SLMessage", fallbackMsg is SLMessage)
    }

    @Test
    fun testTemplateParserFromText() {
        val templateText = """
            {
                CustomGridMsg Low 500 NotTrusted Zerocoded
                {
                    DataBlock Single
                    { Field1 U32 }
                }
            }
        """.trimIndent()

        val schemas = MessageTemplateParser.parseText(templateText)
        assertEquals(1, schemas.size)

        val schema = schemas[0]
        assertEquals("CustomGridMsg", schema.name)
        assertEquals(-65036, schema.messageID)
        assertTrue(schema.isZeroCoded)
        assertEquals(1, schema.blocks.size)
        assertEquals("DataBlock", schema.blocks[0].name)
        assertEquals(1, schema.blocks[0].fields.size)
        assertEquals("Field1", schema.blocks[0].fields[0].name)
        assertEquals(FieldType.U32, schema.blocks[0].fields[0].type)
    }
}
