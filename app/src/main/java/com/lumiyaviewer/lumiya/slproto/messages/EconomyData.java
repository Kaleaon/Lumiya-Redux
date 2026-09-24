package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * dataserver to sim, response w/ econ data
 *
 * <p>Template: {@code EconomyData Low 25 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_economy_data()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class EconomyData extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public float EnergyEfficiency; // F32
        public int ObjectCapacity; // S32
        public int ObjectCount; // S32
        public int PriceEnergyUnit; // S32
        public int PriceGroupCreate; // S32
        public int PriceObjectClaim; // S32
        public float PriceObjectRent; // F32
        public float PriceObjectScaleFactor; // F32
        public int PriceParcelClaim; // S32
        public float PriceParcelClaimFactor; // F32
        public int PriceParcelRent; // S32
        public int PricePublicObjectDecay; // S32
        public int PricePublicObjectDelete; // S32
        public int PriceRentLight; // S32
        public int PriceUpload; // S32
        public int TeleportMinPrice; // S32
        public float TeleportPriceExponent; // F32
    }

    public EconomyData() {
        this.zeroCoded = true;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 72;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEconomyData(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 25 (EconomyData).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x19);
        packInt(byteBuffer, this.Info_Field.ObjectCapacity);
        packInt(byteBuffer, this.Info_Field.ObjectCount);
        packInt(byteBuffer, this.Info_Field.PriceEnergyUnit);
        packInt(byteBuffer, this.Info_Field.PriceObjectClaim);
        packInt(byteBuffer, this.Info_Field.PricePublicObjectDecay);
        packInt(byteBuffer, this.Info_Field.PricePublicObjectDelete);
        packInt(byteBuffer, this.Info_Field.PriceParcelClaim);
        packFloat(byteBuffer, this.Info_Field.PriceParcelClaimFactor);
        packInt(byteBuffer, this.Info_Field.PriceUpload);
        packInt(byteBuffer, this.Info_Field.PriceRentLight);
        packInt(byteBuffer, this.Info_Field.TeleportMinPrice);
        packFloat(byteBuffer, this.Info_Field.TeleportPriceExponent);
        packFloat(byteBuffer, this.Info_Field.EnergyEfficiency);
        packFloat(byteBuffer, this.Info_Field.PriceObjectRent);
        packFloat(byteBuffer, this.Info_Field.PriceObjectScaleFactor);
        packInt(byteBuffer, this.Info_Field.PriceParcelRent);
        packInt(byteBuffer, this.Info_Field.PriceGroupCreate);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.ObjectCapacity = unpackInt(byteBuffer);
        this.Info_Field.ObjectCount = unpackInt(byteBuffer);
        this.Info_Field.PriceEnergyUnit = unpackInt(byteBuffer);
        this.Info_Field.PriceObjectClaim = unpackInt(byteBuffer);
        this.Info_Field.PricePublicObjectDecay = unpackInt(byteBuffer);
        this.Info_Field.PricePublicObjectDelete = unpackInt(byteBuffer);
        this.Info_Field.PriceParcelClaim = unpackInt(byteBuffer);
        this.Info_Field.PriceParcelClaimFactor = unpackFloat(byteBuffer);
        this.Info_Field.PriceUpload = unpackInt(byteBuffer);
        this.Info_Field.PriceRentLight = unpackInt(byteBuffer);
        this.Info_Field.TeleportMinPrice = unpackInt(byteBuffer);
        this.Info_Field.TeleportPriceExponent = unpackFloat(byteBuffer);
        this.Info_Field.EnergyEfficiency = unpackFloat(byteBuffer);
        this.Info_Field.PriceObjectRent = unpackFloat(byteBuffer);
        this.Info_Field.PriceObjectScaleFactor = unpackFloat(byteBuffer);
        this.Info_Field.PriceParcelRent = unpackInt(byteBuffer);
        this.Info_Field.PriceGroupCreate = unpackInt(byteBuffer);
    }
}
