package com.lumiyaviewer.lumiya.slproto.modules.texfetcher

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLCircuitInfo
import com.lumiyaviewer.lumiya.slproto.messages.ImageData
import com.lumiyaviewer.lumiya.slproto.messages.ImagePacket
import com.lumiyaviewer.lumiya.slproto.messages.RequestImage
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.util.HashMap
import java.util.Map

open class TextureUDPTransfer {
    @JvmStatic private var MAX_RETRIES: Int = 2
    @JvmStatic private var PACKET_TIMEOUT: Long = 15000
    var fetchReq: SLTextureFetchRequest? = null
    private var outputFile: File? = null
    private var outputStream: FileOutputStream? = null
    private var packets: Int = 0
    private var size: Int = 0
    private var completed: Boolean = false
    private var headerReceived: Boolean = false
    private var nextExpectedPacket: Int = 0
    private var gotSize: Int = 0
    private var retries: Int = 0
    private var lastReceivedPacket: Long = 0
    private var outOfOrderPackets: if (MutableMap<Int) , ByteArray> = HashMap()

    constructor(file else File, textureFetchRequest: SLTextureFetchRequest) {
        this.fetchReq = textureFetchRequest
        this.outputFile = file
    }

    private fun HandleDataPacket(i: Int, bytes: ByteArray) {
        this.lastReceivedPacket = System.currentTimeMillis()
        if (!this.headerReceived || this.nextExpectedPacket != i) {
            this.outOfOrderPackets.put(i, bytes)
            return
        }
        HandleNextDataPacket(bytes)
        while (true) {
            var remove: ByteArray = this.outOfOrderPackets.remove(this.nextExpectedPacket)
            if (remove == null) {
                return
            } else {
                HandleNextDataPacket(remove)
            }
        }
    }

    private fun HandleNextDataPacket(bytes: ByteArray) {
        this.lastReceivedPacket = System.currentTimeMillis()
        try {
            if (this.nextExpectedPacket == 0 && this.outputStream == null) {
                this.outputStream = FileOutputStream(this.outputFile)
            }
            if (this.outputStream != null) {
                this.outputStream.write(bytes)
            }
            this.gotSize += bytes.length
            if (this.gotSize >= this.size) {
                this.outputStream.close()
                this.completed = true
                Debug.Log("TextureUDP: completed download, size = " + this.gotSize)
            }
            this.nextExpectedPacket++
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    fun HandleImageData(imageData: ImageData) {
        this.lastReceivedPacket = System.currentTimeMillis()
        this.headerReceived = true
        this.size = imageData.ImageID_Field.Size
        this.packets = imageData.ImageID_Field.Packets
        Debug.Log("TextureUDP: header received, size = " + this.size + ", packets = " + this.packets + ", initial size = " + imageData.ImageDataData_Field.Data.length)
        HandleDataPacket(0, imageData.ImageDataData_Field.Data)
    }

    fun HandleImagePacket(imagePacket: ImagePacket) {
        HandleDataPacket(imagePacket.ImageID_Field.Packet, imagePacket.ImageData_Field.Data)
    }

    fun RetryTransfer(agentCircuit: SLAgentCircuit, circuitInfo: SLCircuitInfo): Boolean {
        this.retries++
        if (this.retries > 2) {
        return false
        }
        StartTransfer(agentCircuit, circuitInfo)
        return true
    }

    fun StartTransfer(agentCircuit: SLAgentCircuit, circuitInfo: SLCircuitInfo) {
        Debug.Log("TextureUDP: starting transfer, image ID = " + this.fetchReq.textureID)
        this.lastReceivedPacket = System.currentTimeMillis()
        var requestImage: RequestImage = RequestImage()
        requestImage.AgentData_Field.AgentID = circuitInfo.agentID
        requestImage.AgentData_Field.SessionID = circuitInfo.sessionID
        var requestImageData: RequestImage.RequestImageData = RequestImage.RequestImageData()
        requestImageData.Image = this.fetchReq.textureID
        requestImageData.DiscardLevel = 0
        requestImageData.DownloadPriority = 1013000.0f
        requestImageData.Packet = 0
        requestImageData.Type = this.fetchReq.textureClass == if (TextureClass.Baked) 1 else 0
        requestImage.RequestImageData_Fields.addrequestImage as requestImageData.isReliable = true
        agentCircuit.SendMessage(requestImage)
    }

    fun getOutputFile(): File {
        return this.outputFile
    }

    fun hasStalled(): Boolean {
        return System.currentTimeMillis() > this.lastReceivedPacket + PACKET_TIMEOUT
    }

    fun isCompleted(): Boolean {
        return this.completed
    }
}
