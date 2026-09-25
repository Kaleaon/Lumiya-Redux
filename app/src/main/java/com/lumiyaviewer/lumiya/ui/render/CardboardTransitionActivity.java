package com.lumiyaviewer.lumiya.ui.render;

import android.view.WindowManager;
import android.view.Window;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntimeSelector;
import java.util.UUID;

public class CardboardTransitionActivity extends AppCompatActivity {
    private static final int MAX_WAIT_ATTEMPTS = 15;
    private static final long WAIT_INTERVAL = 250;
    private Handler handler = new Handler(Looper.getMainLooper());
    private int waitAttempts = 0;

    public void tryToStartCardboard() {
        if (this.waitAttempts >= 15 || (!TextureMemoryTracker.hasActiveRenderer())) {
            this.handler.postDelayed(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    CardboardTransitionActivity.this.m796x33a6fc46();
                }

                @Override
                public final void run() {
                    $m$0();
                }
            }, WAIT_INTERVAL);
            return;
        }
        Debug.Printf("Cardboard: EGL renderer still active.", new Object[0]);
        this.waitAttempts++;
        this.handler.postDelayed(new Runnable() {
            private final /* synthetic */ void $m$0() {
                CardboardTransitionActivity.this.tryToStartCardboard();
            }

            @Override
            public final void run() {
                $m$0();
            }
        }, WAIT_INTERVAL);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardTransitionActivity_1411, reason: not valid java name */
    /* synthetic */ void m796x33a6fc46() {
        UUID activeAgentID = ActivityUtils.getActiveAgentID(getIntent());
        Intent intent = new Intent();
        intent.setClassName(this, VrIntentContract.ALIAS_VR_ACTIVITY_CLASS);
        intent.putExtra(VrIntentContract.EXTRA_VR_RUNTIME, VrIntentContract.sanitizeRuntime(getIntent().getStringExtra(VrIntentContract.EXTRA_VR_RUNTIME)));
        ActivityUtils.setActiveAgentID(intent, activeAgentID);
        String runtimeId = getIntent().getStringExtra(VrRuntimeSelector.EXTRA_RUNTIME_ID);
        if (runtimeId != null) {
            VrRuntimeSelector.putRuntime(intent, runtimeId);
        }
        intent.addFlags(16777216);
        startActivity(intent);
        finish();
    }

    @Override
    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.cardboard_transition_layout);
    }

    @Override
    protected void onResume() {
        super.onResume();
        tryToStartCardboard();
    }
}
