package com.lumiyaviewer.lumiya.ui.objects;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

class TouchableObjectListAdapter extends BaseAdapter {
    private final Context context;

    @Nonnull
    private ImmutableList<SLObjectInfo> objects = ImmutableList.of();

    TouchableObjectListAdapter(Context context) {
        this.context = context;
    }

    @Override
    public int getCount() {
        return this.objects.size();
    }

    @Override
    public SLObjectInfo getItem(int i) {
        if (i < 0 || i >= this.objects.size()) {
            return null;
        }
        return this.objects.get(i);
    }

    @Override
    public long getItemId(int i) {
        SLObjectInfo item = getItem(i);
        if (item != null) {
            return item.localID;
        }
        return -1L;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        SLObjectInfo item = getItem(i);
        if (item == null) {
            return null;
        }
        View view2 = (view == null || view.getId() == R.id.touchable_object_list_item) ? view : null;
        View inflate = view2 == null ? ((LayoutInflater) this.context.getSystemService("layout_inflater")).inflate(R.layout.touchable_object_list_item, viewGroup, false) : view2;
        ((TextView) inflate.findViewById(R.id.touchable_objectNameTextView)).setText(item.getName());
        inflate.findViewById(R.id.touchable_touchIconView).setVisibility(item.isTouchable() ? View.VISIBLE : View.INVISIBLE);
        return inflate;
    }

    @Override
    public boolean hasStableIds() {
        return true;
    }

    @Override
    public boolean isEmpty() {
        return this.objects.isEmpty();
    }

    public void setData(@Nullable ImmutableList<SLObjectInfo> immutableList) {
        if (immutableList == null) {
            immutableList = ImmutableList.of();
        }
        this.objects = immutableList;
        notifyDataSetChanged();
    }
}
