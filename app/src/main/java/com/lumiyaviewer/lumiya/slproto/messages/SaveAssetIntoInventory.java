package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Sim outgoing only (to dataserver, to viewer)
 * NOT viewer to sim, sim should not have handler, ever
 * This message is currently only uses objects, so the viewer ignores
 * the asset id.
 *
 * <p>Template: {@code SaveAssetIntoInventory Low 272 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processSaveAssetIntoInventory()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class SaveAssetIntoInventory extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryData InventoryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block InventoryData, Single. */
    public static class InventoryData {
        public UUID ItemID; // LLUUID
        public UUID NewAssetID; // LLUUID
    }

    public SaveAssetIntoInventory() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSaveAssetIntoInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 272 (SaveAssetIntoInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x10);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.InventoryData_Field.ItemID);
        packUUID(byteBuffer, this.InventoryData_Field.NewAssetID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.InventoryData_Field.ItemID = unpackUUID(byteBuffer);
        this.InventoryData_Field.NewAssetID = unpackUUID(byteBuffer);
    }
}
