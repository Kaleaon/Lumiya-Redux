package com.lumiyaviewer.lumiya.ui.chat.contacts;

import android.graphics.Typeface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import com.lumiyaviewer.lumiya.ui.chat.TypingIndicatorView;
import javax.annotation.Nullable;

public class ChatterItemViewBuilder {
    private float distance;
    private boolean isActiveGroup;
    private boolean isOnline;
    private String label;
    private String lastMessage;
    private ChatterID thumbnailChatterID;
    private int thumbnailDefaultIcon;
    private String thumbnailLabel;
    private int unreadCount;
    private boolean voiceActive;
    private boolean onlineVisible = false;
    private boolean distanceSet = false;

    public ChatterItemViewBuilder() {
        reset();
    }

    @Nullable
    public View getView(LayoutInflater layoutInflater, View view, ViewGroup viewGroup, boolean z) {
        int userDistanceInlineTextView = R.id.userDistanceInlineTextView;
        View view2 = (view == null || view.getId() != R.id.contactListItemLayout) ? null : view;
        View inflate = view2 == null ? layoutInflater.inflate(R.layout.contact_list_item, viewGroup, false) : view2;
        if (inflate != null) {
            ((TextView) inflate.findViewById(R.id.userNameTextView)).setText(this.label);
            View findViewById = inflate.findViewById(R.id.onlineUserIcon);
            if (findViewById != null) {
                if (this.onlineVisible) {
                    findViewById.setVisibility(View.VISIBLE);
                } else {
                    findViewById.setVisibility(View.GONE);
                }
            }
            View viewById = inflate.findViewById(R.id.activeVoiceIcon);
            if (viewById != null) {
                viewById.setVisibility(this.voiceActive ? View.VISIBLE : View.GONE);
            }
            TextView textView = (TextView) inflate.findViewById(z ? R.id.userDistanceInlineTextView : R.id.userDistanceTextView);
            if (textView != null) {
                if (this.distanceSet) {
                    textView.setText((this.distance >= 9.5f ? Integer.toString(Math.round(this.distance)) : String.format("%.1f", Float.valueOf(this.distance))) + " m");
                    if (this.distance <= 20.0f) {
                        textView.setTypeface(textView.getTypeface(), 1);
                    } else {
                        textView.setTypeface(Typeface.create(textView.getTypeface(), 0));
                    }
                    textView.setVisibility(View.VISIBLE);
                } else {
                    textView.setText((CharSequence) null);
                    textView.setVisibility(z ? View.GONE : View.INVISIBLE);
                }
            }
            if (z) {
                userDistanceInlineTextView = R.id.userDistanceTextView;
            }
            View viewById2 = inflate.findViewById(userDistanceInlineTextView);
            if (viewById2 != null) {
                viewById2.setVisibility(View.GONE);
            }
            TextView viewById3 = (TextView) inflate.findViewById(R.id.unreadCountTextView);
            if (viewById3 != null) {
                viewById3.setText(Integer.toString(this.unreadCount));
                if (this.unreadCount != 0) {
                    viewById3.setVisibility(View.VISIBLE);
                } else {
                    viewById3.setVisibility(View.GONE);
                }
            }
            TextView viewById4 = (TextView) inflate.findViewById(R.id.lastMessageText);
            if (viewById4 != null) {
                if (this.lastMessage != null) {
                    viewById4.setText(this.lastMessage);
                    viewById4.setVisibility(View.VISIBLE);
                } else {
                    viewById4.setVisibility(View.GONE);
                }
            }
            View viewById5 = inflate.findViewById(R.id.activeGroupIcon);
            if (viewById5 != null) {
                viewById5.setVisibility(this.isActiveGroup ? View.VISIBLE : View.GONE);
            }
            ChatterPicView chatterPicView = (ChatterPicView) inflate.findViewById(R.id.userPicView);
            if (chatterPicView != null) {
                chatterPicView.setDefaultIcon(this.thumbnailDefaultIcon, false);
                chatterPicView.setChatterID(this.thumbnailChatterID, this.thumbnailLabel);
                chatterPicView.setVisibility((this.thumbnailChatterID == null && this.thumbnailDefaultIcon == -1) ? View.GONE : View.VISIBLE);
            }
            TypingIndicatorView typingIndicatorView = (TypingIndicatorView) inflate.findViewById(R.id.typing_indicator);
            if (typingIndicatorView != null) {
                typingIndicatorView.setChatterID(this.thumbnailChatterID);
            }
        }
        return inflate;
    }

    public void reset() {
        this.label = null;
        this.onlineVisible = false;
        this.distanceSet = false;
        this.unreadCount = 0;
        this.lastMessage = null;
        this.isActiveGroup = false;
        this.thumbnailChatterID = null;
        this.thumbnailLabel = null;
        this.thumbnailDefaultIcon = -1;
        this.voiceActive = false;
    }

    public void setActiveGroup(boolean isActiveGroup) {
        this.isActiveGroup = isActiveGroup;
    }

    public void setDistance(float distance) {
        if (Float.isNaN(distance)) {
            this.distanceSet = false;
        } else {
            this.distanceSet = true;
            this.distance = distance;
        }
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public void setLastMessage(String lastMessage) {
        this.lastMessage = lastMessage;
    }

    public void setOnlineStatusIcon(boolean onlineVisible, boolean isOnline) {
        this.onlineVisible = onlineVisible;
        this.isOnline = isOnline;
    }

    public void setThumbnailChatterID(ChatterID chatterID, String thumbnailLabel) {
        this.thumbnailChatterID = chatterID;
        this.thumbnailLabel = thumbnailLabel;
    }

    public void setThumbnailDefaultIcon(int thumbnailDefaultIcon) {
        this.thumbnailDefaultIcon = thumbnailDefaultIcon;
    }

    public void setUnreadCount(int unreadCount) {
        this.unreadCount = unreadCount;
    }

    public void setVoiceActive(boolean voiceActive) {
        this.voiceActive = voiceActive;
    }
}
