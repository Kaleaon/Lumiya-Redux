package com.lumiyaviewer.lumiya

import com.lumiyaviewer.lumiya.compat.PlatformCompat
import android.app.AlarmManager
import android.app.Application
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.res.AssetManager
import android.util.DisplayMetrics
import android.view.WindowManager
import androidx.core.app.NotificationCompat
import androidx.preference.PreferenceManager
import com.lumiyaviewer.lumiya.ui.login.LoginActivity

class LumiyaApp : Application() {

    override fun onCreate() {
        super.onCreate()
        mContext = this
        GlobalOptions.getInstance().initialize()
    }

    companion object {
        private val displayMetrics = DisplayMetrics()

        @JvmStatic
        var mContext: Context? = null
            private set

        private var prefs: SharedPreferences? = null

        @JvmStatic
        fun getAppVersion(): String {
            return try {
                mContext!!.packageManager.getPackageInfo(mContext!!.packageName, 0).versionName ?: ""
            } catch (_: Exception) {
                ""
            }
        }

        @JvmStatic
        fun getAssetManager(): AssetManager? {
            return mContext?.assets
        }

        @JvmStatic
        fun getContext(): Context {
            return mContext!!
        }

        @JvmStatic
        fun getDefaultSharedPreferences(): SharedPreferences {
            if (prefs == null) {
                prefs = PreferenceManager.getDefaultSharedPreferences(getContext())
            }
            return prefs!!
        }

        @JvmStatic
        fun isSplitScreenNeeded(context: Context): Boolean {
            val pref = getDefaultSharedPreferences().getString("split_screens", "auto") ?: "auto"
            if (pref == "never") return false
            if (pref == "always") return true
            @Suppress("DEPRECATION")
            val defaultDisplay = (context.getSystemService(Context.WINDOW_SERVICE) as WindowManager).defaultDisplay
            if (pref == "landscape") {
                @Suppress("DEPRECATION")
                return defaultDisplay.width > defaultDisplay.height
            }
            defaultDisplay.getMetrics(displayMetrics)
            val yInches = displayMetrics.heightPixels / displayMetrics.ydpi
            val xInches = displayMetrics.widthPixels / displayMetrics.xdpi
            val diag = Math.sqrt((yInches * yInches + xInches * xInches).toDouble())
            if (diag <= 6.5 || xInches < 5.0f) return false
            @Suppress("DEPRECATION")
            val widthDp = defaultDisplay.width / displayMetrics.density
            Debug.Printf(
                "LumiyaApp: Display width in dp: %f, xInches %.1f, diag %.1f",
                widthDp, xInches, diag
            )
            return widthDp >= 1000.0f
        }

        @JvmStatic
        fun restartApp() {
            (getContext().getSystemService(NotificationCompat.CATEGORY_ALARM) as AlarmManager).set(
                1,
                System.currentTimeMillis() + 1000,
                PlatformCompat.getActivity(
                    getContext(), 0,
                    Intent(getContext(), LoginActivity::class.java),
                    PendingIntent.FLAG_CANCEL_CURRENT
                )
            )
            System.exit(0)
        }
    }
}
