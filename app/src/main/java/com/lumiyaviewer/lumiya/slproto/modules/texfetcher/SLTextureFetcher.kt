package com.lumiyaviewer.lumiya.slproto.modules.texfetcher

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.tex.TexturePriority
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.ImageData
import com.lumiyaviewer.lumiya.slproto.messages.ImageNotInDatabase
import com.lumiyaviewer.lumiya.slproto.messages.ImagePacket
import com.lumiyaviewer.lumiya.slproto.modules.SLIdleHandler
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.utils.PriorityBinQueue
import java.io.File
import java.util.ConcurrentModificationException
import java.util.HashSet
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

open class SLTextureFetcher : SLModule, SLIdleHandler, TextureQueueController {
    companion object {
        private const val MAX_UDP_TRANSFERS: Int = 2

        @Volatile
        @JvmStatic
        var shared: SLTextureFetcher? = null
    }

    private var agentAppearanceService: String? = null
    private var capURL: String? = null
    private var lastCheckForStalls: Long = 0L
    private var udpQueue: PriorityBinQueue<SLTextureFetchRequest> = PriorityBinQueue(TexturePriority.values().size)
    private var udpTransfers: MutableMap<UUID, TextureUDPTransfer> = ConcurrentHashMap()

    @Volatile
    private var isPausedState: Boolean = false

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps, agentAppearanceService: String?) : super(agentCircuit) {
        this.agentAppearanceService = agentAppearanceService
        this.capURL = caps.getTextureFetchURL()
        this.lastCheckForStalls = 0L
        shared = this
        Debug.Log("TextureFetcher: capURL = " + this.capURL)
    }

    override val isFetchingPaused: Boolean
        get() = isPausedState

    @Synchronized
    override fun pauseFetching() {
        if (isPausedState) return
        isPausedState = true
        Debug.Log("SLTextureFetcher: pauseFetching called - clearing active transfers and retaining pending queue descriptors")

        for (transfer in udpTransfers.values) {
            val req = transfer.fetchReq
            if (req != null) {
                udpQueue.add(req)
            }
        }
        udpTransfers.clear()
    }

    @Synchronized
    override fun resumeFetching() {
        if (!isPausedState) return
        isPausedState = false
        Debug.Log("SLTextureFetcher: resumeFetching called - restarting RunUDPQueue")
        RunUDPQueue()
    }

    private synchronized fun RunUDPQueue() {
        if (isPausedState) return

        var poll: SLTextureFetchRequest?
        if (this.udpTransfers.size < MAX_UDP_TRANSFERS && (this.udpQueue.poll().also { poll = it }) != null) {
            val request = poll!!
            val textureUDPTransfer = TextureUDPTransfer(request.destFile, request)
            this.udpTransfers[request.textureID] = textureUDPTransfer
            textureUDPTransfer.StartTransfer(this.agentCircuit, this.circuitInfo)
        }
    }

    fun BeginFetch(textureFetchRequest: SLTextureFetchRequest) {
        var completedReq: SLTextureFetchRequest? = null
        synchronized(this) {
            val file: File? = textureFetchRequest.destFile
            if (file != null && file.exists()) {
                textureFetchRequest.outputFile = file
                completedReq = textureFetchRequest
            } else {
                this.udpQueue.add(textureFetchRequest)
                if (!isPausedState) {
                    RunUDPQueue()
                }
            }
        }
        if (completedReq?.onFetchComplete != null) {
            completedReq?.onFetchComplete?.OnTextureFetchComplete(textureFetchRequest)
        }
    }

    @Synchronized
    fun CancelFetch(textureFetchRequest: SLTextureFetchRequest) {
        this.udpQueue.remove(textureFetchRequest)
        this.udpTransfers.remove(textureFetchRequest.textureID)
        if (!isPausedState) {
            RunUDPQueue()
        }
    }

    override fun HandleCloseCircuit() {
        StopFetching()
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun HandleImageData(imageData: ImageData) {
        var completedReq: SLTextureFetchRequest? = null
        synchronized(this) {
            val textureUDPTransfer = this.udpTransfers[imageData.ImageID_Field.ID]
            if (textureUDPTransfer != null) {
                textureUDPTransfer.HandleImageData(imageData)
                if (textureUDPTransfer.isCompleted()) {
                    this.udpTransfers.remove(imageData.ImageID_Field.ID)
                    completedReq = textureUDPTransfer.fetchReq
                    if (!isPausedState) {
                        RunUDPQueue()
                    }
                }
            }
        }
        if (completedReq?.onFetchComplete != null) {
            completedReq?.onFetchComplete?.OnTextureFetchComplete(completedReq!!)
        }
    }

    @SLMessageHandler
    fun HandleImageNotInDatabase(imageNotInDatabase: ImageNotInDatabase) {
        var completedReq: SLTextureFetchRequest? = null
        synchronized(this) {
            Debug.Log("TextureUDP: Image not in database: " + imageNotInDatabase.ImageID_Field.ID)
            val remove = this.udpTransfers.remove(imageNotInDatabase.ImageID_Field.ID)
            completedReq = remove?.fetchReq
        }
        if (completedReq?.onFetchComplete != null) {
            completedReq?.onFetchComplete?.OnTextureFetchComplete(completedReq!!)
        }
        if (!isPausedState) {
            RunUDPQueue()
        }
    }

    @SLMessageHandler
    fun HandleImagePacket(imagePacket: ImagePacket) {
        var completedReq: SLTextureFetchRequest? = null
        synchronized(this) {
            val textureUDPTransfer = this.udpTransfers[imagePacket.ImageID_Field.ID]
            if (textureUDPTransfer != null) {
                textureUDPTransfer.HandleImagePacket(imagePacket)
                if (textureUDPTransfer.isCompleted()) {
                    this.udpTransfers.remove(imagePacket.ImageID_Field.ID)
                    val fetchReq = textureUDPTransfer.fetchReq
                    fetchReq?.outputFile = textureUDPTransfer.getOutputFile()
                    if (!isPausedState) {
                        RunUDPQueue()
                    }
                    completedReq = fetchReq
                }
            }
        }
        if (completedReq?.onFetchComplete != null) {
            completedReq?.onFetchComplete?.OnTextureFetchComplete(completedReq!!)
        }
    }

    override fun ProcessIdle() {
        var stalledUuids: HashSet<UUID>? = null
        val currentTimeMillis = System.currentTimeMillis()
        if (currentTimeMillis >= this.lastCheckForStalls + 1000) {
            this.lastCheckForStalls = currentTimeMillis
            try {
                for (entry in this.udpTransfers.entries) {
                    val transfer = entry.value
                    if (!transfer.hasStalled() || transfer.RetryTransfer(this.agentCircuit, this.circuitInfo)) {
                        // transfer ongoing or retried
                    } else {
                        Debug.Printf("Cannot retry texture %s", entry.key.toString())
                        if (stalledUuids == null) stalledUuids = HashSet()
                        stalledUuids.add(entry.key)
                    }
                }
                if (stalledUuids != null) {
                    for (uuid in stalledUuids) {
                        val remove = this.udpTransfers.remove(uuid)
                        if (remove != null) {
                            val fetchReq = remove.fetchReq
                            if (fetchReq != null) {
                                fetchReq.outputFile = null
                                fetchReq.onFetchComplete?.OnTextureFetchComplete(fetchReq)
                            }
                        }
                    }
                    if (!isPausedState) {
                        RunUDPQueue()
                    }
                }
            } catch (e: ConcurrentModificationException) {
                Debug.Warning(e)
            }
        }
    }

    fun StopFetching() {
        this.udpQueue.clear()
        this.udpTransfers.clear()
    }

    fun UpdatePriority(textureFetchRequest: SLTextureFetchRequest) {
        this.udpQueue.updatePriority(textureFetchRequest)
    }

    fun getAgentAppearanceService(): String? {
        return this.agentAppearanceService
    }

    fun getCapURL(): String? {
        return this.capURL
    }
}
