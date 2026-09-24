package com.lumiyaviewer.lumiya.ui.voice;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import androidx.core.content.ContextCompat;
import androidx.cardview.widget.CardView;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GridConnectionService;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.render.OnHoverListenerCompat;
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceAudioProperties;
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceSetAudioProperties;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceAudioDevice;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceBluetoothState;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo;
import com.lumiyaviewer.lumiya.voiceintf.VoicePluginServiceConnection;
import javax.annotation.Nullable;

public class VoiceStatusView extends FrameLayout {

    @Nullable
    private ChatterID activeChatterID;

    @Nullable
    private ChatterNameRetriever activeChatterNameRetriever;
    private boolean canConnect;

    @Nullable
    private ChatterID chatterID;
    private boolean hoverEnabled;
    private final ChatterNameRetriever.OnChatterNameUpdated onActiveSpeakerNameUpdated;
    private View.OnClickListener onCallButtonListener;
    private boolean showActiveChatterName;
    private boolean showWhenInactive;

    @Nullable
    private ChatterNameRetriever speakerNameRetriever;
    private boolean updatingAudioVolume;

    ImageButton voiceAnswerButton;
    private final SubscriptionData<SubscriptionSingleKey, VoiceAudioProperties> voiceAudioProperties;

    Button voiceBluetoothButton;
    private final SubscriptionData<ChatterID, VoiceChatInfo> voiceChatInfo;

    Button voiceLoudspeakerButton;

    ImageButton voiceMicOffButton;

    ImageButton voiceMicOnButton;

    ImageView voiceSpeakIndicatorLeft;

    ImageView voiceSpeakIndicatorRight;

    SeekBar voiceSpeakerVolumeControl;

    CardView voiceStatusCardView;

    ViewGroup voiceStatusControls;

    TextView voiceStatusSmallText;

    TextView voiceStatusText;

    ImageButton voiceTerminateButton;
    private final SeekBar.OnSeekBarChangeListener volumeChangeListener;

    public VoiceStatusView(Context context) {
        super(context);
        this.voiceAudioProperties = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceAudioProperties((VoiceAudioProperties) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.voiceChatInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceChatInfo((VoiceChatInfo) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.speakerNameRetriever = null;
        this.activeChatterNameRetriever = null;
        this.activeChatterID = null;
        this.showActiveChatterName = false;
        this.showWhenInactive = false;
        this.canConnect = false;
        this.hoverEnabled = false;
        this.onCallButtonListener = null;
        this.updatingAudioVolume = false;
        this.volumeChangeListener = new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                VoicePluginServiceConnection voicePluginServiceConnection;
                if (z && (!VoiceStatusView.this.updatingAudioVolume)) {
                    float max = i / seekBar.getMax();
                    GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
                    if (serviceInstance == null || (voicePluginServiceConnection = serviceInstance.getVoicePluginServiceConnection()) == null) {
                        return;
                    }
                    voicePluginServiceConnection.setVoiceAudioProperties(new VoiceSetAudioProperties(max, true, null));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        };
        this.onActiveSpeakerNameUpdated = new ChatterNameRetriever.OnChatterNameUpdated() {
            private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                VoiceStatusView.this.m879lambda$com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_24065(chatterNameRetriever);
            }

            @Override
            public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                $m$0(chatterNameRetriever);
            }
        };
        LayoutInflater.from(context).inflate(R.layout.voice_status, (ViewGroup) this, true);
        initializeControls();
    }

    public VoiceStatusView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.voiceAudioProperties = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceAudioProperties((VoiceAudioProperties) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.voiceChatInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceChatInfo((VoiceChatInfo) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.speakerNameRetriever = null;
        this.activeChatterNameRetriever = null;
        this.activeChatterID = null;
        this.showActiveChatterName = false;
        this.showWhenInactive = false;
        this.canConnect = false;
        this.hoverEnabled = false;
        this.onCallButtonListener = null;
        this.updatingAudioVolume = false;
        this.volumeChangeListener = new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                VoicePluginServiceConnection voicePluginServiceConnection;
                if (z && (!VoiceStatusView.this.updatingAudioVolume)) {
                    float max = i / seekBar.getMax();
                    GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
                    if (serviceInstance == null || (voicePluginServiceConnection = serviceInstance.getVoicePluginServiceConnection()) == null) {
                        return;
                    }
                    voicePluginServiceConnection.setVoiceAudioProperties(new VoiceSetAudioProperties(max, true, null));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        };
        this.onActiveSpeakerNameUpdated = new ChatterNameRetriever.OnChatterNameUpdated() {
            private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                VoiceStatusView.this.m879lambda$com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_24065(chatterNameRetriever);
            }

            @Override
            public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                $m$0(chatterNameRetriever);
            }
        };
        LayoutInflater.from(context).inflate(R.layout.voice_status, (ViewGroup) this, true);
        initializeControls();
    }

    public VoiceStatusView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.voiceAudioProperties = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceAudioProperties((VoiceAudioProperties) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.voiceChatInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceChatInfo((VoiceChatInfo) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.speakerNameRetriever = null;
        this.activeChatterNameRetriever = null;
        this.activeChatterID = null;
        this.showActiveChatterName = false;
        this.showWhenInactive = false;
        this.canConnect = false;
        this.hoverEnabled = false;
        this.onCallButtonListener = null;
        this.updatingAudioVolume = false;
        this.volumeChangeListener = new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i2, boolean z) {
                VoicePluginServiceConnection voicePluginServiceConnection;
                if (z && (!VoiceStatusView.this.updatingAudioVolume)) {
                    float max = i2 / seekBar.getMax();
                    GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
                    if (serviceInstance == null || (voicePluginServiceConnection = serviceInstance.getVoicePluginServiceConnection()) == null) {
                        return;
                    }
                    voicePluginServiceConnection.setVoiceAudioProperties(new VoiceSetAudioProperties(max, true, null));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        };
        this.onActiveSpeakerNameUpdated = new ChatterNameRetriever.OnChatterNameUpdated() {
            private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                VoiceStatusView.this.m879lambda$com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_24065(chatterNameRetriever);
            }

            @Override
            public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                $m$0(chatterNameRetriever);
            }
        };
        LayoutInflater.from(context).inflate(R.layout.voice_status, (ViewGroup) this, true);
        initializeControls();
    }

    @TargetApi(21)
    public VoiceStatusView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.voiceAudioProperties = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceAudioProperties((VoiceAudioProperties) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.voiceChatInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                VoiceStatusView.this.onVoiceChatInfo((VoiceChatInfo) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.speakerNameRetriever = null;
        this.activeChatterNameRetriever = null;
        this.activeChatterID = null;
        this.showActiveChatterName = false;
        this.showWhenInactive = false;
        this.canConnect = false;
        this.hoverEnabled = false;
        this.onCallButtonListener = null;
        this.updatingAudioVolume = false;
        this.volumeChangeListener = new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i22, boolean z) {
                VoicePluginServiceConnection voicePluginServiceConnection;
                if (z && (!VoiceStatusView.this.updatingAudioVolume)) {
                    float max = i22 / seekBar.getMax();
                    GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
                    if (serviceInstance == null || (voicePluginServiceConnection = serviceInstance.getVoicePluginServiceConnection()) == null) {
                        return;
                    }
                    voicePluginServiceConnection.setVoiceAudioProperties(new VoiceSetAudioProperties(max, true, null));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        };
        this.onActiveSpeakerNameUpdated = new ChatterNameRetriever.OnChatterNameUpdated() {
            private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                VoiceStatusView.this.m879lambda$com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_24065(chatterNameRetriever);
            }

            @Override
            public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                $m$0(chatterNameRetriever);
            }
        };
        LayoutInflater.from(context).inflate(R.layout.voice_status, (ViewGroup) this, true);
        initializeControls();
    }

    private void initializeControls() {
        new VoiceStatusView_ViewBinding(this);
        updateVoiceState();
        this.voiceSpeakerVolumeControl.setOnSeekBarChangeListener(this.volumeChangeListener);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_6407, reason: not valid java name */
    static /* synthetic */ boolean m876lambda$com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_6407(OnHoverListenerCompat onHoverListenerCompat, View view, MotionEvent motionEvent) {
        if (!(view instanceof ImageButton)) {
            return false;
        }
        switch (motionEvent.getActionMasked()) {
            case 9:
                onHoverListenerCompat.onHoverEnter(view);
                break;
            case 10:
                onHoverListenerCompat.onHoverExit(view);
                break;
        }
        return false;
    }

    public void onVoiceAudioProperties(VoiceAudioProperties voiceAudioProperties) {
        Object[] objArr = new Object[1];
        objArr[0] = voiceAudioProperties != null ? voiceAudioProperties.bluetoothState : null;
        Debug.Printf("Voice: voice audio properties updated, bluetooth state %s", objArr);
        updateVoiceState();
    }

    public void onVoiceChatInfo(VoiceChatInfo voiceChatInfo) {
        updateVoiceState();
    }

    private void updateVoiceState() {
        ChatterID.ChatterIDUser chatterIDUser;
        int i;
        String str;
        ChatterID.ChatterIDUser chatterIDUser2;
        VoiceChatInfo data = this.voiceChatInfo.getData();
        Debug.Printf("VoiceStatusView: voice state %s", data);
        if (data == null || !(!data.state.equals(VoiceChatInfo.VoiceChatState.None))) {
            this.voiceStatusControls.setVisibility(View.GONE);
            if (this.showWhenInactive) {
                setVisibility(View.VISIBLE);
                this.voiceStatusText.setText(R.string.voice_not_connected);
                if (this.canConnect) {
                    this.voiceStatusSmallText.setText(R.string.voice_tap_to_connect);
                    this.voiceStatusSmallText.setVisibility(View.VISIBLE);
                } else {
                    this.voiceStatusSmallText.setVisibility(View.GONE);
                }
                this.voiceSpeakIndicatorLeft.setVisibility(View.INVISIBLE);
                this.voiceSpeakIndicatorRight.setVisibility(View.INVISIBLE);
                this.voiceTerminateButton.setVisibility(View.INVISIBLE);
                this.voiceMicOnButton.setVisibility(View.INVISIBLE);
                this.voiceMicOffButton.setVisibility(View.INVISIBLE);
                this.voiceAnswerButton.setVisibility(this.canConnect ? View.VISIBLE : View.INVISIBLE);
            } else {
                setVisibility(View.GONE);
            }
            chatterIDUser = null;
        } else {
            setVisibility(View.VISIBLE);
            this.voiceTerminateButton.setVisibility(View.VISIBLE);
            boolean z = data.state == VoiceChatInfo.VoiceChatState.Active;
            this.voiceMicOnButton.setVisibility((z && data.localMicActive) ? View.VISIBLE : View.INVISIBLE);
            this.voiceMicOffButton.setVisibility((z && (data.localMicActive ^ true)) ? View.VISIBLE : View.INVISIBLE);
            this.voiceAnswerButton.setVisibility(data.state == VoiceChatInfo.VoiceChatState.Ringing ? View.VISIBLE : View.INVISIBLE);
            if (data.state == VoiceChatInfo.VoiceChatState.Active && data.numActiveSpeakers != 0) {
                if (this.voiceSpeakIndicatorLeft.getVisibility() != 0 || this.voiceSpeakIndicatorRight.getVisibility() != 0) {
                    this.voiceSpeakIndicatorLeft.setVisibility(View.VISIBLE);
                    this.voiceSpeakIndicatorRight.setVisibility(View.VISIBLE);
                    Drawable drawable = this.voiceSpeakIndicatorLeft.getDrawable();
                    if (drawable instanceof AnimationDrawable) {
                        ((AnimationDrawable) drawable).start();
                    }
                    Drawable drawable2 = this.voiceSpeakIndicatorRight.getDrawable();
                    if (drawable2 instanceof AnimationDrawable) {
                        ((AnimationDrawable) drawable2).start();
                    }
                }
                if (data.numActiveSpeakers != 1 || data.activeSpeakerID == null || this.chatterID == null) {
                    str = null;
                    chatterIDUser2 = null;
                } else {
                    chatterIDUser2 = ChatterID.getUserChatterID(this.chatterID.agentUUID, data.activeSpeakerID);
                    str = this.speakerNameRetriever != null ? Objects.equal(chatterIDUser2, this.speakerNameRetriever.chatterID) ? this.speakerNameRetriever.getResolvedName() : null : null;
                }
                Debug.Printf("Voice: numActiveSpeakers %d, speakerName %s, activeChatterID %s (view chatterID %s)", Integer.valueOf(data.numActiveSpeakers), str, chatterIDUser2, this.chatterID);
                Object[] objArr = new Object[2];
                objArr[0] = this.speakerNameRetriever;
                objArr[1] = this.speakerNameRetriever != null ? this.speakerNameRetriever.chatterID : null;
                Debug.Printf("Voice: speakerNameRetriever %s, snr.chatterID %s", objArr);
                if (str == null) {
                    str = data.numActiveSpeakers != 1 ? getContext().getString(R.string.speakers_speaking, Integer.valueOf(data.numActiveSpeakers)) : null;
                }
            } else if (data.state == VoiceChatInfo.VoiceChatState.Ringing) {
                this.voiceSpeakIndicatorLeft.setVisibility(View.VISIBLE);
                this.voiceSpeakIndicatorRight.setVisibility(View.VISIBLE);
                str = null;
                chatterIDUser2 = null;
            } else {
                this.voiceSpeakIndicatorLeft.setVisibility(View.INVISIBLE);
                this.voiceSpeakIndicatorRight.setVisibility(View.INVISIBLE);
                str = null;
                chatterIDUser2 = null;
            }
            if (str == null) {
                switch (data.state) {
                    case Active:
                        if (!data.localMicActive) {
                            str = getContext().getString(R.string.voice_status_tap_mic);
                            break;
                        } else {
                            str = getContext().getString(R.string.voice_status_speak_now);
                            break;
                        }
                    case Connecting:
                        str = getContext().getString(R.string.voice_status_connecting);
                        break;
                    case Ringing:
                        str = getContext().getString(R.string.voice_status_ringing);
                        break;
                }
            }
            String resolvedName = this.showActiveChatterName ? this.activeChatterNameRetriever != null ? this.activeChatterNameRetriever.getResolvedName() : null : null;
            if (resolvedName != null) {
                this.voiceStatusSmallText.setVisibility(View.VISIBLE);
                this.voiceStatusText.setText(resolvedName);
                this.voiceStatusSmallText.setText(str);
                chatterIDUser = chatterIDUser2;
            } else {
                this.voiceStatusSmallText.setText((CharSequence) null);
                this.voiceStatusText.setText(str);
                this.voiceStatusSmallText.setVisibility(View.GONE);
                if (data.state != VoiceChatInfo.VoiceChatState.Active) {
                    chatterIDUser = chatterIDUser2;
                } else if (data.localMicActive) {
                    this.voiceStatusSmallText.setText(R.string.tap_for_audio_controls);
                    this.voiceStatusSmallText.setVisibility(View.VISIBLE);
                    chatterIDUser = chatterIDUser2;
                } else {
                    chatterIDUser = chatterIDUser2;
                }
            }
        }
        if (!Objects.equal(this.activeChatterID, chatterIDUser)) {
            Debug.Printf("Voice: new activeChatterID %s", chatterIDUser);
            this.activeChatterID = chatterIDUser;
            if (chatterIDUser != null) {
                if (this.speakerNameRetriever == null || (!Objects.equal(this.speakerNameRetriever.chatterID, chatterIDUser))) {
                    if (this.speakerNameRetriever != null) {
                        this.speakerNameRetriever.dispose();
                    }
                    this.speakerNameRetriever = new ChatterNameRetriever(chatterIDUser, this.onActiveSpeakerNameUpdated, UIThreadExecutor.getInstance(), false);
                    this.speakerNameRetriever.subscribe();
                }
            } else if (this.speakerNameRetriever != null) {
                this.speakerNameRetriever.dispose();
                this.speakerNameRetriever = null;
            }
        }
        VoiceAudioProperties voiceAudioProperties = this.voiceAudioProperties.getData();
        if (voiceAudioProperties != null) {
            Drawable[] compoundDrawables = this.voiceBluetoothButton.getCompoundDrawables();
            switch (voiceAudioProperties.bluetoothState) {
                case Active:
                    i = R.drawable.active_button_underline;
                    break;
                case Connecting:
                    i = R.drawable.yellow_button_underline;
                    break;
                default:
                    i = R.drawable.inactive_button_underline;
                    break;
            }
            this.voiceBluetoothButton.setCompoundDrawablesWithIntrinsicBounds(compoundDrawables[0], (Drawable) null, (Drawable) null, ContextCompat.getDrawable(getContext(), i));
            this.voiceLoudspeakerButton.setCompoundDrawablesWithIntrinsicBounds(this.voiceLoudspeakerButton.getCompoundDrawables()[0], (Drawable) null, (Drawable) null, ContextCompat.getDrawable(getContext(), voiceAudioProperties.speakerphoneOn ? R.drawable.active_button_underline : R.drawable.inactive_button_underline));
            this.updatingAudioVolume = true;
            this.voiceSpeakerVolumeControl.setProgress(Math.round(voiceAudioProperties.speakerVolume * this.voiceSpeakerVolumeControl.getMax()));
            this.updatingAudioVolume = false;
        }
    }

    public void disableMic() {
        VoiceChatInfo data;
        GridConnectionService serviceInstance;
        if (this.chatterID == null || (data = this.voiceChatInfo.getData()) == null || data.state != VoiceChatInfo.VoiceChatState.Active || (serviceInstance = GridConnectionService.getServiceInstance()) == null) {
            return;
        }
        serviceInstance.enableVoiceMic(false);
    }

    public void enableHover(final OnHoverListenerCompat onHoverListenerCompat) {
        this.hoverEnabled = true;
        View.OnHoverListener onHoverListener = new View.OnHoverListener() {
            private final /* synthetic */ boolean $m$0(View view, MotionEvent motionEvent) {
                return VoiceStatusView.m876lambda$com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_6407((OnHoverListenerCompat) onHoverListenerCompat, view, motionEvent);
            }

            @Override
            public final boolean onHover(View view, MotionEvent motionEvent) {
                return $m$0(view, motionEvent);
            }
        };
        int applyDimension = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 14.0f, getResources().getDisplayMetrics());
        TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(new int[]{R.attr.buttonShapeMoveControl});
        for (ImageButton imageButton : new ImageButton[]{this.voiceAnswerButton, this.voiceTerminateButton, this.voiceMicOnButton, this.voiceMicOffButton}) {
            imageButton.setOnHoverListener(onHoverListener);
            if (imageButton == this.voiceMicOnButton) {
                imageButton.setBackground(getContext().getDrawable(R.drawable.fab_shape_move_control_green));
            } else {
                imageButton.setBackground(obtainStyledAttributes.getDrawable(0));
            }
            imageButton.setPadding(applyDimension, applyDimension, applyDimension, applyDimension);
            imageButton.setAlpha(0.5f);
        }
        obtainStyledAttributes.recycle();
    }

    public void hideBackground() {
        this.voiceStatusCardView.setCardBackgroundColor(0);
        this.voiceStatusCardView.setCardElevation(0.0f);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_24065, reason: not valid java name */
    /* synthetic */ void m879lambda$com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_24065(ChatterNameRetriever chatterNameRetriever) {
        Debug.Printf("Voice: chatter name updated: %s", chatterNameRetriever.getResolvedName());
        updateVoiceState();
    }

    public void onLoudspeakerButton() {
        VoicePluginServiceConnection voicePluginServiceConnection;
        VoiceAudioProperties data = this.voiceAudioProperties.getData();
        GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
        if (serviceInstance == null || (voicePluginServiceConnection = serviceInstance.getVoicePluginServiceConnection()) == null || data == null) {
            return;
        }
        voicePluginServiceConnection.setVoiceAudioProperties(new VoiceSetAudioProperties(0.0f, false, data.speakerphoneOn ? VoiceAudioDevice.Default : VoiceAudioDevice.Loudspeaker));
    }

    public void onVoiceAnswerButton() {
        GridConnectionService serviceInstance;
        VoiceChatInfo data = this.voiceChatInfo.getData();
        if (this.onCallButtonListener != null && (this.chatterID == null || data == null || data.state == VoiceChatInfo.VoiceChatState.None)) {
            this.onCallButtonListener.onClick(this.voiceAnswerButton);
        }
        if (this.chatterID == null || (serviceInstance = GridConnectionService.getServiceInstance()) == null) {
            return;
        }
        serviceInstance.acceptVoiceCall(this.chatterID);
    }

    public void onVoiceBluetoothButton() {
        VoicePluginServiceConnection voicePluginServiceConnection;
        VoiceAudioProperties data = this.voiceAudioProperties.getData();
        GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
        if (serviceInstance == null || (voicePluginServiceConnection = serviceInstance.getVoicePluginServiceConnection()) == null || data == null) {
            return;
        }
        voicePluginServiceConnection.setVoiceAudioProperties(new VoiceSetAudioProperties(0.0f, false, data.bluetoothState == VoiceBluetoothState.Active ? VoiceAudioDevice.Default : VoiceAudioDevice.Bluetooth));
    }

    public void onVoiceMicOffButton() {
        GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
        if (serviceInstance != null) {
            serviceInstance.enableVoiceMic(true);
        }
    }

    public void onVoiceMicOnButton() {
        GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
        if (serviceInstance != null) {
            serviceInstance.enableVoiceMic(false);
        }
    }

    public void onVoiceStatusCardClick() {
        if (this.voiceStatusControls != null) {
            if (this.voiceStatusControls.getVisibility() == 0) {
                this.voiceStatusControls.setVisibility(View.GONE);
                return;
            }
            this.voiceStatusControls.setVisibility(View.VISIBLE);
            this.voiceStatusControls.startAnimation(AnimationUtils.loadAnimation(getContext(), R.anim.expand_vertically));
        }
    }

    public void onVoiceTerminateButton() {
        GridConnectionService serviceInstance;
        if (this.chatterID == null || (serviceInstance = GridConnectionService.getServiceInstance()) == null) {
            return;
        }
        serviceInstance.terminateVoiceCall(this.chatterID);
    }

    public void setCanConnect(boolean canConnect) {
        this.canConnect = canConnect;
        updateVoiceState();
    }

    public void setChatterID(@Nullable ChatterID chatterID) {
        this.chatterID = chatterID;
        if (chatterID != null) {
            UserManager userManager = chatterID.getUserManager();
            if (userManager != null) {
                this.voiceAudioProperties.subscribe(userManager.getVoiceAudioProperties(), SubscriptionSingleKey.Value);
                this.voiceChatInfo.subscribe(userManager.getVoiceChatInfo(), chatterID);
                if (this.activeChatterNameRetriever != null && (!Objects.equal(this.activeChatterNameRetriever.chatterID, chatterID))) {
                    this.activeChatterNameRetriever.dispose();
                    this.activeChatterNameRetriever = null;
                }
                if (this.showActiveChatterName) {
                    this.activeChatterNameRetriever = new ChatterNameRetriever(chatterID, this.onActiveSpeakerNameUpdated, UIThreadExecutor.getInstance(), false);
                    this.activeChatterNameRetriever.subscribe();
                }
            }
        } else {
            this.voiceAudioProperties.unsubscribe();
            this.voiceChatInfo.unsubscribe();
            if (this.speakerNameRetriever != null) {
                this.speakerNameRetriever.dispose();
                this.speakerNameRetriever = null;
            }
            if (this.activeChatterNameRetriever != null) {
                this.activeChatterNameRetriever.dispose();
                this.activeChatterNameRetriever = null;
            }
            GridConnectionService serviceInstance = GridConnectionService.getServiceInstance();
            if (serviceInstance != null) {
                serviceInstance.enableVoiceMic(false);
            }
        }
        updateVoiceState();
    }

    public void setLightTheme() {
        this.voiceStatusText.setTextColor(-1);
        this.voiceStatusSmallText.setTextColor(-1);
        this.voiceAnswerButton.setImageResource(R.drawable.icon_material_voice_call);
        this.voiceMicOnButton.setImageResource(R.drawable.icon_material_mic);
        this.voiceMicOffButton.setImageResource(R.drawable.icon_material_mic_off);
        this.voiceTerminateButton.setImageResource(R.drawable.menu_close_light);
    }

    public void setOnCallButtonListener(View.OnClickListener onClickListener) {
        this.onCallButtonListener = onClickListener;
    }

    public void setShowActiveChatterName(boolean showActiveChatterName) {
        this.showActiveChatterName = showActiveChatterName;
        updateVoiceState();
    }

    public void setShowWhenInactive(boolean showWhenInactive) {
        this.showWhenInactive = showWhenInactive;
        updateVoiceState();
    }
}
