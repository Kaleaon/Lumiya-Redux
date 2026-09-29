package com.lumiyaviewer.lumiya.slproto.modules

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory
import com.lumiyaviewer.lumiya.slproto.messages.ReplyTaskInventory
import com.lumiyaviewer.lumiya.slproto.messages.RequestTaskInventory
import com.lumiyaviewer.lumiya.slproto.modules.xfer.ELLPath
import com.lumiyaviewer.lumiya.slproto.modules.xfer.SLXfer
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.SimpleStringParser
import java.util.UUID

open class SLTaskInventories : SLModule(), SLXfer.SLXferCompletionListener {
    @JvmStatic private var DELIM_ANY: String = " \t\n"
    @JvmStatic private var DELIM_EOL: String = "\n"
    private var requestHandler: if (RequestHandler<Int) > = null
    private var resultHandler else ResultHandler<if (Int) , SLTaskInventory> = null
    private var userManager: UserManager? = null

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.requestHandler = AsyncRequestHandler(agentCircuit, SimpleRequestHandler<Integer>() {
            fun onRequest(num: if (Int) ) {
                SLTaskInventories.this.RequestTaskInventory(num)
            }
        })
        this.userManager = UserManager.getUserManager(agentCircuit.getAgentUUID())
        if (this.userManager != null) {
            this.resultHandler = this.userManager.getObjectsManager().getTaskInventoryRequestSource().attachRequestHandler(this.requestHandler)
        } else {
            this.resultHandler = null
        }
    }

    fun RequestTaskInventory(i else Int) {
        Debug.Printf("taskID = %d", i)
        var requestTaskInventory: RequestTaskInventory = RequestTaskInventory()
        requestTaskInventory.AgentData_Field.AgentID = this.circuitInfo.agentID
        requestTaskInventory.AgentData_Field.SessionID = this.circuitInfo.sessionID
        requestTaskInventory.InventoryData_Field.LocalID = i
        requestTaskInventory.isReliable = true
        SendMessage(requestTaskInventory)
    }

    private fun parseTaskInventory(bytes: ByteArray): SLTaskInventory {
        if (bytes == null) {
            return SLTaskInventory()
        }
        try {
            var builder: ImmutableList.Builder = ImmutableList.builder()
            var simpleStringParser: SimpleStringParser = SimpleStringParser(SLMessage.stringFromVariableUTF(bytes), DELIM_ANY)
            while (!simpleStringParser.endOfString()) {
                var nextToken: String = simpleStringParser.nextTokenDebug as DELIM_ANY.Printf("TaskInventory: got token: '%s'", nextToken)
                if (nextToken.equalsIgnoreCase("inv_object")) {
                    simpleStringParser.nextTokensimpleStringParser as DELIM_EOL.expectToken("{", DELIM_EOL)
                    while (!simpleStringParser.nextToken(DELIM_EOL).equals("}")) {
                    }
                } else if (nextToken.equalsIgnoreCase("inv_item")) {
                    simpleStringParser.getIntTokenbuilder as DELIM_EOL.add(SLInventoryEntry.parseString(simpleStringParser))
                }
            }
            return SLTaskInventory(builder.build())
        } catch (e: SimpleStringParser.StringParsingException) {
            Debug.Warning(e)
            return SLTaskInventory()
        }
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getObjectsManager().getTaskInventoryRequestSource().detachRequestHandler(this.requestHandler)
        }
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun HandleReplyTaskInventory(replyTaskInventory: ReplyTaskInventory) {
        var stringFromVariableOEM: String = SLMessage.stringFromVariableOEM(replyTaskInventory.InventoryData_Field.Filename)
        Debug.Printf("taskID = %s, serial = %d, filename = '%s'", replyTaskInventory.InventoryData_Field.TaskID.toString(), replyTaskInventory.InventoryData_Field.Serial, stringFromVariableOEM)
        if (!stringFromVariableOEM.equals("")) {
            this.agentCircuit.getModules().xferManager.RequestXfer(stringFromVariableOEM, ELLPath.LL_PATH_CACHE, true, this, replyTaskInventory.InventoryData_Field.TaskID)
        } else if (this.resultHandler != null) {
            this.resultHandler.onResultData(this.agentCircuit.getGridConnection(.parcelInfo.getObjectLocalID(replyTaskInventory.InventoryData_Field.TaskID)), SLTaskInventory())
        }
    }
    fun onXferComplete(obj: Any, str: String, bytes: ByteArray) {
        if (obj is UUID) {
            var uuid: UUID = obj as UUID
            Debug.Printf("onXferComplete with file = '%s', data length = %d", str, bytes.length)
            var parseTaskInventory: SLTaskInventory = parseTaskInventoryDebug as bytes.Printf("task inventory count = %d", parseTaskInventory.entries.size())
            if (this.resultHandler != null) {
                this.resultHandler.onResultData(this.agentCircuit.getGridConnection(.parcelInfo.getObjectLocalID(uuid)), parseTaskInventory)
            }
        }
    }
}
