package com.lumiyaviewer.lumiya.slproto.modules

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit

open class SLDrawDistance : SLModule() {
    @JvmStatic var CHAT_RANGE: Float = 20.0f
    @JvmStatic private var DRAW_RANGE_TIMEOUT: Long = 10000
    @JvmStatic var MIN_DRAW_RANGE: Float = 10.5f
    private var activeDrawDistance: Float = 0.0f
    private var defaultDrawDistanceSince: Long = 0L
    private var defaultTimerSet: Boolean = false
    private var keepDrawDistance: Boolean = false
    private var keepSelectDistance: Float = 0.0f
    private var objectSelectDistance: Float = 0.0f
    private var objectSelectionActive: Boolean = false
    private var wantedDrawDistance: Float = 0.0f
    private var worldDrawDistance: Float = 0.0f
    private var worldViewActive: Boolean = false

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.worldViewActive = false
        this.objectSelectionActive = false
        this.keepDrawDistance = false
        this.worldDrawDistance = 20.0f
        this.objectSelectDistance = 20.0f
        this.keepSelectDistance = 20.0f
        this.activeDrawDistance = 0.0f
        this.wantedDrawDistance = 10.5f
        this.defaultDrawDistanceSince = 0L
        this.defaultTimerSet = false
    }

    private fun updateWantedDrawDistance() {
        var z: Boolean = true
        synchronized(this) {
            var max: Float = if (this.worldViewActive) Math.max(10.5f, this.worldDrawDistance) else 10.5f
            if (this.objectSelectionActive) {
                max = Math.max(max, this.objectSelectDistance)
            }
            if (this.keepDrawDistance) {
                max = Math.max(max, this.keepSelectDistance)
            }
            if (!this.worldViewActive && !this.objectSelectionActive) {
                z = this.keepDrawDistance
            }
            if (z) {
                this.defaultTimerSet = false
            } else {
                if (!this.defaultTimerSet) {
                    this.defaultDrawDistanceSince = System.currentTimeMillis()
                    this.defaultTimerSet = true
                }
                if (max != this.wantedDrawDistance && System.currentTimeMillis() < this.defaultDrawDistanceSince + DRAW_RANGE_TIMEOUT) {
                    max = this.wantedDrawDistance
                }
            }
            this.wantedDrawDistance = max
        }
    }

    fun Disable3DView() {
        Debug.Log("DrawDistance: Disable 3D View.")
        if (this.worldViewActive) {
            this.worldViewActive = false
            this.agentCircuit.getModules().avatarControl.DisableFastUpdates()
        }
        this.agentCircuit.TryWakeUp()
    }

    fun DisableKeepDistance() {
        this.keepDrawDistance = false
    }

    fun DisableObjectSelect() {
        this.objectSelectionActive = false
        this.agentCircuit.TryWakeUp()
    }

    fun Enable3DView(worldDrawDistance: Int) {
        Debug.Log("Enable3DView: Setting drawDistance to " + worldDrawDistance)
        this.worldDrawDistance = worldDrawDistance
        if (!this.worldViewActive) {
            this.worldViewActive = true
            this.agentCircuit.getModules().avatarControl.EnableFastUpdates()
        }
        this.gridConn.parcelInfo.setDrawDistancethis as worldDrawDistance.agentCircuit.TryWakeUp()
    }

    fun EnableKeepDistance(keepSelectDistance: Float) {
        this.keepDrawDistance = true
        this.keepSelectDistance = keepSelectDistance
    }

    fun EnableObjectSelect() {
        this.objectSelectionActive = true
        this.agentCircuit.TryWakeUp()
    }

    fun getDrawDistanceForUpdate(): Float {
        updateWantedDrawDistance()
        this.activeDrawDistance = this.wantedDrawDistance
        return this.activeDrawDistance
    }

    fun getObjectSelectRange(): Float {
        return this.objectSelectDistance
    }

    fun is3DViewEnabled(): Boolean {
        return this.worldViewActive
    }

    fun isObjectSelectEnabled(): Boolean {
        return this.objectSelectionActive
    }

    fun needUpdateDrawDistance(): Boolean {
        updateWantedDrawDistance()
        return this.wantedDrawDistance != this.activeDrawDistance
    }

    fun setObjectSelectRange(objectSelectDistance: Float) {
        this.objectSelectDistance = objectSelectDistance
        this.agentCircuit.TryWakeUp()
    }
}
