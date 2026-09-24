package com.lumiyaviewer.lumiya.ui.media;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.StreamingMediaService;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;

/* loaded from: classes.dex */
public class StreamingMediaActivity extends AppCompatActivity implements View.OnClickListener {
    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        switch (view.getId()) {
            case com.lumiyaviewer.lumiya.R.id.parcel_media_stop_button:
                Intent intent = new Intent(getIntent());
                intent.setAction("com.lumiyaviewer.lumiya.ACTION_STOP_MEDIA");
                intent.setClass(this, StreamingMediaService.class);
                startService(intent);
                finish();
                break;
        }
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.core.app.SupportActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        ParcelData parcelData;
        super.onCreate(bundle);
        setContentView(com.lumiyaviewer.lumiya.R.layout.streaming_media);
        Intent intent = getIntent();
        if (intent.hasExtra("parcelData") && (parcelData = (ParcelData) intent.getSerializableExtra("parcelData")) != null) {
            ((TextView) findViewById(com.lumiyaviewer.lumiya.R.id.locationNameView)).setText(parcelData.getName());
        }
        findViewById(com.lumiyaviewer.lumiya.R.id.parcel_media_stop_button).setOnClickListener(this);
    }
}
