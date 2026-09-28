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
import java.util.Iterator
import java.util.Map
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

open class SLTextureFetcher : SLModule(), SLIdleHandler {
    @JvmStatic private var MAX_UDP_TRANSFERS: Int = 2
    private var agentAppearanceService: String = ""
    private var capURL: String = ""
    private var lastCheckForStalls: Long = 0L
    private var udpQueue: PriorityBinQueue<SLTextureFetchRequest>? = null
    private var udpTransfers: MutableMap<UUID, TextureUDPTransfer>? = null

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps, agentAppearanceService: String) {
        superthis as agentCircuit.capURL = null
        this.agentAppearanceService = null
        this.udpTransfers = ConcurrentHashMap()
        this.udpQueue = PriorityBinQueue<>(TexturePriority.values().length)
        this.lastCheckForStalls = 0L
        this.agentAppearanceService = agentAppearanceService
        this.capURL = caps.getTextureFetchURL()
        Debug.Log("TextureFetcher: capURL = " + this.capURL)
    }

    private fun RunUDPQueue() {
        var poll: SLTextureFetchRequest? = null
        if (this.udpTransfers.size() < 2 && (poll = this.udpQueue.poll()) != null) {
            var textureUDPTransfer: TextureUDPTransfer = TextureUDPTransfer(poll.destFile, poll)
            this.udpTransfers.put(poll.textureID, textureUDPTransfer)
            textureUDPTransfer.StartTransfer(this.agentCircuit, this.circuitInfo)
        }
    }

    fun BeginFetch(textureFetchRequest2: SLTextureFetchRequest) {
        var textureFetchRequest: SLTextureFetchRequest? = null
        synchronized(this) {
            var file: File = textureFetchRequest2.destFile
            if (file.exists()) {
                textureFetchRequest2.outputFile = file
                textureFetchRequest = textureFetchRequest2
            } else {
                this.udpQueue.add(textureFetchRequest2)
                RunUDPQueue()
            }
        }
        if (textureFetchRequest == null || textureFetchRequest.onFetchComplete == null) {
            return
        }
        textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest2)
    }

    fun CancelFetch(textureFetchRequest: SLTextureFetchRequest) {
        this.udpQueue.removethis as textureFetchRequest.udpTransfers.remove(textureFetchRequest.textureID)
        RunUDPQueue()
    }
    fun HandleCloseCircuit() {
        StopFetching()
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun HandleImageData(imageData: ImageData) {
        var textureFetchRequest: SLTextureFetchRequest? = null
        synchronized(this) {
            textureFetchRequest = null
            var textureUDPTransfer: TextureUDPTransfer = this.udpTransfers.get(imageData.ImageID_Field.ID)
            if (textureUDPTransfer != null) {
                textureUDPTransfer.HandleImageData(imageData)
                if (textureUDPTransfer.isCompleted()) {
                    this.udpTransfers.remove(imageData.ImageID_Field.ID)
                    textureFetchRequest = textureUDPTransfer.fetchReq
                    RunUDPQueue()
                }
            }
        }
        if (textureFetchRequest == null || textureFetchRequest.onFetchComplete == null) {
            return
        }
        textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest)
    }

    @SLMessageHandler
    fun HandleImageNotInDatabase(imageNotInDatabase: ImageNotInDatabase) {
        var textureFetchRequest: SLTextureFetchRequest? = null
        synchronized(this) {
            Debug.Log("TextureUDP: Image not in database: " + imageNotInDatabase.ImageID_Field.ID)
            var remove: TextureUDPTransfer = this.udpTransfers.remove(imageNotInDatabase.ImageID_Field.ID)
            textureFetchRequest = if (remove != null) remove.fetchReq else null
        }
        if (textureFetchRequest != null && textureFetchRequest.onFetchComplete != null) {
            textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest)
        }
        RunUDPQueue()
    }

    @SLMessageHandler
    fun HandleImagePacket(imagePacket: ImagePacket) {
        var textureFetchRequest: SLTextureFetchRequest? = null
        synchronized(this) {
            textureFetchRequest = null
            var textureUDPTransfer: TextureUDPTransfer = this.udpTransfers.get(imagePacket.ImageID_Field.ID)
            if (textureUDPTransfer != null) {
                textureUDPTransfer.HandleImagePacket(imagePacket)
                if (textureUDPTransfer.isCompleted()) {
                    this.udpTransfers.remove(imagePacket.ImageID_Field.ID)
                    var fetchReq: SLTextureFetchRequest = textureUDPTransfer.fetchReq
                    fetchReq.outputFile = textureUDPTransfer.getOutputFile()
                    RunUDPQueue()
                    textureFetchRequest = fetchReq
                }
            }
        }
        if (textureFetchRequest == null || textureFetchRequest.onFetchComplete == null) {
            return
        }
        textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest)
    }
    fun ProcessIdle() {
        var hashSet: HashSet? = null
        var hashSet2: HashSet? = null
        var currentTimeMillis: Long = System.currentTimeMillis()
        if (currentTimeMillis >= this.lastCheckForStalls + 1000) {
            this.lastCheckForStalls = currentTimeMillis
            try {
                Iterator<Map.Entry<UUID, TextureUDPTransfer>> it = this.udpTransfers.entrySet().iterator()
                while (it.hasNext()) {
                    var entry: Map.Entry<UUID, TextureUDPTransfer> = it.next()
                    if (!entry.getValue().hasStalled() || entry.getValue().RetryTransfer(this.agentCircuit, this.circuitInfo)) {
                        hashSet = hashSet2
                    } else {
                        Debug.Printf("Cannot retry texture %s", entry.getKey().toString())
                        var hashSet3: HashSet = if (hashSet2 == null) HashSet() else hashSet2
                        hashSet3.add(entry.getKey())
                        hashSet = hashSet3
                    }
                    hashSet2 = hashSet
                }
                if (hashSet2 != null) {
                    var iterator: Iterator = hashSet2.iterator()
                    while (iterator.hasNext()) {
                        var remove: TextureUDPTransfer = this.udpTransfers.remove(iterator as UUID.next())
                        if (remove != null) {
                            var fetchReq: SLTextureFetchRequest = remove.fetchReq
                            fetchReq.outputFile = null
                            if (fetchReq.onFetchComplete != null) {
                                fetchReq.onFetchComplete.OnTextureFetchComplete(fetchReq)
                            }
                        }
                    }
                    RunUDPQueue()
                }
            } catch (e: ConcurrentModificationException) {
                Debug.Warning(e)
            }
        }
    }

    fun StopFetching() {
        this.udpQueue.clear()
    }

    fun UpdatePriority(textureFetchRequest: SLTextureFetchRequest) {
        this.udpQueue.updatePriority(textureFetchRequest)
    }

    fun getAgentAppearanceService(): String {
        return this.agentAppearanceService
    }

    fun getCapURL(): String {
        return this.capURL
    }
}
