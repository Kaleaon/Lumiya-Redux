package com.lumiyaviewer.lumiya.ui.render;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.render.vr.CardboardRuntime;
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntimeSelector;
import java.util.UUID;

/* loaded from: classes.dex */
public class CardboardTransitionActivity extends AppCompatActivity {
    private static final int MAX_WAIT_ATTEMPTS = 15;
    private static final long WAIT_INTERVAL = 250;
    private Handler handler = new Handler();
    private int waitAttempts = 0;

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: tryToStartCardboard, reason: merged with bridge method [inline-methods] */
    public void m795xf8bcab63() {
        if (this.waitAttempts >= 15 || (!TextureMemoryTracker.hasActiveRenderer())) {
            this.handler.postDelayed(new Runnable() { // from class: com.lumiyaviewer.lumiya.ui.render.-$Lambda$4MERJxt3ZMMK7daj1OhYLtxY69Y
                private final /* synthetic */ void $m$0() {
                    ((CardboardTransitionActivity) this).m796x33a6fc46();
                }

                @Override // java.lang.Runnable
                public final void run() {
                    $m$0();
                }
            }, WAIT_INTERVAL);
            return;
        }
        Debug.Printf("Cardboard: EGL renderer still active.", new Object[0]);
        this.waitAttempts++;
        this.handler.postDelayed(new Runnable() { // from class: com.lumiyaviewer.lumiya.ui.render.-$Lambda$4MERJxt3ZMMK7daj1OhYLtxY69Y.1
            private final /* synthetic */ void $m$0() {
                ((CardboardTransitionActivity) this).m795xf8bcab63();
            }

            @Override // java.lang.Runnable
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
        VrRuntimeSelector.putRuntime(intent, runtimeId != null ? runtimeId : CardboardRuntime.ID);
        intent.addFlags(16777216);
        startActivity(intent);
        finish();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.core.app.SupportActivity, android.app.Activity
    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.cardboard_transition_layout);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        m795xf8bcab63();
    }
}
