package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * LandStatReply
 * Sent by the simulator in response to LandStatRequest
 *
 * <p>Template: {@code LandStatReply Low 422 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLFloaterTopObjects::handle_land_reply()} in indra/newview/llfloatertopobjects.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class LandStatReply extends SLMessage {
    public ArrayList<ReportData> ReportData_Fields = new ArrayList<>();
    public RequestData RequestData_Field;

    /** Block ReportData, Variable. */
    public static class ReportData {
        public float LocationX; // F32
        public float LocationY; // F32
        public float LocationZ; // F32
        public byte[] OwnerName; // Variable 1
        public float Score; // F32
        public UUID TaskID; // LLUUID
        public int TaskLocalID; // U32
        public byte[] TaskName; // Variable 1
    }

    /** Block RequestData, Single. */
    public static class RequestData {
        public int ReportType; // U32
        public int RequestFlags; // U32
        public int TotalObjectCount; // U32
    }

    public LandStatReply() {
        this.zeroCoded = false;
        this.RequestData_Field = new RequestData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 17;
        Iterator<?> it = this.ReportData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            ReportData reportData = (ReportData) it.next();
            i = reportData.OwnerName.length + reportData.TaskName.length + 37 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleLandStatReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 422 (LandStatReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA6);
        packInt(byteBuffer, this.RequestData_Field.ReportType);
        packInt(byteBuffer, this.RequestData_Field.RequestFlags);
        packInt(byteBuffer, this.RequestData_Field.TotalObjectCount);
        byteBuffer.put((byte) this.ReportData_Fields.size());
        for (ReportData reportData : this.ReportData_Fields) {
            packInt(byteBuffer, reportData.TaskLocalID);
            packUUID(byteBuffer, reportData.TaskID);
            packFloat(byteBuffer, reportData.LocationX);
            packFloat(byteBuffer, reportData.LocationY);
            packFloat(byteBuffer, reportData.LocationZ);
            packFloat(byteBuffer, reportData.Score);
            packVariable(byteBuffer, reportData.TaskName, 1);
            packVariable(byteBuffer, reportData.OwnerName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RequestData_Field.ReportType = unpackInt(byteBuffer);
        this.RequestData_Field.RequestFlags = unpackInt(byteBuffer);
        this.RequestData_Field.TotalObjectCount = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ReportData reportData = new ReportData();
            reportData.TaskLocalID = unpackInt(byteBuffer);
            reportData.TaskID = unpackUUID(byteBuffer);
            reportData.LocationX = unpackFloat(byteBuffer);
            reportData.LocationY = unpackFloat(byteBuffer);
            reportData.LocationZ = unpackFloat(byteBuffer);
            reportData.Score = unpackFloat(byteBuffer);
            reportData.TaskName = unpackVariable(byteBuffer, 1);
            reportData.OwnerName = unpackVariable(byteBuffer, 1);
            this.ReportData_Fields.add(reportData);
        }
    }
}
