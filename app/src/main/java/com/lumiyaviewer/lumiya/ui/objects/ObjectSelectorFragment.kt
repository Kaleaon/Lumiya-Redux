package com.lumiyaviewer.lumiya.ui.objects

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.core.view.MenuItemCompat
import androidx.appcompat.widget.SearchView
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.view.animation.Animation
import android.view.animation.AnimationUtils
import android.widget.CheckBox
import android.widget.CompoundButton
import android.widget.ExpandableListAdapter
import android.widget.ExpandableListView
import android.widget.FrameLayout
import android.widget.SeekBar
import android.widget.TextView
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.objects.SLAvatarObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectFilterInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLPrimObjectDisplayInfoWithChildren
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.ButteryProgressBar
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.objects.ObjectListNewActivity
import java.util.ArrayList
import java.util.HashSet
import java.util.Iterator
import java.util.UUID

open class ObjectSelectorFragment : Fragment(), SeekBar.OnSeekBarChangeListener, CompoundButton.OnCheckedChangeListener, ExpandableListView.OnGroupClickListener, ExpandableListView.OnChildClickListener {
    private static int MAX_FILTER_DISTANCE = 256
    private static int PROGRESS_BAR_SIZE_DIP = 4
    private SearchView searchView
    private Subscription<SubscriptionSingleKey, ObjectsManager.ObjectDisplayList> subscription
    private SLObjectFilterInfo filterInfo = SLObjectFilterInfo.create()
    private Subscription.OnError onObjectListError = Subscription.OnError() {
            ObjectSelectorFragment.this.m692x47832f4(th)
        }

        override fun onError(th: Throwable) {
                DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(activeAgentID, ((SLAvatarObjectDisplayInfo) objectDisplayInfo).uuid)))
            }
        }
    }

    open fun updateFilter() {
        SLAgentCircuit activeAgentCircuit
        SLModules modules
        SLObjectFilterInfo filter = getFilter()
        if (filter == (this.filterInfo)) {
            return
        }
        this.filterInfo = filter
        UserManager userManager = getUserManager()
        if (userManager != null) {
            userManager.getObjectsManager().setFilter(this.filterInfo)
            if (this.filterInfo.range() == 0.0f || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null || (modules = activeAgentCircuit.getModules()) == null) {
                return
            }
            modules.drawDistance.setObjectSelectRange(this.filterInfo.range())
        }
    }



    override fun onCheckedChanged(compoundButton: CompoundButton, z: Boolean) {
        updateFilter()
    }

    override fun onChildClick(expandableListView: ExpandableListView, view: View, i: Int, i2: Int, j: Long): Boolean {
        SLObjectDisplayInfo child
        ExpandableListAdapter expandableListAdapter = expandableListView.getExpandableListAdapter()
        if (!(expandableListAdapter is ObjectListAdapter) || (child = ((ObjectListAdapter) expandableListAdapter).getChild(i, i2)) == null) {
            return true
        }
        showObjectDetails(child)
        return true
    }

    override fun onCreate(bundle: .annotation.Nullable Bundle) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
    }

    override fun onCreateOptionsMenu(menu: Menu, menuInflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater.inflate(R.menu.menu_object_selector, menu)
        this.searchView = (SearchView) MenuItemCompat.getActionView(menu.findItem(R.id.action_search))
        this.searchView.setOnQueryTextListener(SearchView.OnQueryTextListener() {
            override fun onQueryTextChange(str: String): Boolean {
                Debug.Printf("searchview: textchange", arrayOfNulls<Object>(0])
                ObjectSelectorFragment.this.updateFilter()
                return true
            }

            override fun onQueryTextSubmit(str: String): Boolean {
                return true
            }
        })
        MenuItemCompat.setOnActionExpandListener(menu.findItem(R.id.action_search), MenuItemCompat.OnActionExpandListener() {
            override fun onMenuItemActionCollapse(menuItem: MenuItem): Boolean {
                View view = ObjectSelectorFragment.this.getView()
                if (view != null) {
                    view.findViewById(R.id.filterPanel).setVisibility(View.GONE)
                    Animation animation = view.findViewById(R.id.filterPanel).getAnimation()
                    if (animation != null) {
                        animation.cancel()
                    }
                }
                ObjectSelectorFragment.this.updateFilter()
                return true
            }

            override fun onMenuItemActionExpand(menuItem: MenuItem): Boolean {
                View view = ObjectSelectorFragment.this.getView()
                if (view != null) {
                    view.findViewById(R.id.filterPanel).setVisibility(View.VISIBLE)
                    view.findViewById(R.id.filterPanel).startAnimation(AnimationUtils.loadAnimation(ObjectSelectorFragment.this.getContext(), R.anim.slide_from_above))
                }
                ObjectSelectorFragment.this.updateFilter()
                return true
            }
        })
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        View inflate = layoutInflater.inflate(R.layout.object_list, viewGroup, false)
        ((ExpandableListView) inflate.findViewById(R.id.objectListView)).setAdapter(ObjectListAdapter(layoutInflater.getContext()))
        ((ExpandableListView) inflate.findViewById(R.id.objectListView)).setOnGroupClickListener(this)
        ((ExpandableListView) inflate.findViewById(R.id.objectListView)).setOnChildClickListener(this)
        ((SeekBar) inflate.findViewById(R.id.objectListSeekBar)).setMax(256)
        ((SeekBar) inflate.findViewById(R.id.objectListSeekBar)).setOnSeekBarChangeListener(this)
        ((CheckBox) inflate.findViewById(R.id.includeAttachments)).setOnCheckedChangeListener(this)
        ((CheckBox) inflate.findViewById(R.id.includeStubs)).setOnCheckedChangeListener(this)
        ((CheckBox) inflate.findViewById(R.id.includeNonTouchable)).setOnCheckedChangeListener(this)
        ButteryProgressBar butteryProgressBar = ButteryProgressBar(layoutInflater.getContext())
        butteryProgressBar.setId(R.id.object_progress_bar)
        ((FrameLayout) inflate.findViewById(R.id.object_list_root_layout)).addView(butteryProgressBar, FrameLayout.LayoutParams(-1, (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 4.0f, layoutInflater.getContext().getResources().getDisplayMetrics())))
        return inflate
    }

    override fun onGroupClick(expandableListView: ExpandableListView, view: View, i: Int, j: Long): Boolean {
        SLObjectDisplayInfo group
        Debug.Printf("displayObjects: onGroupClick: view %s id %d", view, Integer.valueOf(view.getId()))
        ExpandableListAdapter expandableListAdapter = expandableListView.getExpandableListAdapter()
        if ((expandableListAdapter is ObjectListAdapter) && (group = ((ObjectListAdapter) expandableListAdapter).getGroup(i)) != null) {
            showObjectDetails(group)
        }
        return true
    }

    override fun onProgressChanged(seekBar: SeekBar, i: Int, z: Boolean) {
        View view = getView()
        if (view != null) {
            ((TextView) view.findViewById(R.id.objectListRangeDisplay)).setText(getString(R.string.object_range_format, Integer.valueOf(i)))
            if (z) {
                updateFilter()
            }
        }
    }

    override fun onStart() {
        SLModules modules
        int i = 256
        super.onStart()
        UserManager userManager = getUserManager()
        if (userManager != null) {
            userManager.getObjectsManager().setFilter(this.filterInfo)
            this.subscription = userManager.getObjectsManager().getObjectDisplayList().subscribe(SubscriptionSingleKey.Value, UIThreadExecutor.getInstance(), this.onObjectListData, this.onObjectListError)
            SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit()
            if (activeAgentCircuit == null || (modules = activeAgentCircuit.getModules()) == null) {
                return
            }
            modules.drawDistance.EnableObjectSelect()
            View view = getView()
            if (view != null) {
                int objectSelectRange = (int) modules.drawDistance.getObjectSelectRange()
                if (objectSelectRange < 1) {
                    i = 1
                } else if (objectSelectRange <= 256) {
                    i = objectSelectRange
                }
                ((SeekBar) view.findViewById(R.id.objectListSeekBar)).setProgress(i)
            }
        }
    }

    override fun onStartTrackingTouch(seekBar: SeekBar) {
    }

    override fun onStop() {
        SLAgentCircuit activeAgentCircuit
        SLModules modules
        if (this.subscription != null) {
            this.subscription.unsubscribe()
            this.subscription = null
        }
        UserManager userManager = getUserManager()
        if (userManager != null && (activeAgentCircuit = userManager.getActiveAgentCircuit()) != null && (modules = activeAgentCircuit.getModules()) != null) {
            modules.drawDistance.DisableObjectSelect()
        }
        super.onStop()
    }

    override fun onStopTrackingTouch(seekBar: SeekBar) {
    }
}
