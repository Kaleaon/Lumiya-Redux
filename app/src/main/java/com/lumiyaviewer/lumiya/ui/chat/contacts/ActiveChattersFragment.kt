package com.lumiyaviewer.lumiya.ui.chat.contacts

import android.content.Context
import android.widget.ListAdapter
import androidx.loader.app.LoaderManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.UserListFragment

open class ActiveChattersFragment : UserListFragment() {
    override fun createListAdapter(context: Context, loaderManager: LoaderManager, userManager: UserManager): ListAdapter =
        ActiveChatsListAdapter(activity, userManager)
    override fun itemsMayBeDismissed(): Boolean = true
}
