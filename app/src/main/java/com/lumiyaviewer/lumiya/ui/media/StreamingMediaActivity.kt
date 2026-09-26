package com.lumiyaviewer.lumiya.ui.media

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import android.view.View
import android.widget.TextView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.StreamingMediaService
import com.lumiyaviewer.lumiya.slproto.users.ParcelData

class StreamingMediaActivity : AppCompatActivity(), View.OnClickListener {
    override fun onClick(view: View) {
        when (view.id) {
            R.id.parcel_media_stop_button -> {
                val intent = Intent(getIntent())
                intent.action = "com.lumiyaviewer.lumiya.ACTION_STOP_MEDIA"
                intent.setClass(this, StreamingMediaService::class.java)
                startService(intent)
                finish()
            }
        }
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        setContentView(R.layout.streaming_media)
        val intent = intent
        if (intent.hasExtra("parcelData")) {
            val parcelData = intent.getSerializableExtra("parcelData") as? ParcelData
            if (parcelData != null) {
                findViewById<TextView>(R.id.locationNameView).text = parcelData.name
            }
        }
        findViewById<View>(R.id.parcel_media_stop_button).setOnClickListener(this)
    }
}
