package com.lumiyaviewer.lumiya.ui.render

import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.util.DisplayMetrics
import android.util.TypedValue
import android.widget.LinearLayout
import android.widget.TextView
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.Iterator
import java.util.LinkedHashMap
import java.util.Map

open class FadingTextViewLog {
    private static long STALE_CHAT_TIMEOUT = 5000
    private LinearLayout chatsOverlayLayout
    private Context context
    private int logBackgroundColor
    private int logTextColor
    private UserManager userManager
    private Handler mHandler = Handler(Looper.getMainLooper())
    private Map<Long, ChatEventOverlay> chatEventOverlays = LinkedHashMap()
    private boolean removeStaleChatsPosted = false
    private Runnable RemoveStaleChatsTask = Runnable() {
        override fun run() {
            FadingTextViewLog.this.removeStaleChatsPosted = false
            if (FadingTextViewLog.this.chatsOverlayLayout != null) {
                long uptimeMillis = SystemClock.uptimeMillis()
                Iterator it = FadingTextViewLog.this.chatEventOverlays.entrySet().iterator()
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next()
                    if (entry != null) {
                        if (uptimeMillis < ((ChatEventOverlay) entry.getValue()).timestamp + FadingTextViewLog.STALE_CHAT_TIMEOUT) {
                            }
                        }
                        TextView textView = ((ChatEventOverlay) entry.getValue()).textView
                        textView.animate().alpha(0.0f).setDuration(1000L).setListener(AnimatorListenerAdapter() {
                            override fun onAnimationEnd(animator: Animator) {
                                FadingTextViewLog.this.chatsOverlayLayout.removeView(textView)
                            }
                        }).start()
                        it.remove()
                    }
                }
            }
            FadingTextViewLog.this.postRemovingStaleChats()
        }
    }

    internal constructor(userManager: UserManager, context: Context, linearLayout: LinearLayout, logTextColor: Int, logBackgroundColor: Int) {
        this.userManager = userManager
        this.context = context
        this.chatsOverlayLayout = linearLayout
        this.logTextColor = logTextColor
        this.logBackgroundColor = logBackgroundColor
    }

    internal fun clearChatEvents() {
        if (this.chatsOverlayLayout != null) {
            this.chatsOverlayLayout.removeAllViews()
        }
        this.chatEventOverlays.clear()
    }

    internal fun handleChatEvent(chatMessageEvent: ActiveChattersManager.ChatMessageEvent) {
        TextView textView = null
        SLChatEvent loadFromDatabaseObject = SLChatEvent.loadFromDatabaseObject(chatMessageEvent.chatMessage, this.userManager.getUserID())
        if (loadFromDatabaseObject != null) {
            CharSequence plainTextMessage = loadFromDatabaseObject.getPlainTextMessage(this.context, this.userManager, false)
            String charSequence = plainTextMessage != null ? plainTextMessage.toString() : null
            if (Strings.isNullOrEmpty(charSequence)) {
                return
            }
            String str = chatMessageEvent.isPrivate ? "[IM] " + charSequence : charSequence
            if (chatMessageEvent.isNewMessage) {
                DisplayMetrics displayMetrics = this.context.getResources().getDisplayMetrics()
                int applyDimension = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, displayMetrics)
                int applyDimension2 = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 5.0f, displayMetrics)
                int applyDimension3 = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, displayMetrics)
                int applyDimension4 = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 5.0f, displayMetrics)
                LinearLayout.LayoutParams layoutParams = LinearLayout.LayoutParams(-2, -2)
                layoutParams.setMargins(applyDimension, applyDimension2, applyDimension, applyDimension2)
                textView = TextView(this.context)
                textView.setBackgroundColor(this.logBackgroundColor)
                textView.setTextColor(this.logTextColor)
                textView.setLayoutParams(layoutParams)
                textView.setPadding(applyDimension3, applyDimension4, applyDimension3, applyDimension4)
                this.chatsOverlayLayout.addView(textView)
                this.chatEventOverlays.put(chatMessageEvent.chatMessage.getId(), ChatEventOverlay(SystemClock.uptimeMillis(), textView))
                postRemovingStaleChats()
            } else {
                ChatEventOverlay chatEventOverlay = this.chatEventOverlays.get(chatMessageEvent.chatMessage.getId())
                if (chatEventOverlay != null) {
                    textView = chatEventOverlay.textView
                }
            }
            if (textView != null) {
                textView.setText(str)
            }
        }
    }

    internal fun postRemovingStaleChats() {
        Map.Entry<Long, ChatEventOverlay> next
        if (this.removeStaleChatsPosted) {
            return
        }
        Iterator<Map.Entry<Long, ChatEventOverlay>> it = this.chatEventOverlays.entrySet().iterator()
        if (!it.hasNext() || (next = it.next()) == null) {
            return
        }
        this.removeStaleChatsPosted = true
        this.mHandler.postAtTime(this.RemoveStaleChatsTask, next.getValue().timestamp + STALE_CHAT_TIMEOUT)
    }
}
