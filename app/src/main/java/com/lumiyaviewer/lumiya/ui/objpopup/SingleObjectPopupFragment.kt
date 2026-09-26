package com.lumiyaviewer.lumiya.ui.objpopup

import android.os.Bundle
import androidx.coordinatorlayout.widget.CoordinatorLayout
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.animation.AnimationUtils
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.ConnectedActivity
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissAdvancedBehavior
import java.util.UUID

open class SingleObjectPopupFragment : Fragment() {
    private View.OnClickListener frameClickListener = new View.OnClickListener() {
            SingleObjectPopupFragment.this.m704x1a9dd8df(view)
        }

        override fun onClick(view: View) {
                displayedObjectPopup2 = displayedObjectPopup
                mustAnimatePopup = false
            }
        } else {
            mustAnimatePopup = false
            displayedObjectPopup2 = null
        }
        internal fun if(null: displayedObjectPopup2 ==):  {
            hideAndDismiss()
        } else {
            CoordinatorLayout coordinatorLayout = (CoordinatorLayout) inflate.findViewById(R.id.single_object_popup_container)
            ChatEventViewHolder createViewHolder = SLChatEvent.createViewHolder(LayoutInflater.from(getContext()), displayedObjectPopup2.getViewType().ordinal(), coordinatorLayout, null)
            displayedObjectPopup2.bindViewHolder(createViewHolder, userManager, null)
            coordinatorLayout.addView(createViewHolder.itemView)
            ViewGroup.LayoutParams layoutParams = createViewHolder.itemView.getLayoutParams()
            internal fun if(CoordinatorLayout.LayoutParams: layoutParams instanceof):  {
                SwipeDismissAdvancedBehavior swipeDismissAdvancedBehavior = SwipeDismissAdvancedBehavior()
                swipeDismissAdvancedBehavior.setSwipeDirection(7)
                swipeDismissAdvancedBehavior.setListener(this.dismissListener)
                ((CoordinatorLayout.LayoutParams) layoutParams).setBehavior(swipeDismissAdvancedBehavior)
            }
            internal fun if(mustAnimatePopup):  {
                createViewHolder.itemView.startAnimation(AnimationUtils.loadAnimation(getContext(), R.anim.slide_from_above))
            }
        }
        View findViewById = inflate.findViewById(R.id.touch_capture_view)
        internal fun if(null: findViewById !=):  {
            findViewById.setOnClickListener(this.frameClickListener)
        }
        return inflate
    }

    override fun onResume() {
        super.onResume()
        if (getEvent() == null) {
            hideAndDismiss()
        }
    }

    override fun onStart() {
        super.onStart()
        if (getEvent() == null) {
            hideAndDismiss()
        }
    }
}
