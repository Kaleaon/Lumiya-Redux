package com.lumiyaviewer.lumiya.ui.render.filament

import android.app.Activity
import android.os.Bundle
import android.view.MotionEvent
import android.view.SurfaceView
import com.lumiyaviewer.lumiya.GridConnectionService
import com.lumiyaviewer.lumiya.render.scene.RegionSceneSource
import com.lumiyaviewer.lumiya.render.scene.SceneDelta
import com.lumiyaviewer.lumiya.render.scene.SceneDeltaQueue
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightDay
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightPreset
import java.util.Calendar
import java.util.concurrent.Executors
import java.util.concurrent.ScheduledExecutorService
import java.util.concurrent.TimeUnit

/**
 * Developer-only Filament world view, stage F0: the current region's terrain
 * and the Windlight sky at the simulator's sun hour, rendered by Filament from
 * [SceneDelta]s. With no region loaded it shows generated hills and the sky at
 * the device's local time.
 *
 * Only in debug builds (src/debug), launched from its own "Filament F0 (dev)"
 * launcher entry. Drag horizontally to turn the camera.
 */
class FilamentWorldActivity : Activity() {
    private lateinit var surfaceView: SurfaceView
    private var worldRenderer: FilamentWorldRenderer? = null
    private val deltas = SceneDeltaQueue()
    private var producer: ScheduledExecutorService? = null
    private var lastTouchX = 0f

    val renderer: FilamentWorldRenderer? get() = worldRenderer

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        surfaceView = SurfaceView(this)
        setContentView(surfaceView)
        worldRenderer = FilamentWorldRenderer(this, surfaceView, deltas)
        surfaceView.setOnTouchListener { _, event ->
            when (event.actionMasked) {
                MotionEvent.ACTION_DOWN -> lastTouchX = event.x
                MotionEvent.ACTION_MOVE -> {
                    worldRenderer?.let { it.yawOffset -= (event.x - lastTouchX) / surfaceView.width * Math.PI }
                    lastTouchX = event.x
                }
            }
            true
        }
    }

    override fun onResume() {
        super.onResume()
        worldRenderer?.resume()
        val windlightDay = WindlightDay()
        val preset = WindlightPreset()
        producer = Executors.newSingleThreadScheduledExecutor { r -> Thread(r, "FilamentSceneSource") }.also {
            it.scheduleWithFixedDelay({ produce(windlightDay, preset) }, 0, 2, TimeUnit.SECONDS)
        }
    }

    override fun onPause() {
        producer?.shutdownNow()
        producer = null
        worldRenderer?.pause()
        super.onPause()
    }

    override fun onDestroy() {
        worldRenderer?.destroy()
        worldRenderer = null
        super.onDestroy()
    }

    /** Terrain and environment deltas from the connected region, or the demo scene. */
    private fun produce(windlightDay: WindlightDay, preset: WindlightPreset) {
        val parcelInfo = GridConnectionService.getGridConnection()?.parcelInfo
        val regionTerrain = parcelInfo?.let { RegionSceneSource.terrainDeltas(it.terrainData) }.orEmpty()
        deltas.offerAll(if (regionTerrain.isNotEmpty()) regionTerrain else RegionSceneSource.demoTerrain())

        val sunHour = if (regionTerrain.isNotEmpty() && parcelInfo != null) {
            parcelInfo.peekSunHour()
        } else {
            val now = Calendar.getInstance()
            (now.get(Calendar.HOUR_OF_DAY) * 60 + now.get(Calendar.MINUTE)) / 1440f
        }
        windlightDay.InterpolatePreset(preset, sunHour)
        deltas.offer(RegionSceneSource.environmentDelta(preset))
    }
}
