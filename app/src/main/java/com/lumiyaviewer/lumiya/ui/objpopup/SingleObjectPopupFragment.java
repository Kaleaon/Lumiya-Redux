package com.lumiyaviewer.lumiya.ui.objpopup;

import android.os.Bundle;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.ConnectedActivity;
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissAdvancedBehavior;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class SingleObjectPopupFragment extends Fragment {
    private final View.OnClickListener frameClickListener = new View.OnClickListener() {
        private final /* synthetic */ void $m$0(View view) {
            SingleObjectPopupFragment.this.m704x1a9dd8df(view);
        }

        @Override
        public final void onClick(View view) {
            $m$0(view);
        }
    };
    private final SwipeDismissAdvancedBehavior.OnDismissListener dismissListener = new SwipeDismissAdvancedBehavior.OnDismissListener() {
        @Override
        public void onDismiss(View view) {
            SingleObjectPopupFragment.this.hideAndDismiss();
        }

        @Override
        public void onDragStateChanged(int i) {
        }
    };

    public static SingleObjectPopupFragment create(@Nonnull UUID uuid) {
        SingleObjectPopupFragment singleObjectPopupFragment = new SingleObjectPopupFragment();
        singleObjectPopupFragment.setArguments(ActivityUtils.makeFragmentArguments(uuid, null));
        return singleObjectPopupFragment;
    }

    @Nullable
    private SLChatEvent getEvent() {
        UserManager userManager = getUserManager();
        if (userManager != null) {
            return userManager.getObjectPopupsManager().getDisplayedObjectPopup();
        }
        return null;
    }

    @Nullable
    private UserManager getUserManager() {
        return ActivityUtils.getUserManager(getArguments());
    }

    public void hideAndDismiss() {
        FragmentActivity activity = getActivity();
        if (activity instanceof ConnectedActivity) {
            ((ConnectedActivity) activity).dismissSingleObjectPopup();
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_objpopup_SingleObjectPopupFragment_4170, reason: not valid java name */
    /* synthetic */ void m704x1a9dd8df(View view) {
        hideAndDismiss();
    }

    @Override
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        boolean mustAnimatePopup;
        SLChatEvent displayedObjectPopup2;
        View inflate = layoutInflater.inflate(R.layout.object_popups_single_fragment_layout, viewGroup, false);
        UserManager userManager = getUserManager();
        if (userManager != null) {
            SLChatEvent displayedObjectPopup = userManager.getObjectPopupsManager().getDisplayedObjectPopup();
            if (displayedObjectPopup != null) {
                displayedObjectPopup2 = displayedObjectPopup;
                mustAnimatePopup = userManager.getObjectPopupsManager().mustAnimatePopup(displayedObjectPopup);
            } else {
                displayedObjectPopup2 = displayedObjectPopup;
                mustAnimatePopup = false;
            }
        } else {
            mustAnimatePopup = false;
            displayedObjectPopup2 = null;
        }
        if (displayedObjectPopup2 == null) {
            hideAndDismiss();
        } else {
            CoordinatorLayout coordinatorLayout = (CoordinatorLayout) inflate.findViewById(R.id.single_object_popup_container);
            ChatEventViewHolder createViewHolder = SLChatEvent.createViewHolder(LayoutInflater.from(getContext()), displayedObjectPopup2.getViewType().ordinal(), coordinatorLayout, null);
            displayedObjectPopup2.bindViewHolder(createViewHolder, userManager, null);
            coordinatorLayout.addView(createViewHolder.itemView);
            ViewGroup.LayoutParams layoutParams = createViewHolder.itemView.getLayoutParams();
            if (layoutParams instanceof CoordinatorLayout.LayoutParams) {
                SwipeDismissAdvancedBehavior swipeDismissAdvancedBehavior = new SwipeDismissAdvancedBehavior();
                swipeDismissAdvancedBehavior.setSwipeDirection(7);
                swipeDismissAdvancedBehavior.setListener(this.dismissListener);
                ((CoordinatorLayout.LayoutParams) layoutParams).setBehavior(swipeDismissAdvancedBehavior);
            }
            if (mustAnimatePopup) {
                createViewHolder.itemView.startAnimation(AnimationUtils.loadAnimation(getContext(), R.anim.slide_from_above));
            }
        }
        View findViewById = inflate.findViewById(R.id.touch_capture_view);
        if (findViewById != null) {
            findViewById.setOnClickListener(this.frameClickListener);
        }
        return inflate;
    }

    @Override
    public void onResume() {
        super.onResume();
        if (getEvent() == null) {
            hideAndDismiss();
        }
    }

    @Override
    public void onStart() {
        super.onStart();
        if (getEvent() == null) {
            hideAndDismiss();
        }
    }
}
