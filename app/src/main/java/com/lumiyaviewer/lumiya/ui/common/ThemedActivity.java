package com.lumiyaviewer.lumiya.ui.common;

import android.app.Activity;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.eventbus.EventBus;
import com.lumiyaviewer.lumiya.eventbus.EventHandler;
import com.lumiyaviewer.lumiya.ui.ThemeMapper;
import com.lumiyaviewer.lumiya.ui.settings.ThemeChangedEvent;

public class ThemedActivity extends AppCompatActivity {
    private int selectedThemeId = -1;

    protected boolean isLightTheme() {
        return this.selectedThemeId != com.lumiyaviewer.lumiya.R.style.Theme_Lumiya;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override
    protected void onCreate(@Nullable Bundle bundle) {
        this.selectedThemeId = GlobalOptions.getInstance().getThemeResourceId();
        Debug.Printf("Theme: activity theme 0x%x", Integer.valueOf(this.selectedThemeId));
        int selectedThemeId = this.selectedThemeId;
        setTheme(this instanceof ThemeMapper ? ((ThemeMapper) this).mapThemeResourceId(selectedThemeId) : selectedThemeId);
        super.onCreate(bundle);
    }

    @Override
    protected void onResume() {
        super.onResume();
        int themeResourceId = GlobalOptions.getInstance().getThemeResourceId();
        Debug.Printf("Theme: resume, new activity theme 0x%x", Integer.valueOf(themeResourceId));
        if (this.selectedThemeId == themeResourceId || this.selectedThemeId == -1) {
            return;
        }
        onThemeChangedEvent(new ThemeChangedEvent(themeResourceId));
    }

    @Override
    protected void onStart() {
        super.onStart();
        EventBus.getInstance().subscribe((Activity) this);
    }

    @Override
    protected void onStop() {
        EventBus.getInstance().unsubscribeActivity(this);
        super.onStop();
    }

    @EventHandler
    public void onThemeChangedEvent(ThemeChangedEvent themeChangedEvent) {
        Debug.Printf("Theme: old theme id 0x%x, new theme id 0x%x", Integer.valueOf(this.selectedThemeId), Integer.valueOf(themeChangedEvent.themeResourceId));
        recreate();
    }
}
