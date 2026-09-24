package com.lumiyaviewer.lumiya.render.scene;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import androidx.test.core.app.ApplicationProvider;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightDay;
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightPreset;
import java.lang.reflect.Field;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Environment deltas from the bundled Windlight day cycle (assets/windlight). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class RegionEnvironmentTest {
    private static final float EPS = 1e-3f;

    @Before
    public void setUp() throws Exception {
        Field context = LumiyaApp.class.getDeclaredField("mContext");
        context.setAccessible(true);
        context.set(null, ApplicationProvider.getApplicationContext());
    }

    private static SceneDelta.Environment at(float sunHour) {
        WindlightPreset preset = new WindlightPreset();
        new WindlightDay().InterpolatePreset(preset, sunHour);
        return RegionSceneSource.environmentDelta(preset);
    }

    @Test
    public void noonSunIsOverheadAndLights() {
        SceneDelta.Environment noon = at(0.5f);
        assertEquals("sun overhead is +Z", 1f, noon.getSunDirection()[2], EPS);
        assertTrue(noon.getSunColor()[0] + noon.getSunColor()[1] + noon.getSunColor()[2] > 0f);
        float len = 0;
        for (float c : noon.getSunDirection()) {
            len += c * c;
        }
        assertEquals(1f, (float) Math.sqrt(len), EPS);
    }

    @Test
    public void morningSunIsLowAndStillLights() {
        // A-6AM.xml: lightnorm (0, 0.094, 0.996), 0.094 above the horizon.
        SceneDelta.Environment dawn = at(0.25f);
        assertEquals(0.094f, dawn.getSunDirection()[2], EPS);
        assertEquals("within 0.1 of the horizon the legacy renderer turns the sun off", 0f, dawn.getSunColor()[0], 0f);
        SceneDelta.Environment morning = at(0.375f);
        assertTrue(morning.getSunDirection()[2] > 0.1f);
        assertTrue(morning.getSunColor()[0] > 0f);
    }

    @Test
    public void skyColoursComeFromPreset() {
        WindlightPreset preset = new WindlightPreset();
        new WindlightDay().InterpolatePreset(preset, 0.5f);
        SceneDelta.Environment noon = RegionSceneSource.environmentDelta(preset);
        assertEquals(preset.blue_density[2], noon.getZenithColor()[2], 0f);
        assertEquals(preset.blue_horizon[0], noon.getHorizonColor()[0], 0f);
        assertEquals(preset.ambient[1], noon.getAmbientColor()[1], 0f);
    }
}
