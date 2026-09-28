package com.lumiyaviewer.lumiya.ui.common

import android.content.Context
import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.loader.app.LoaderManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ListAdapter
import android.widget.ListView
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.events.EventUserInfoChanged
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatFragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity
import java.io.Closeable
import java.io.IOException

abstract class UserListFragment : Fragment() {

    protected var userManager: UserManager? = null

    private fun updateListViews() {
        val view = view ?: return
        val listView = view.findViewById<ListView>(R.id.contactList) ?: return
        listView.invalidateViews()
    }

    protected abstract fun createListAdapter(context: Context, loaderManager: LoaderManager, userManager: UserManager): ListAdapter

    protected open fun handleUserDefaultAction(chatterID: ChatterID) {
        if (this.userManager != null) {
            val makeSelection = ChatFragment.makeSelection(chatterID)
            val arguments = arguments
            if (arguments != null && arguments.containsKey(CardboardActivity.VR_MODE_TAG)) {
                makeSelection.putBoolean(CardboardActivity.VR_MODE_TAG, arguments.getBoolean(CardboardActivity.VR_MODE_TAG))
            }
            DetailsActivity.showDetails(activity, ChatFragmentActivityFactory.getInstance(), makeSelection)
        }
    }

    protected open fun itemsMayBeDismissed(): Boolean {
        return false
    }

    override fun onActivityCreated(bundle: Bundle?) {
        super.onActivityCreated(bundle)
        val view = view
        if (view != null) {
            val listView = view.findViewById<ListView>(R.id.contactList)
            listView.onItemClickListener = AdapterView.OnItemClickListener { adapterView, _, i, _ ->
                val itemAtPosition = adapterView.getItemAtPosition(i)
                val userManager = this.userManager
                if (itemAtPosition is ChatterDisplayInfo && userManager != null) {
                    val chatterID = itemAtPosition.getChatterID(userManager)
                    if (chatterID != null) {
                        handleUserDefaultAction(chatterID)
                    }
                }
            }
            registerForContextMenu(listView)
            if (itemsMayBeDismissed()) {
                val swipeDismissListViewTouchListener = SwipeDismissListViewTouchListener(listView, object : SwipeDismissListViewTouchListener.DismissCallbacks {
                    override fun canDismiss(listView2: ListView, i: Int): Boolean {
                        val adapter = listView2.adapter
                        if (adapter is DismissableAdapter) {
                            return adapter.canDismiss(i)
                        }
                        return false
                    }

                    override fun onDismiss(listView2: ListView, i: Int) {
                        val adapter = listView2.adapter
                        if (adapter is DismissableAdapter) {
                            adapter.onDismiss(i)
                        }
                    }
                })
                listView.setOnTouchListener(swipeDismissListViewTouchListener)
                listView.setOnScrollListener(swipeDismissListViewTouchListener.makeScrollListener())
            }
        }
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        this.userManager = ActivityUtils.getUserManager(arguments)
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup?, bundle: Bundle?): View {
        return layoutInflater.inflate(R.layout.contacts_group, viewGroup, false)
    }

    override fun onStart() {
        super.onStart()
        val view = view
        Debug.Printf("UserListFragment: onStart, rootView = %s", view)
        val listView = view?.findViewById<ListView>(R.id.contactList) ?: return
        if (listView.adapter != null) {
            return
        }
        val userManager = ActivityUtils.getUserManager(arguments)
        listView.adapter = if (userManager != null) createListAdapter(requireActivity(), loaderManager, userManager) else null
    }

    override fun onStop() {
        val view = view
        Debug.Printf("UserListFragment: onStop, rootView = %s", view)
        if (view != null) {
            val listView = view.findViewById<ListView>(R.id.contactList)
            if (listView != null) {
                val adapter = listView.adapter
                if (adapter is Closeable) {
                    try {
                        adapter.close()
                    } catch (e: IOException) {
                        Debug.Warning(e)
                    }
                }
                listView.adapter = null
            }
        }
        super.onStop()
    }

    @EventHandler
    open fun onUserInfoChanged(eventUserInfoChanged: EventUserInfoChanged) {
        val userManager = this.userManager
        if (userManager != null && userManager.getUserID() == eventUserInfoChanged.agentUUID && eventUserInfoChanged.isProfileChanged()) {
            updateListViews()
        }
    }
}
