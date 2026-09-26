package com.lumiyaviewer.lumiya.slproto.modules.xfer

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.ConfirmXferPacket
import com.lumiyaviewer.lumiya.slproto.messages.RequestXfer
import com.lumiyaviewer.lumiya.slproto.messages.SendXferPacket
import java.util.Iterator
import java.util.LinkedList
import java.util.List
import java.util.UUID

open class SLXfer {
    private var deleteOnCompletion: Boolean = false
    private var fileName: String = ""
    private var filePath: ELLPath = null
    private var id: Long = 0L
    private var listeners: MutableList<XferListenerInvocation> = LinkedList()
    private var hasCompleted: Boolean = false
    private var receivedData: ByteArray = null
    private var receivedDataLen: Int = 0
    private var expectedDataLen: Int = 0
    private var expectedPacketNum: Int = 0

    interface SLXferCompletionListener {
        void onXferComplete(Object obj, String str, byte[] bytes)
    }

    private open class XferListenerInvocation {
        private SLXferCompletionListener listener
        private Object tag

        fun XferListenerInvocation(tag: Any, xferCompletionListener: SLXferCompletionListener): public {
            this.tag = tag
            this.listener = xferCompletionListener
        }

        fun invokeListener(str: String, bytes: ByteArray) {
            this.listener.onXferComplete(this.tag, str, bytes)
        }
    }

    constructor(id: Long, fileName: String, ellPath: ELLPath, deleteOnCompletion: Boolean) {
        this.id = id
        this.fileName = fileName
        this.filePath = ellPath
        this.deleteOnCompletion = deleteOnCompletion
    }

    fun HandleDataPacket(xferManager: SLXferManager, sendXferPacket: SendXferPacket) {
        var length: Int = 0
        var i: Int = 4
        Debug.Printf("XferPacket: packetNum %d (0x%x), dataLen %d", sendXferPacket.XferID_Field.Packet, sendXferPacket.XferID_Field.Packet, sendXferPacket.DataPacket_Field.Data.length)
        var i2: Int = Integer.MAX_VALUE & sendXferPacket.XferID_Field.Packet
        var z: Boolean = (sendXferPacket.XferID_Field.Packet & Integer.MIN_VALUE) != 0
        if (i2 == this.expectedPacketNum) {
            if (i2 != 0) {
                i = 0
                length = sendXferPacket.DataPacket_Field.Data.length
            } else {
                if (sendXferPacket.DataPacket_Field.Data.length < 4) {
                    return
                }
                this.expectedDataLen = (sendXferPacket.DataPacket_Field.Data[0] & 0xFF) | ((sendXferPacket.DataPacket_Field.Data[1] << 8) & 0xFF00) | ((sendXferPacket.DataPacket_Field.Data[2] << 16) & 0xFF0000) | ((sendXferPacket.DataPacket_Field.Data[3] << 24) & 0xFF000000)
                Debug.Printf("XferPacket: expected data len = %d (0x%x)", this.expectedDataLen, this.expectedDataLen)
                this.receivedData = ByteArray(this.expectedDataLen)
                length = sendXferPacket.DataPacket_Field.Data.length - 4
            }
            if (this.receivedDataLen + length > this.expectedDataLen) {
                return
            }
            System.arraycopy(sendXferPacket.DataPacket_Field.Data, i, this.receivedData, this.receivedDataLen, length)
            this.receivedDataLen = length + this.receivedDataLen
            this.expectedPacketNum++
            if (z) {
                this.hasCompleted = true
            }
        }
        if (i2 <= this.expectedPacketNum) {
            var confirmXferPacket: ConfirmXferPacket = ConfirmXferPacket()
            confirmXferPacket.XferID_Field.ID = this.id
            confirmXferPacket.XferID_Field.Packet = sendXferPacket.XferID_Field.Packet
            confirmXferPacket.isReliable = true
            xferManager.SendMessage(confirmXferPacket)
        }
    }

    fun StartTransfer(xferManager: SLXferManager) {
        var requestXfer: RequestXfer = RequestXfer()
        requestXfer.XferID_Field.ID = this.id
        requestXfer.XferID_Field.Filename = SLMessage.stringToVariableOEM(this.fileName)
        requestXfer.XferID_Field.FilePath = this.filePath.getCode()
        requestXfer.XferID_Field.DeleteOnCompletion = this.deleteOnCompletion
        requestXfer.XferID_Field.UseBigPackets = false
        requestXfer.XferID_Field.VFileID = UUID(0L, 0L)
        requestXfer.XferID_Field.VFileType = -1
        requestXfer.isReliable = true
        xferManager.SendMessage(requestXfer)
    }

    fun addListener(xferCompletionListener: SLXferCompletionListener, obj: Any) {
        this.listeners.add(XferListenerInvocation(obj, xferCompletionListener))
    }

    fun getData(): ByteArray {
        return this.receivedData
    }

    fun getFilename(): String {
        return this.fileName
    }

    fun invokeListeners() {
        var it: Iterator<XferListenerInvocation> = this.listeners.iterator()
        while (it.hasNext()) {
            it.next().invokeListener(this.fileName, this.receivedData)
        }
    }

    fun isCompleted(): Boolean {
        return this.hasCompleted
    }
}
