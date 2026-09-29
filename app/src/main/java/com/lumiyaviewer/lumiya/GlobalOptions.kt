package com.lumiyaviewer.lumiya

import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import androidx.core.content.ContextCompat
import com.google.common.base.Strings
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker
import com.lumiyaviewer.lumiya.res.mesh.MeshCache
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.ui.media.NotificationSounds
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import com.lumiyaviewer.lumiya.ui.settings.ThemeChangedEvent
import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.io.IOException
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference

class GlobalOptions private constructor() : SharedPreferences.OnSharedPreferenceChangeListener {

    @JvmField var themeResourceId: Int = R.style.Theme_Lumiya_Light
    @JvmField var legacyUserNames: Boolean = false
    @JvmField var showTimestamps: Boolean = true
    @JvmField var highQualityTextures: Boolean = false
    @JvmField var compressedTextures: Boolean = true
    @JvmField var maxTextureDownloads: Int = 2
    @JvmField var terrainTextures: Boolean = true
    @JvmField var meshRendering: MeshRendering = MeshRendering.medium
    @JvmField var RLVEnabled: Boolean = false
    @JvmField var keepWifiOn: Boolean = false
    private val baseCacheDir = AtomicReference<File?>()
    private val availableCacheDirs = AtomicReference<ImmutableList<File>>(ImmutableList.of())
    private val cacheDirUsed = AtomicBoolean(false)
    @JvmField var autoReconnect: Boolean = true
    @JvmField var maxReconnectAttempts: Int = 10
    @JvmField var hoverTextEnableHUDs: Boolean = true
    @JvmField var hoverTextEnableObjects: Boolean = false
    @JvmField var advancedRendering: Boolean = true
    @JvmField var useFXAA: Boolean = true
    @JvmField var renderClouds: Boolean = true
    @JvmField var forceDaylightTime: Boolean = false
    @JvmField var forceDaylightHour: Float = 0.5f
    @JvmField var cloudSyncEnabled: Boolean = false
    @JvmField var voiceEnabled: Boolean = false

    class GlobalOptionsChangedEvent(@JvmField val preferences: SharedPreferences)

    private object InstanceHolder {
        val Instance = GlobalOptions()
    }

    enum class MeshRendering(private val lodName: String?) {
        high("high_lod"),
        medium("medium_lod"),
        low("low_lod"),
        lowest("lowest_lod"),
        disabled(null);

        fun getLODName(): String? = lodName

        companion object {
            @JvmStatic
            fun valuesCustom(): Array<MeshRendering> = entries.toTypedArray()
        }
    }

    private fun isCacheDirectoryWriteable(file: File?): Boolean {
        if (file == null) return false
        return try {
            file.mkdirs()
            if (!file.exists()) return false
            val tmp = File(file, ".tmp")
            if (tmp.exists()) {
                tmp.delete()
                if (tmp.exists()) return false
            }
            tmp.createNewFile()
            if (!tmp.exists()) return false
            tmp.delete()
            true
        } catch (_: IOException) {
            false
        }
    }

    private fun updateCacheDir(context: Context, sharedPreferences: SharedPreferences) {
        var selectedDir: File? = null
        val previousDir = baseCacheDir.get()
        val prefLocation = sharedPreferences.getString("cache_location", "") ?: ""
        if (previousDir != null && isCacheDirectoryWriteable(previousDir) && prefLocation.isEmpty()) {
            selectedDir = previousDir
        }
        val candidates = ArrayList<File>()
        val externalCacheDirs = ContextCompat.getExternalCacheDirs(context)
        if (externalCacheDirs != null) {
            for (dir in externalCacheDirs) {
                if (dir != null) candidates.add(dir)
            }
        }
        val internalCache = context.cacheDir
        if (internalCache != null) candidates.add(internalCache)

        val builder = ImmutableList.builder<File>()
        for (candidate in candidates) {
            Debug.Printf("Cache: checking cache location %s", candidate)
            if (isCacheDirectoryWriteable(candidate)) {
                builder.add(candidate)
                if (selectedDir == null) {
                    selectedDir = candidate
                } else if (prefLocation.isNotEmpty() && candidate.absolutePath == prefLocation) {
                    selectedDir = candidate
                }
            }
        }
        if (selectedDir == null) {
            selectedDir = context.cacheDir
        }
        Debug.Printf("Cache: cache location set to %s", selectedDir!!.absolutePath)
        availableCacheDirs.set(builder.build())
        baseCacheDir.set(selectedDir)
        try {
            selectedDir.mkdirs()
            if (selectedDir.exists()) {
                File(selectedDir, ".nomedia").createNewFile()
            }
        } catch (_: Exception) {
        }
        if (previousDir != null && previousDir != selectedDir) {
            Debug.Printf("Cache: Cache location has been changed.")
            TextureCache.getInstance().onCacheDirChanged()
            MeshCache.onCacheDirChanged()
        }
    }

    private fun updateNotificationSoundDefault(
        sharedPreferences: SharedPreferences,
        notificationType: NotificationType
    ) {
        if (sharedPreferences.contains(notificationType.getRingtoneKey())) return
        val notificationSounds = NotificationSounds.defaultSounds[notificationType] ?: return
        val uri: Uri = notificationSounds.getUri()
        val edit = sharedPreferences.edit()
        edit.putString(notificationType.getRingtoneKey(), uri.toString())
        edit.apply()
        Debug.Printf("NotificationSounds: Updated %s preference to %s", notificationType.getRingtoneKey(), uri)
    }

    fun enableVoice() {
        val edit = LumiyaApp.getDefaultSharedPreferences().edit()
        edit.putBoolean("enableVoice", true)
        edit.apply()
    }

    fun getAdvancedRendering(): Boolean = advancedRendering
    fun getAutoReconnect(): Boolean = autoReconnect
    fun getAvailableCacheDirs(): ImmutableList<File> = availableCacheDirs.get()
    fun getBaseCacheDir(): File? = baseCacheDir.get()

    fun getCacheDir(str: String): File {
        cacheDirUsed.set(true)
        val file = baseCacheDir.get() ?: LumiyaApp.getContext().cacheDir
        val subDir = File(file, str)
        try { subDir.mkdirs() } catch (_: Exception) {}
        return subDir
    }

    fun getCompressedTextures(): Boolean = compressedTextures
    fun getForceDaylightHour(): Float = forceDaylightHour
    fun getForceDaylightTime(): Boolean = forceDaylightTime
    fun getHighQualityTextures(): Boolean = highQualityTextures
    fun getHoverTextEnableHUDs(): Boolean = hoverTextEnableHUDs
    fun getHoverTextEnableObjects(): Boolean = hoverTextEnableObjects
    fun getKeepWifiOn(): Boolean = keepWifiOn
    fun getMaxReconnectAttempts(): Int = maxReconnectAttempts
    fun getMaxTextureDownloads(): Int = maxTextureDownloads
    fun getMeshRendering(): MeshRendering = meshRendering
    fun getRLVEnabled(): Boolean = RLVEnabled
    fun getRenderClouds(): Boolean = renderClouds
    fun getShowTimestamps(): Boolean = showTimestamps
    fun getTerrainTextures(): Boolean = terrainTextures
    fun getThemeResourceId(): Int = themeResourceId
    fun getUseFXAA(): Boolean = useFXAA
    fun getVoiceEnabled(): Boolean = voiceEnabled

    fun initialize() {
        val defaultSharedPreferences = LumiyaApp.getDefaultSharedPreferences()
        updateFromPreferences(LumiyaApp.getContext(), defaultSharedPreferences)
        defaultSharedPreferences.registerOnSharedPreferenceChangeListener(this)
    }

    fun isCacheDirUsed(): Boolean = cacheDirUsed.get()
    fun isLegacyUserNames(): Boolean = legacyUserNames

    override fun onSharedPreferenceChanged(sharedPreferences: SharedPreferences, str: String?) {
        updateFromPreferences(LumiyaApp.getContext(), sharedPreferences)
        EventBus.getInstance().publish(GlobalOptionsChangedEvent(sharedPreferences))
    }

    fun updateFromPreferences(context: Context, sharedPreferences: SharedPreferences) {
        Debug.Printf("Updating options from preferences.")
        updateNotificationSoundDefault(sharedPreferences, NotificationType.Private)
        updateNotificationSoundDefault(sharedPreferences, NotificationType.Group)
        updateNotificationSoundDefault(sharedPreferences, NotificationType.LocalChat)
        if (!sharedPreferences.getBoolean("system_defaults_set", false)) {
            val edit = sharedPreferences.edit()
            val totalMemory = getTotalMemory()
            val availableProcessors = Runtime.getRuntime().availableProcessors()
            if (availableProcessors < 2 || totalMemory <= 524288) {
                edit.putBoolean("high_quality_textures", false)
            } else {
                edit.putBoolean("high_quality_textures", true)
            }
            val memLimit = if (totalMemory == 0L) 64
                else if (totalMemory <= 262144) 32
                else if (totalMemory <= 524288) 64
                else 128
            edit.putString("texture_memory_limit", memLimit.toString())
            val downloads = when {
                availableProcessors >= 4 && totalMemory > 524288 -> 8
                availableProcessors >= 2 -> 4
                else -> 2
            }
            edit.putString("max_texture_downloads", downloads.toString())
            edit.putBoolean("system_defaults_set", true)
            edit.apply()
        }
        val prevTheme = themeResourceId
        val themeName = Strings.nullToEmpty(sharedPreferences.getString("theme", "light"))
        themeResourceId = when (themeName) {
            "dark" -> R.style.Theme_Lumiya
            "pink" -> R.style.Theme_Lumiya_Pink
            else -> R.style.Theme_Lumiya_Light
        }
        legacyUserNames = sharedPreferences.getBoolean("legacyUserNames", false)
        showTimestamps = sharedPreferences.getBoolean("chatTimestamps", true)
        highQualityTextures = sharedPreferences.getBoolean("high_quality_textures", false)
        compressedTextures = sharedPreferences.getBoolean("compressed_textures", true)
        keepWifiOn = sharedPreferences.getBoolean("keep_wifi_on", true)
        cloudSyncEnabled = sharedPreferences.getBoolean("sync_to_gdrive", false)
        voiceEnabled = sharedPreferences.getBoolean("enableVoice", false)
        var newMaxDownloads = try {
            val v = Integer.parseInt(sharedPreferences.getString("max_texture_downloads", "2"))
            if (v < 1) 1 else v
        } catch (_: Exception) { 2 }
        if (newMaxDownloads != maxTextureDownloads) {
            maxTextureDownloads = newMaxDownloads
            TextureCache.getInstance().setMaxTextureDownloads(maxTextureDownloads)
        }
        terrainTextures = sharedPreferences.getBoolean("terrain_textures", true)
        var memLimit = 64
        try { memLimit = Integer.parseInt(sharedPreferences.getString("texture_memory_limit", "64")) } catch (_: Exception) {}
        try { meshRendering = MeshRendering.valueOf(sharedPreferences.getString("mesh_rendering", "high")!!) } catch (_: Exception) {}
        TextureMemoryTracker.setMemoryLimit(memLimit * 1024 * 1024)
        RLVEnabled = sharedPreferences.getBoolean("rlv_enabled", false)
        autoReconnect = sharedPreferences.getBoolean("auto_reconnect", true)
        try { maxReconnectAttempts = Integer.parseInt(sharedPreferences.getString("reconnect_attempts", "10")) } catch (_: Exception) {}
        updateCacheDir(context, sharedPreferences)
        val hoverText = sharedPreferences.getString("hover_text", "huds") ?: "huds"
        when (hoverText) {
            "all" -> { hoverTextEnableHUDs = true; hoverTextEnableObjects = true }
            "none" -> { hoverTextEnableHUDs = false; hoverTextEnableObjects = false }
            else -> { hoverTextEnableHUDs = true; hoverTextEnableObjects = false }
        }
        advancedRendering = sharedPreferences.getBoolean("advanced_rendering", true)
        useFXAA = sharedPreferences.getBoolean("fxaa_enable", true)
        renderClouds = sharedPreferences.getBoolean("clouds_enable", true)
        val timeOfDay = sharedPreferences.getString("render_time_of_day", "sim") ?: "sim"
        if (timeOfDay.equals("sim", ignoreCase = true)) {
            forceDaylightTime = false
            forceDaylightHour = 0.5f
        } else {
            try {
                forceDaylightTime = true
                forceDaylightHour = timeOfDay.toFloat()
            } catch (_: Exception) {
                forceDaylightTime = false
                forceDaylightHour = 0.5f
            }
        }
        if (prevTheme != themeResourceId) {
            EventBus.getInstance().publish(ThemeChangedEvent(themeResourceId))
        }
    }

    companion object {
        @JvmStatic
        fun getInstance(): GlobalOptions = InstanceHolder.Instance

        private fun getTotalMemory(): Long {
            var totalKb = 0L
            try {
                BufferedReader(FileReader("/proc/meminfo"), 8192).use { reader ->
                    var line = reader.readLine()
                    while (line != null) {
                        if (line.startsWith("MemTotal:")) {
                            val split = line.split("\\s+".toRegex())
                            totalKb = if (split.size >= 2) split[1].toLong() else 0L
                            for (i in split.indices) {
                                Debug.Log("Memory $i:${split[i]}")
                            }
                        }
                        line = reader.readLine()
                    }
                }
            } catch (_: Exception) {
            }
            return totalKb
        }
    }
}
