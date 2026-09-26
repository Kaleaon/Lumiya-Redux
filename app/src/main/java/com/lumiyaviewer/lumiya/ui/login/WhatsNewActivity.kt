package com.lumiyaviewer.lumiya.ui.login

import android.os.Bundle
import android.widget.TextView
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity

class WhatsNewActivity : ThemedActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.whats_new)
        findViewById<TextView>(R.id.whatsnewCaption).text =
            String.format(getString(R.string.whatsnew_caption), LumiyaApp.getAppVersion())
        val stringArray = resources.getStringArray(R.array.whatsnew_array)
        findViewById<TextView>(R.id.whatsnewText).text = joinAsBulletList(stringArray)
    }

    companion object {
        /**
         * Joins entries into a bullet list separated by blank lines, matching
         * the original "• entry" formatting. Pure string logic.
         */
        @JvmStatic
        fun joinAsBulletList(entries: Array<String>): String {
            val sb = StringBuilder()
            for (entry in entries) {
                if (sb.isNotEmpty()) {
                    sb.append("\n\n")
                }
                sb.append("• ").append(entry)
            }
            return sb.toString()
        }
    }
}
