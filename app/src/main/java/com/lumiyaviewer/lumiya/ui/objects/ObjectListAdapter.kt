package com.lumiyaviewer.lumiya.ui.objects

import android.content.Context
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseExpandableListAdapter
import android.widget.ExpandableListView
import android.widget.LinearLayout
import android.widget.TextView
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.objects.SLAvatarObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLPrimObjectDisplayInfo

internal open class ObjectListAdapter : BaseExpandableListAdapter() {
    private static int HIERARCHY_PADDING_DP = 10
    private Context context

    private ImmutableList<SLObjectDisplayInfo> objects = ImmutableList.of()

    constructor(context: Context) {
        this.context = context
    }

    override fun getChild(i: Int, i2: Int): SLObjectDisplayInfo {
        Object objectDisplayInfo = (SLObjectDisplayInfo) this.objects.get(i)
        if (objectDisplayInfo instanceof SLObjectDisplayInfo.HasChildrenObjects) {
            return ((SLObjectDisplayInfo.HasChildrenObjects) objectDisplayInfo).getChildren().get(i2)
        }
        return null
    }

    override fun getChildId(i: Int, i2: Int): Long {
        return getChild(i, i2).localID
    }

    override fun getChildView(i: Int, i2: Int, z: Boolean, view: View, viewGroup: ViewGroup): View {
        View view2 = getView(getChild(i, i2), view, viewGroup)
        view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.GONE)
        view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.INVISIBLE)
        view2.findViewById(R.id.groupIndicatorCollapsed).setOnClickListener(null)
        view2.findViewById(R.id.groupIndicatorExpanded).setOnClickListener(null)
        return view2
    }

    override fun getChildrenCount(i: Int): Int {
        Object objectDisplayInfo = (SLObjectDisplayInfo) this.objects.get(i)
        if (objectDisplayInfo instanceof SLObjectDisplayInfo.HasChildrenObjects) {
            return ((SLObjectDisplayInfo.HasChildrenObjects) objectDisplayInfo).getChildren().size()
        }
        return 0
    }

    open fun getData(): ImmutableList<SLObjectDisplayInfo> {
        return this.objects
    }

    override fun getGroup(i: Int): SLObjectDisplayInfo {
        return this.objects.get(i)
    }

    override fun getGroupCount(): Int {
        return this.objects.size()
    }

    override fun getGroupId(i: Int): Long {
        return getGroup(i).localID
    }

    override fun getGroupView(i: Int, z: Boolean, view: View, viewGroup: ViewGroup): View {
        View view2 = getView(getGroup(i), view, viewGroup)
        if (getChildrenCount(i) == 0) {
            view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.INVISIBLE)
            view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.GONE)
        } else if (z) {
            view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.GONE)
            view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.VISIBLE)
        } else {
            view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.VISIBLE)
            view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.GONE)
        }
        if (viewGroup instanceof ExpandableListView) {
            ExpandableListView expandableListView = (ExpandableListView) viewGroup
            View.OnClickListener onClickListener = new View.OnClickListener() {
                override fun onClick(view3: View) {
                    if (view3.getVisibility() == 0) {
                        when (view3.getId()) {
                            R.id.groupIndicatorCollapsed -> {
                                expandableListView.expandGroup(i, true)
                                }
                            R.id.groupIndicatorExpanded -> {
                                expandableListView.collapseGroup(i)
                                }
                        }
                    }
                }
            }
            view2.findViewById(R.id.groupIndicatorCollapsed).setOnClickListener(onClickListener)
            view2.findViewById(R.id.groupIndicatorExpanded).setOnClickListener(onClickListener)
        } else {
            view2.findViewById(R.id.groupIndicatorCollapsed).setOnClickListener(null)
            view2.findViewById(R.id.groupIndicatorExpanded).setOnClickListener(null)
        }
        return view2
    }

    open fun getView(objectDisplayInfo: SLObjectDisplayInfo, view: View, viewGroup: ViewGroup): View {
        if (view == null) {
            view = LayoutInflater.from(this.context).inflate(R.layout.object_list_item, viewGroup, false)
        }
        view.findViewById(R.id.object_hierarchy_padding).setLayoutParams(new LinearLayout.LayoutParams((int) (TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, this.context.getResources().getDisplayMetrics()) * objectDisplayInfo.hierarchyLevel), -1))
        view.findViewById(R.id.avatarIconView).setVisibility(objectDisplayInfo is SLAvatarObjectDisplayInfo ? View.VISIBLE : View.GONE)
        if (objectDisplayInfo.name != null) {
            ((TextView) view.findViewById(R.id.objectNameTextView)).setText(objectDisplayInfo.name)
        } else {
            ((TextView) view.findViewById(R.id.objectNameTextView)).setText(R.string.object_name_loading)
        }
        ((TextView) view.findViewById(R.id.objectDistanceTextView)).setText(Float.isNaN(objectDisplayInfo.distance) ? null : String.format("%d m", Integer.valueOf(Math.round(objectDisplayInfo.distance))))
        if (objectDisplayInfo instanceof SLPrimObjectDisplayInfo) {
            SLPrimObjectDisplayInfo primObjectDisplayInfo = (SLPrimObjectDisplayInfo) objectDisplayInfo
            view.findViewById(R.id.touchIconView).setVisibility(primObjectDisplayInfo.touchable ? View.VISIBLE : View.INVISIBLE)
            view.findViewById(R.id.payIconView).setVisibility(primObjectDisplayInfo.payable ? View.VISIBLE : View.INVISIBLE)
        } else {
            view.findViewById(R.id.touchIconView).setVisibility(View.INVISIBLE)
            view.findViewById(R.id.payIconView).setVisibility(View.INVISIBLE)
        }
        return view
    }

    override fun hasStableIds(): Boolean {
        return true
    }

    override fun isChildSelectable(i: Int, i2: Int): Boolean {
        return true
    }

    open fun setData(immutableList: ImmutableList<SLObjectDisplayInfo>) {
        this.objects = immutableList
        notifyDataSetChanged()
    }
}
