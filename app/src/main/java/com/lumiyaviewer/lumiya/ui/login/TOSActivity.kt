package com.lumiyaviewer.lumiya.ui.login

import android.graphics.Color
import android.os.Bundle
import android.view.View
import android.webkit.WebView
import com.google.common.io.CharStreams
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity
import java.io.IOException
import java.io.InputStreamReader

class TOSActivity : ThemedActivity(), View.OnClickListener {
    override fun onClick(view: View) {
        when (view.id) {
            R.id.tos_accept_button -> {
                setResult(-1)
                finish()
            }
            R.id.tos_decline_button -> {
                setResult(0)
                finish()
            }
        }
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        setContentView(R.layout.tos)
        findViewById<View>(R.id.tos_accept_button).setOnClickListener(this)
        findViewById<View>(R.id.tos_decline_button).setOnClickListener(this)
        val webView = findViewById<WebView>(R.id.tos_view)
        webView.setBackgroundColor(if (isLightTheme) Color.parseColor("#FFFFFF") else Color.parseColor("#000000"))
        val style = if (isLightTheme) {
            "\tbackground-color: #FFFFFF;\n\tcolor: #000000;\n"
        } else {
            "\tbackground-color: #000000;\n\tcolor: #FFFFFF;\n"
        }
        try {
            val open = assets.open("tos/index.html")
            val html = CharStreams.toString(InputStreamReader(open))
            open.close()
            webView.loadData(html.replace("<!-- STYLES -->", style), "text/html", "UTF-8")
        } catch (e: IOException) {
            Debug.Warning(e)
        }
    }
}
