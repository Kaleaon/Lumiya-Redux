package com.lumiyaviewer.lumiya.ui.common

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.ui.ThemeMapper
import com.lumiyaviewer.lumiya.ui.settings.ThemeChangedEvent

open class ThemedActivity : AppCompatActivity() {
    private var selectedThemeId = -1

    protected val isLightTheme: Boolean
        get() = selectedThemeId != R.style.Theme_Lumiya

    override fun onCreate(savedInstanceState: Bundle?) {
        selectedThemeId = GlobalOptions.getInstance().themeResourceId
        Debug.Printf("Theme: activity theme 0x%x", selectedThemeId)
        val theme = this
        setTheme(if (theme is ThemeMapper) theme.mapThemeResourceId(selectedThemeId) else selectedThemeId)
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        super.onResume()
        val themeResourceId = GlobalOptions.getInstance().themeResourceId
        Debug.Printf("Theme: resume, new activity theme 0x%x", themeResourceId)
        if (selectedThemeId == themeResourceId || selectedThemeId == -1) {
            return
        }
        onThemeChangedEvent(ThemeChangedEvent(themeResourceId))
    }

    override fun onStart() {
        super.onStart()
        EventBus.getInstance().subscribe(this)
    }

    override fun onStop() {
        EventBus.getInstance().unsubscribeActivity(this)
        super.onStop()
    }

    @EventHandler
    open fun onThemeChangedEvent(themeChangedEvent: ThemeChangedEvent) {
        Debug.Printf(
            "Theme: old theme id 0x%x, new theme id 0x%x",
            selectedThemeId,
            themeChangedEvent.themeResourceId
        )
        recreate()
    }
}
