package com.lumiyaviewer.lumiya.ui.search

import android.annotation.SuppressLint
import android.content.Context
import androidx.recyclerview.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import de.greenrobot.dao.query.LazyList
import java.util.UUID

internal open class SearchGridAdapter : RecyclerView.Adapter<SearchGridAdapter.SearchViewHolder>() {
    private UUID agentUUID
    private Context context

    private LazyList<SearchGridResult> data
    private LayoutInflater inflater
    private OnSearchResultClickListener onSearchResultClickListener

    internal interface OnSearchResultClickListener {
        fun onSearchResultClicked(searchGridResult: SearchGridResult)
    }

    internal open class SearchViewHolder : RecyclerView.ViewHolder(), ChatterNameRetriever.OnChatterNameUpdated, View.OnClickListener {
        private ChatterNameRetriever chatterNameRetriever
        TextView resultItemName
        TextView resultMemberCount
        private SearchGridResult searchGridResult
        ChatterPicView userPicView

        internal constructor(view: View) {
            super(view)
            this.chatterNameRetriever = null
            this.resultItemName = view.findViewById(com.lumiyaviewer.lumiya.R.id.result_item_name)
            this.userPicView = view.findViewById(com.lumiyaviewer.lumiya.R.id.userPicView)
            this.resultMemberCount = view.findViewById(com.lumiyaviewer.lumiya.R.id.result_member_count)
            view.setOnClickListener(this)
        }

        @SuppressLint({"DefaultLocale", "SetTextI18n"})
        internal fun bindToData(searchGridResult: SearchGridResult) {
            this.searchGridResult = searchGridResult
            this.resultItemName.setText(searchGridResult.getItemName())
            if (searchGridResult.getItemType() == SearchGridQuery.SearchType.Groups.ordinal()) {
                Integer memberCount = searchGridResult.getMemberCount()
                this.resultMemberCount.setVisibility(View.VISIBLE)
                this.resultMemberCount.setText(Integer.toString(memberCount != null ? memberCount.intValue() : 0))
            } else {
                this.resultMemberCount.setVisibility(View.GONE)
            }
            if (this.chatterNameRetriever != null) {
                this.chatterNameRetriever.dispose()
                this.chatterNameRetriever = null
            }
            if (searchGridResult.getItemType() == SearchGridQuery.SearchType.Groups.ordinal()) {
                this.userPicView.setChatterID(ChatterID.getGroupChatterID(SearchGridAdapter.this.agentUUID, searchGridResult.getItemUUID()), searchGridResult.getItemName())
                this.userPicView.setVisibility(View.VISIBLE)
            } else {
                if (searchGridResult.getItemType() != SearchGridQuery.SearchType.People.ordinal()) {
                    this.userPicView.setVisibility(View.GONE)
                    return
                }
                ChatterID.ChatterIDUser userChatterID = ChatterID.getUserChatterID(SearchGridAdapter.this.agentUUID, searchGridResult.getItemUUID())
                this.userPicView.setChatterID(userChatterID, searchGridResult.getItemName())
                this.userPicView.setVisibility(View.VISIBLE)
                this.chatterNameRetriever = ChatterNameRetriever(userChatterID, this, UIThreadExecutor.getInstance(), false)
                this.chatterNameRetriever.subscribe()
            }
        }

        override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
            String resolvedName
            if (chatterNameRetriever != this.chatterNameRetriever || (resolvedName = chatterNameRetriever.getResolvedName()) == null) {
                return
            }
            this.resultItemName.setText(resolvedName)
        }

        override fun onClick(view: View) {
            if (SearchGridAdapter.this.onSearchResultClickListener == null || this.searchGridResult == null) {
                return
            }
            SearchGridAdapter.this.onSearchResultClickListener.onSearchResultClicked(this.searchGridResult)
        }

        internal fun onRecycled() {
            this.userPicView.setChatterID(null, null)
            if (this.chatterNameRetriever != null) {
                this.chatterNameRetriever.dispose()
                this.chatterNameRetriever = null
            }
            this.searchGridResult = null
        }
    }

    internal constructor(context: Context, uuid: UUID, onSearchResultClickListener: OnSearchResultClickListener) {
        this.context = context
        this.agentUUID = uuid
        this.inflater = LayoutInflater.from(context)
        this.onSearchResultClickListener = onSearchResultClickListener
        setHasStableIds(true)
    }

    override fun getItemCount(): Int {
        if (this.data != null) {
            return this.data.size()
        }
        return 0
    }

    override fun getItemId(i: Int): Long {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return -1L
        }
        return this.data.get(i).getId().longValue()
    }

    override fun onBindViewHolder(searchViewHolder: SearchViewHolder, i: Int) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return
        }
        searchViewHolder.bindToData(this.data.get(i))
    }

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): SearchViewHolder {
        return SearchViewHolder(this.inflater.inflate(com.lumiyaviewer.lumiya.R.layout.search_result_item, viewGroup, false))
    }

    override fun onViewRecycled(searchViewHolder: SearchViewHolder) {
        searchViewHolder.onRecycled()
    }

    open fun setData(lazyList: LazyList<SearchGridResult>) {
        this.data = lazyList
        notifyDataSetChanged()
    }
}
