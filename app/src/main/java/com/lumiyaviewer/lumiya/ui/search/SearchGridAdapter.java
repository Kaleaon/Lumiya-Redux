package com.lumiyaviewer.lumiya.ui.search;

import android.annotation.SuppressLint;
import android.content.Context;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.SearchGridResult;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import de.greenrobot.dao.query.LazyList;
import java.util.UUID;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
class SearchGridAdapter extends RecyclerView.Adapter<SearchGridAdapter.SearchViewHolder> {
    private final UUID agentUUID;
    private final Context context;

    @Nullable
    private LazyList<SearchGridResult> data;
    private final LayoutInflater inflater;
    private final OnSearchResultClickListener onSearchResultClickListener;

    interface OnSearchResultClickListener {
        void onSearchResultClicked(SearchGridResult searchGridResult);
    }

    public class SearchViewHolder_ViewBinding implements Unbinder {
        private SearchViewHolder target;

        @UiThread
        public SearchViewHolder_ViewBinding(SearchViewHolder searchViewHolder, View view) {
            this.target = searchViewHolder;
            searchViewHolder.resultItemName = (TextView) Utils.findRequiredViewAsType(view, R.id.result_item_name, "field 'resultItemName'", TextView.class);
            searchViewHolder.userPicView = (ChatterPicView) Utils.findRequiredViewAsType(view, R.id.userPicView, "field 'userPicView'", ChatterPicView.class);
            searchViewHolder.resultMemberCount = (TextView) Utils.findRequiredViewAsType(view, R.id.result_member_count, "field 'resultMemberCount'", TextView.class);
        }

        @Override // butterknife.Unbinder
        @CallSuper
        public void unbind() {
            SearchViewHolder searchViewHolder = this.target;
            if (searchViewHolder == null) {
                throw new IllegalStateException("Bindings already cleared.");
            }
            this.target = null;
            searchViewHolder.resultItemName = null;
            searchViewHolder.userPicView = null;
            searchViewHolder.resultMemberCount = null;
        }
    }


    UUID getAgentUUID() {
        return this.agentUUID;
    }

    OnSearchResultClickListener getOnSearchResultClickListener() {
        return this.onSearchResultClickListener;
    }

    SearchGridAdapter(Context context, UUID uuid, OnSearchResultClickListener onSearchResultClickListener) {
        this.context = context;
        this.agentUUID = uuid;
        this.inflater = LayoutInflater.from(context);
        this.onSearchResultClickListener = onSearchResultClickListener;
        setHasStableIds(true);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        if (this.data != null) {
            return this.data.size();
        }
        return 0;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public long getItemId(int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return -1L;
        }
        return this.data.get(i).getId().longValue();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(SearchViewHolder searchViewHolder, int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return;
        }
        searchViewHolder.bindToData(this.data.get(i));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public SearchViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SearchViewHolder(this, this.inflater.inflate(R.layout.search_result_item, viewGroup, false));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onViewRecycled(SearchViewHolder searchViewHolder) {
        searchViewHolder.onRecycled();
    }

    public void setData(@Nullable LazyList<SearchGridResult> lazyList) {
        this.data = lazyList;
        notifyDataSetChanged();
    }
}
