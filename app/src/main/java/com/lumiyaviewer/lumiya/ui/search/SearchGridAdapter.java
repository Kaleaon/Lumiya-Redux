package com.lumiyaviewer.lumiya.ui.search;

import android.annotation.SuppressLint;
import android.content.Context;
import androidx.annotation.CallSuper;
import androidx.annotation.UiThread;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.ui.common.binding.Unbinder;
import com.lumiyaviewer.lumiya.ui.common.binding.Utils;
import com.lumiyaviewer.lumiya.dao.SearchGridResult;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import de.greenrobot.dao.query.LazyList;
import java.util.UUID;
import javax.annotation.Nullable;

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

    class SearchViewHolder extends RecyclerView.ViewHolder implements ChatterNameRetriever.OnChatterNameUpdated, View.OnClickListener {
        private ChatterNameRetriever chatterNameRetriever;
        TextView resultItemName;
        TextView resultMemberCount;
        private SearchGridResult searchGridResult;
        ChatterPicView userPicView;

        SearchViewHolder(View view) {
            super(view);
            this.chatterNameRetriever = null;
            new SearchViewHolder_ViewBinding(this, view);
            view.setOnClickListener(this);
        }

        @SuppressLint({"DefaultLocale", "SetTextI18n"})
        void bindToData(SearchGridResult searchGridResult) {
            this.searchGridResult = searchGridResult;
            this.resultItemName.setText(searchGridResult.getItemName());
            if (searchGridResult.getItemType() == SearchGridQuery.SearchType.Groups.ordinal()) {
                Integer memberCount = searchGridResult.getMemberCount();
                this.resultMemberCount.setVisibility(View.VISIBLE);
                this.resultMemberCount.setText(Integer.toString(memberCount != null ? memberCount.intValue() : 0));
            } else {
                this.resultMemberCount.setVisibility(View.GONE);
            }
            if (this.chatterNameRetriever != null) {
                this.chatterNameRetriever.dispose();
                this.chatterNameRetriever = null;
            }
            if (searchGridResult.getItemType() == SearchGridQuery.SearchType.Groups.ordinal()) {
                this.userPicView.setChatterID(ChatterID.getGroupChatterID(SearchGridAdapter.this.agentUUID, searchGridResult.getItemUUID()), searchGridResult.getItemName());
                this.userPicView.setVisibility(View.VISIBLE);
            } else {
                if (searchGridResult.getItemType() != SearchGridQuery.SearchType.People.ordinal()) {
                    this.userPicView.setVisibility(View.GONE);
                    return;
                }
                ChatterID.ChatterIDUser userChatterID = ChatterID.getUserChatterID(SearchGridAdapter.this.agentUUID, searchGridResult.getItemUUID());
                this.userPicView.setChatterID(userChatterID, searchGridResult.getItemName());
                this.userPicView.setVisibility(View.VISIBLE);
                this.chatterNameRetriever = new ChatterNameRetriever(userChatterID, this, UIThreadExecutor.getInstance(), false);
                this.chatterNameRetriever.subscribe();
            }
        }

        @Override
        public void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
            String resolvedName;
            if (chatterNameRetriever != this.chatterNameRetriever || (resolvedName = chatterNameRetriever.getResolvedName()) == null) {
                return;
            }
            this.resultItemName.setText(resolvedName);
        }

        @Override
        public void onClick(View view) {
            if (SearchGridAdapter.this.onSearchResultClickListener == null || this.searchGridResult == null) {
                return;
            }
            SearchGridAdapter.this.onSearchResultClickListener.onSearchResultClicked(this.searchGridResult);
        }

        void onRecycled() {
            this.userPicView.setChatterID(null, null);
            if (this.chatterNameRetriever != null) {
                this.chatterNameRetriever.dispose();
                this.chatterNameRetriever = null;
            }
            this.searchGridResult = null;
        }
    }

    /**
     * ButterKnife binding generated for 3.4.2, kept as source; the holder
     * constructs it directly (see ui/common/binding).
     */
    public static class SearchViewHolder_ViewBinding implements Unbinder {
        private SearchViewHolder target;

        @UiThread
        public SearchViewHolder_ViewBinding(SearchViewHolder searchViewHolder, View view) {
            this.target = searchViewHolder;
            searchViewHolder.resultItemName = (TextView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.result_item_name, "field 'resultItemName'", TextView.class);
            searchViewHolder.userPicView = (ChatterPicView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.userPicView, "field 'userPicView'", ChatterPicView.class);
            searchViewHolder.resultMemberCount = (TextView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.result_member_count, "field 'resultMemberCount'", TextView.class);
        }

        @Override
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

    SearchGridAdapter(Context context, UUID uuid, OnSearchResultClickListener onSearchResultClickListener) {
        this.context = context;
        this.agentUUID = uuid;
        this.inflater = LayoutInflater.from(context);
        this.onSearchResultClickListener = onSearchResultClickListener;
        setHasStableIds(true);
    }

    @Override
    public int getItemCount() {
        if (this.data != null) {
            return this.data.size();
        }
        return 0;
    }

    @Override
    public long getItemId(int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return -1L;
        }
        return this.data.get(i).getId().longValue();
    }

    @Override
    public void onBindViewHolder(SearchViewHolder searchViewHolder, int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return;
        }
        searchViewHolder.bindToData(this.data.get(i));
    }

    @Override
    public SearchViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SearchViewHolder(this.inflater.inflate(com.lumiyaviewer.lumiya.R.layout.search_result_item, viewGroup, false));
    }

    @Override
    public void onViewRecycled(SearchViewHolder searchViewHolder) {
        searchViewHolder.onRecycled();
    }

    public void setData(@Nullable LazyList<SearchGridResult> lazyList) {
        this.data = lazyList;
        notifyDataSetChanged();
    }
}
