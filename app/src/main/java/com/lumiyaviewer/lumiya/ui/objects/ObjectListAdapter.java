package com.lumiyaviewer.lumiya.ui.objects;

import android.content.Context;
import android.os.Build;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.objects.SLAvatarObjectDisplayInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLPrimObjectDisplayInfo;
import javax.annotation.Nonnull;

class ObjectListAdapter extends BaseExpandableListAdapter {
    private static final int HIERARCHY_PADDING_DP = 10;
    private final Context context;

    @Nonnull
    private ImmutableList<SLObjectDisplayInfo> objects = ImmutableList.of();

    public ObjectListAdapter(Context context) {
        this.context = context;
    }

    @Override
    public SLObjectDisplayInfo getChild(int i, int i2) {
        Object objectDisplayInfo = (SLObjectDisplayInfo) this.objects.get(i);
        if (objectDisplayInfo instanceof SLObjectDisplayInfo.HasChildrenObjects) {
            return ((SLObjectDisplayInfo.HasChildrenObjects) objectDisplayInfo).getChildren().get(i2);
        }
        return null;
    }

    @Override
    public long getChildId(int i, int i2) {
        return getChild(i, i2).localID;
    }

    @Override
    public View getChildView(int i, int i2, boolean z, View view, ViewGroup viewGroup) {
        View view2 = getView(getChild(i, i2), view, viewGroup);
        view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.GONE);
        view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.INVISIBLE);
        view2.findViewById(R.id.groupIndicatorCollapsed).setOnClickListener(null);
        view2.findViewById(R.id.groupIndicatorExpanded).setOnClickListener(null);
        return view2;
    }

    @Override
    public int getChildrenCount(int i) {
        Object objectDisplayInfo = (SLObjectDisplayInfo) this.objects.get(i);
        if (objectDisplayInfo instanceof SLObjectDisplayInfo.HasChildrenObjects) {
            return ((SLObjectDisplayInfo.HasChildrenObjects) objectDisplayInfo).getChildren().size();
        }
        return 0;
    }

    @Nonnull
    public ImmutableList<SLObjectDisplayInfo> getData() {
        return this.objects;
    }

    @Override
    public SLObjectDisplayInfo getGroup(int i) {
        return this.objects.get(i);
    }

    @Override
    public int getGroupCount() {
        return this.objects.size();
    }

    @Override
    public long getGroupId(int i) {
        return getGroup(i).localID;
    }

    @Override
    public View getGroupView(final int i, boolean z, View view, ViewGroup viewGroup) {
        View view2 = getView(getGroup(i), view, viewGroup);
        if (getChildrenCount(i) == 0) {
            view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.INVISIBLE);
            view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.GONE);
        } else if (z) {
            view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.GONE);
            view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.VISIBLE);
        } else {
            view2.findViewById(R.id.groupIndicatorCollapsed).setVisibility(View.VISIBLE);
            view2.findViewById(R.id.groupIndicatorExpanded).setVisibility(View.GONE);
        }
        if (viewGroup instanceof ExpandableListView) {
            final ExpandableListView expandableListView = (ExpandableListView) viewGroup;
            View.OnClickListener onClickListener = new View.OnClickListener() {
                @Override
                public void onClick(View view3) {
                    if (view3.getVisibility() == 0) {
                        switch (view3.getId()) {
                            case R.id.groupIndicatorCollapsed:
                                if (Build.VERSION.SDK_INT < 14) {
                                    expandableListView.expandGroup(i);
                                    break;
                                } else {
                                    expandableListView.expandGroup(i, true);
                                    break;
                                }
                            case R.id.groupIndicatorExpanded:
                                expandableListView.collapseGroup(i);
                                break;
                        }
                    }
                }
            };
            view2.findViewById(R.id.groupIndicatorCollapsed).setOnClickListener(onClickListener);
            view2.findViewById(R.id.groupIndicatorExpanded).setOnClickListener(onClickListener);
        } else {
            view2.findViewById(R.id.groupIndicatorCollapsed).setOnClickListener(null);
            view2.findViewById(R.id.groupIndicatorExpanded).setOnClickListener(null);
        }
        return view2;
    }

    public View getView(SLObjectDisplayInfo objectDisplayInfo, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = LayoutInflater.from(this.context).inflate(R.layout.object_list_item, viewGroup, false);
        }
        view.findViewById(R.id.object_hierarchy_padding).setLayoutParams(new LinearLayout.LayoutParams((int) (TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, this.context.getResources().getDisplayMetrics()) * objectDisplayInfo.hierarchyLevel), -1));
        view.findViewById(R.id.avatarIconView).setVisibility(objectDisplayInfo instanceof SLAvatarObjectDisplayInfo ? View.VISIBLE : View.GONE);
        if (objectDisplayInfo.name != null) {
            ((TextView) view.findViewById(R.id.objectNameTextView)).setText(objectDisplayInfo.name);
        } else {
            ((TextView) view.findViewById(R.id.objectNameTextView)).setText(R.string.object_name_loading);
        }
        ((TextView) view.findViewById(R.id.objectDistanceTextView)).setText(Float.isNaN(objectDisplayInfo.distance) ? null : String.format("%d m", Integer.valueOf(Math.round(objectDisplayInfo.distance))));
        if (objectDisplayInfo instanceof SLPrimObjectDisplayInfo) {
            SLPrimObjectDisplayInfo primObjectDisplayInfo = (SLPrimObjectDisplayInfo) objectDisplayInfo;
            view.findViewById(R.id.touchIconView).setVisibility(primObjectDisplayInfo.touchable ? View.VISIBLE : View.INVISIBLE);
            view.findViewById(R.id.payIconView).setVisibility(primObjectDisplayInfo.payable ? View.VISIBLE : View.INVISIBLE);
        } else {
            view.findViewById(R.id.touchIconView).setVisibility(View.INVISIBLE);
            view.findViewById(R.id.payIconView).setVisibility(View.INVISIBLE);
        }
        return view;
    }

    @Override
    public boolean hasStableIds() {
        return true;
    }

    @Override
    public boolean isChildSelectable(int i, int i2) {
        return true;
    }

    public void setData(@Nonnull ImmutableList<SLObjectDisplayInfo> immutableList) {
        this.objects = immutableList;
        notifyDataSetChanged();
    }
}
