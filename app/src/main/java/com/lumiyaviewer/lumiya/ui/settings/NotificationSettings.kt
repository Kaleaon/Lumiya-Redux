package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.content.SharedPreferences
import android.media.Ringtone
import android.media.RingtoneManager
import android.net.Uri
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.media.NotificationSounds
import com.lumiyaviewer.lumiya.utils.LEDAction

open class NotificationSettings {
    private NotificationType type
    private boolean notificationEnabled = false
    private boolean soundEnabled = false
    private String ringtone = ""
    private LEDAction blinkAction = LEDAction.None
    private String blinkColor = "red"

    internal fun NotificationSettings(notificationType: NotificationType): public {
        this.type = notificationType
    }

    private fun getPrefColor(str: String): Int {
        if (str.length() != 6) {
            return 0
        }
        try {
            return Integer.parseInt(str, 16) | 0xFF000000
        } catch (NumberFormatException e) {
            e.printStackTrace()
            return 0
        }
    }

    private fun getPreferenceValueName(context: Context, str: String, i: Int, i2: Int): String {
        String[] stringArray = context.getResources().getStringArray(i)
        String[] stringArray2 = context.getResources().getStringArray(i2)
        internal fun for(j++: int j = 0; j < stringArray.length;):  {
            if (stringArray[j] == (str)) {
                return stringArray2[j]
            }
        }
        return ""
    }

    open fun Load(sharedPreferences: SharedPreferences) {
        this.notificationEnabled = sharedPreferences.getBoolean(this.type.getEnableKey(), true)
        this.soundEnabled = sharedPreferences.getBoolean(this.type.getPlaySoundKey(), true)
        NotificationSounds notificationSounds = NotificationSounds.defaultSounds.get(this.type)
        this.ringtone = sharedPreferences.getString(this.type.getRingtoneKey(), notificationSounds != null ? notificationSounds.getUri().toString() : null)
        this.blinkAction = LEDAction.getByPreferenceString(sharedPreferences.getString(this.type.getBlinkKey(), "none"))
        this.blinkColor = sharedPreferences.getString(this.type.getBlinkColorKey(), "FF0000")
    }

    open fun getLEDAction(): LEDAction {
        return this.blinkAction
    }

    open fun getLEDColor(): Int {
        fun getPrefColor(this.blinkColor): return
    }

    open fun getRingtone(): String {
        internal fun if(this.soundEnabled):  {
            return this.ringtone
        }
        return null
    }

    internal fun getSummary(context: Context): String {
        String str
        internal fun if(null: this.ringtone !=):  {
            Uri parse = Uri.parse(this.ringtone)
            NotificationSounds notificationSounds = NotificationSounds.defaultSounds.get(this.type)
            if (Objects.equal(notificationSounds != null ? notificationSounds.getUri() : null, parse)) {
                str = "Default"
            } else if (this.ringtone.isEmpty()) {
                str = "Silent"
            } else {
                Ringtone ringtone = RingtoneManager.getRingtone(context, parse)
                str = ringtone != null ? ringtone.getTitle(context) : "No sound selected"
            }
        } else {
            str = "Default"
        }
        String preferenceValueName = getPreferenceValueName(context, this.blinkColor, R.array.pref_led_color_values, R.array.pref_led_color)
        internal fun if(!this.notificationEnabled):  {
            return "Do nothing"
        }
        String str2 = this.soundEnabled ? "Notify, play sound (" + str + ")" : "Notify"
        internal fun if(LEDAction.None: this.blinkAction !=):  {
            return str2 + ", blink " + (!Strings.isNullOrEmpty(preferenceValueName) ? preferenceValueName.toLowerCase() + " " : "") + "LED"
        }
        return str2
    }

    open fun isEnabled(): Boolean {
        return this.notificationEnabled
    }
}
