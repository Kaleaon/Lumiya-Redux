package com.lumiyaviewer.lumiya.res;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Application;
import android.content.Context;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import androidx.test.core.app.ApplicationProvider;
import com.lumiyaviewer.lumiya.R;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Inflates every layout the app itself ships, under each app theme.
 *
 * <p>A layout that names a missing view class, or a theme attribute the
 * theme no longer defines, still compiles and only fails when a screen
 * inflates it. The recovered resources carried such layouts (support-library
 * copies naming androidx.appcompat.widget.PreferenceImageView), so this
 * test inflates each one instead of trusting the build.</p>
 *
 * <p>Runs with a plain {@link Application}: LumiyaApp loads native
 * libraries, which Robolectric cannot.</p>
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class LayoutInflationTest {
    private static final int[] THEMES = {
        R.style.Theme_Lumiya,
        R.style.Theme_Lumiya_Light,
        R.style.Theme_Lumiya_Pink,
    };

    /** Layout names from src/main/res/layout*, i.e. the ones this app owns. */
    private static List<String> appLayoutNames() {
        File res = new File("src/main/res");
        if (!res.isDirectory()) {
            res = new File("app/src/main/res");
        }
        TreeSet<String> names = new TreeSet<>();
        File[] dirs = res.listFiles((dir, name) -> name.equals("layout") || name.startsWith("layout-"));
        assertTrue("no layout directories under " + res.getAbsolutePath(), dirs != null && dirs.length > 0);
        for (File dir : dirs) {
            File[] files = dir.listFiles((d, name) -> name.endsWith(".xml"));
            if (files != null) {
                for (File file : files) {
                    names.add(file.getName().substring(0, file.getName().length() - 4));
                }
            }
        }
        return new ArrayList<>(names);
    }

    @Test
    public void everyAppLayoutInflates() throws Exception {
        Context app = ApplicationProvider.getApplicationContext();
        List<String> failures = new ArrayList<>();
        List<String> names = appLayoutNames();
        for (int theme : THEMES) {
            Context themed = new ContextThemeWrapper(app, theme);
            LayoutInflater inflater = LayoutInflater.from(themed);
            for (String name : names) {
                int id = R.layout.class.getField(name).getInt(null);
                try {
                    // A root lets <merge> layouts inflate too.
                    inflater.inflate(id, new FrameLayout(themed), true);
                } catch (Throwable t) {
                    failures.add(app.getResources().getResourceEntryName(theme) + " / " + name + ": " + rootCause(t));
                }
            }
        }
        if (!failures.isEmpty()) {
            fail(failures.size() + " layout inflations failed:\n" + String.join("\n", failures));
        }
    }

    private static String rootCause(Throwable t) {
        Throwable cause = t;
        while (cause.getCause() != null && cause.getCause() != cause) {
            cause = cause.getCause();
        }
        String message = cause.toString();
        if (message.length() > 300) {
            message = message.substring(0, 300);
        }
        return message;
    }
}
