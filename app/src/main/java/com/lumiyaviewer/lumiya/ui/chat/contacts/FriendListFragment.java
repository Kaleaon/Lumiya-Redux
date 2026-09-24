package com.lumiyaviewer.lumiya.ui.chat.contacts;

import android.content.Context;
import androidx.loader.app.LoaderManager;
import android.widget.ListAdapter;
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.UserListFragment;

public class FriendListFragment extends UserListFragment {
    @Override
    protected ListAdapter createListAdapter(Context context, LoaderManager loaderManager, UserManager userManager) {
        return new ChatterListSubscriptionAdapter(context, userManager, ChatterListType.Friends);
    }
}
