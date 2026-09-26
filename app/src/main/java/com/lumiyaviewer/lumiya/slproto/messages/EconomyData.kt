package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * dataserver to sim, response w/ econ data
 *
 * <p>Template: {@code EconomyData Low 25 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_economy_data()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class EconomyData : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var EnergyEfficiency: Float = 0f
        @JvmField var ObjectCapacity: Int = 0
        @JvmField var ObjectCount: Int = 0
        @JvmField var PriceEnergyUnit: Int = 0
        @JvmField var PriceGroupCreate: Int = 0
        @JvmField var PriceObjectClaim: Int = 0
        @JvmField var PriceObjectRent: Float = 0f
        @JvmField var PriceObjectScaleFactor: Float = 0f
        @JvmField var PriceParcelClaim: Int = 0
        @JvmField var PriceParcelClaimFactor: Float = 0f
        @JvmField var PriceParcelRent: Int = 0
        @JvmField var PricePublicObjectDecay: Int = 0
        @JvmField var PricePublicObjectDelete: Int = 0
        @JvmField var PriceRentLight: Int = 0
        @JvmField var PriceUpload: Int = 0
        @JvmField var TeleportMinPrice: Int = 0
        @JvmField var TeleportPriceExponent: Float = 0f
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 72
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEconomyData(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 25 (EconomyData).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x19).toByte())
        packInt(byteBuffer, Info_Field.ObjectCapacity)
        packInt(byteBuffer, Info_Field.ObjectCount)
        packInt(byteBuffer, Info_Field.PriceEnergyUnit)
        packInt(byteBuffer, Info_Field.PriceObjectClaim)
        packInt(byteBuffer, Info_Field.PricePublicObjectDecay)
        packInt(byteBuffer, Info_Field.PricePublicObjectDelete)
        packInt(byteBuffer, Info_Field.PriceParcelClaim)
        packFloat(byteBuffer, Info_Field.PriceParcelClaimFactor)
        packInt(byteBuffer, Info_Field.PriceUpload)
        packInt(byteBuffer, Info_Field.PriceRentLight)
        packInt(byteBuffer, Info_Field.TeleportMinPrice)
        packFloat(byteBuffer, Info_Field.TeleportPriceExponent)
        packFloat(byteBuffer, Info_Field.EnergyEfficiency)
        packFloat(byteBuffer, Info_Field.PriceObjectRent)
        packFloat(byteBuffer, Info_Field.PriceObjectScaleFactor)
        packInt(byteBuffer, Info_Field.PriceParcelRent)
        packInt(byteBuffer, Info_Field.PriceGroupCreate)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.ObjectCapacity = unpackIntInfo_Field as byteBuffer.ObjectCount = unpackIntInfo_Field as byteBuffer.PriceEnergyUnit = unpackIntInfo_Field as byteBuffer.PriceObjectClaim = unpackIntInfo_Field as byteBuffer.PricePublicObjectDecay = unpackIntInfo_Field as byteBuffer.PricePublicObjectDelete = unpackIntInfo_Field as byteBuffer.PriceParcelClaim = unpackIntInfo_Field as byteBuffer.PriceParcelClaimFactor = unpackFloatInfo_Field as byteBuffer.PriceUpload = unpackIntInfo_Field as byteBuffer.PriceRentLight = unpackIntInfo_Field as byteBuffer.TeleportMinPrice = unpackIntInfo_Field as byteBuffer.TeleportPriceExponent = unpackFloatInfo_Field as byteBuffer.EnergyEfficiency = unpackFloatInfo_Field as byteBuffer.PriceObjectRent = unpackFloatInfo_Field as byteBuffer.PriceObjectScaleFactor = unpackFloatInfo_Field as byteBuffer.PriceParcelRent = unpackIntInfo_Field as byteBuffer.PriceGroupCreate = unpackInt(byteBuffer)
    }
}
