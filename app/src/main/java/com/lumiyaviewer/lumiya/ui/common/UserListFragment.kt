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
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissListViewTouchListener
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity
import java.io.Closeable
import java.io.IOException

abstract class UserListFragment : Fragment() {

    protected UserManager userManager = null

    private fun updateListViews() {
        ListView listView
        View view = getView()
        if (view == null || (listView = (ListView) view.findViewById(R.id.contactList)) == null) {
            return
        }
        listView.invalidateViews()
    }

    protected abstract ListAdapter createListAdapter(Context context, LoaderManager loaderManager, UserManager userManager)

    protected open fun handleUserDefaultAction(chatterID: ChatterID) {
        internal fun if(null: this.userManager !=):  {
            Bundle makeSelection = ChatFragment.makeSelection(chatterID)
            Bundle arguments = getArguments()
            if (arguments.containsKey(CardboardActivity.VR_MODE_TAG)) {
                makeSelection.putBoolean(CardboardActivity.VR_MODE_TAG, arguments.getBoolean(CardboardActivity.VR_MODE_TAG))
            }
            DetailsActivity.showDetails(getActivity(), ChatFragmentActivityFactory.getInstance(), makeSelection)
        }
    }

    protected open fun itemsMayBeDismissed(): Boolean {
        return false
    }


    override fun onActivityCreated(bundle: Bundle) {
        super.onActivityCreated(bundle)
        View view = getView()
        internal fun if(null: view !=):  {
            ListView listView = (ListView) view.findViewById(R.id.contactList)
            listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    UserListFragment.this.m588lambda$com_lumiyaviewer_lumiya_ui_common_UserListFragment_1689(adapterView, view2, i, j)
                }

                override fun onItemClick(adapterView: AdapterView, view2: View, i: Int, j: Long) {

                    override fun onDismiss(listView2: ListView, i: Int) {
                        ListAdapter adapter = listView2.getAdapter()
                        internal fun if(DismissableAdapter: adapter instanceof):  {
                            ((DismissableAdapter) adapter).onDismiss(i)
                        }
                    }
                })
                listView.setOnTouchListener(swipeDismissListViewTouchListener)
                listView.setOnScrollListener(swipeDismissListViewTouchListener.makeScrollListener())
            }
        }
    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        this.userManager = ActivityUtils.getUserManager(getArguments())
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        return layoutInflater.inflate(R.layout.contacts_group, viewGroup, false)
    }

    override fun onStart() {
        ListView listView
        super.onStart()
        View view = getView()
        Debug.Printf("UserListFragment: onStart, rootView = %s", view)
        if (view == null || (listView = (ListView) view.findViewById(R.id.contactList)) == null || listView.getAdapter() != null) {
            return
        }
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        listView.setAdapter(userManager != null ? createListAdapter(getActivity(), getLoaderManager(), userManager) : null)
    }

    override fun onStop() {
        ListView listView
        View view = getView()
        Debug.Printf("UserListFragment: onStop, rootView = %s", view)
        if (view != null && (listView = (ListView) view.findViewById(R.id.contactList)) != null) {
            ListAdapter adapter = listView.getAdapter()
            internal fun if(Closeable: adapter instanceof):  {
                try {
                    ((Closeable) adapter).close()
                } catch (IOException e) {
                    Debug.Warning(e)
                }
            }
            listView.setAdapter((ListAdapter) null)
        }
        super.onStop()
    }

    @EventHandler
    open fun onUserInfoChanged(eventUserInfoChanged: EventUserInfoChanged) {
        if (this.userManager != null && this.userManager.getUserID() == (eventUserInfoChanged.agentUUID) && eventUserInfoChanged.isProfileChanged()) {
            updateListViews()
        }
    }
}
