package com.lumiyaviewer.lumiya.ui.search

import android.annotation.SuppressLint
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import de.greenrobot.dao.query.LazyList
import java.util.UUID

internal open class SearchGridAdapter(
    private val context: Context,
    private val agentUUID: UUID,
    private val onSearchResultClickListener: OnSearchResultClickListener?
) : RecyclerView.Adapter<SearchGridAdapter.SearchViewHolder>() {

    private val inflater: LayoutInflater = LayoutInflater.from(context)
    private var data: LazyList<SearchGridResult>? = null

    init {
        setHasStableIds(true)
    }

    internal interface OnSearchResultClickListener {
        fun onSearchResultClicked(searchGridResult: SearchGridResult)
    }

    internal inner class SearchViewHolder(view: View) :
        RecyclerView.ViewHolder(view),
        ChatterNameRetriever.OnChatterNameUpdated,
        View.OnClickListener {

        private var chatterNameRetriever: ChatterNameRetriever? = null
        val resultItemName: TextView = view.findViewById(R.id.result_item_name)
        val resultMemberCount: TextView = view.findViewById(R.id.result_member_count)
        val userPicView: ChatterPicView = view.findViewById(R.id.userPicView)
        private var searchGridResult: SearchGridResult? = null

        init {
            view.setOnClickListener(this)
        }

        @SuppressLint("DefaultLocale", "SetTextI18n")
        internal fun bindToData(searchGridResult: SearchGridResult) {
            this.searchGridResult = searchGridResult
            val itemName = searchGridResult.itemName
            this.resultItemName.text = itemName
            if (searchGridResult.itemType == SearchGridQuery.SearchType.Groups.ordinal) {
                val memberCount = searchGridResult.memberCount
                this.resultMemberCount.visibility = View.VISIBLE
                this.resultMemberCount.text = (memberCount ?: 0).toString()
            } else {
                this.resultMemberCount.visibility = View.GONE
            }

            chatterNameRetriever?.dispose()
            chatterNameRetriever = null

            val itemUUID = searchGridResult.itemUUID
            if (itemUUID != null) {
                if (searchGridResult.itemType == SearchGridQuery.SearchType.Groups.ordinal) {
                    this.userPicView.setChatterID(ChatterID.getGroupChatterID(agentUUID, itemUUID), itemName)
                    this.userPicView.visibility = View.VISIBLE
                } else if (searchGridResult.itemType == SearchGridQuery.SearchType.People.ordinal) {
                    val userChatterID = ChatterID.getUserChatterID(agentUUID, itemUUID)
                    this.userPicView.setChatterID(userChatterID, itemName)
                    this.userPicView.visibility = View.VISIBLE
                    val retriever = ChatterNameRetriever(userChatterID, this, UIThreadExecutor.getInstance(), false)
                    this.chatterNameRetriever = retriever
                    retriever.subscribe()
                } else {
                    this.userPicView.visibility = View.GONE
                }
            } else {
                this.userPicView.visibility = View.GONE
            }
        }

        override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
            if (chatterNameRetriever != this.chatterNameRetriever) return
            val resolvedName = chatterNameRetriever.getResolvedName() ?: return
            this.resultItemName.text = resolvedName
        }

        override fun onClick(view: View) {
            val result = this.searchGridResult ?: return
            onSearchResultClickListener?.onSearchResultClicked(result)
        }

        internal fun onRecycled() {
            this.userPicView.setChatterID(null, null)
            this.chatterNameRetriever?.dispose()
            this.chatterNameRetriever = null
            this.searchGridResult = null
        }
    }

    override fun getItemCount(): Int = data?.size ?: 0

    override fun getItemId(position: Int): Long {
        val currentData = data
        if (currentData == null || position < 0 || position >= currentData.size) {
            return -1L
        }
        return currentData[position].id ?: -1L
    }

    override fun onBindViewHolder(holder: SearchViewHolder, position: Int) {
        val currentData = data
        if (currentData == null || position < 0 || position >= currentData.size) {
            return
        }
        holder.bindToData(currentData[position])
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): SearchViewHolder {
        return SearchViewHolder(inflater.inflate(R.layout.search_result_item, parent, false))
    }

    override fun onViewRecycled(holder: SearchViewHolder) {
        holder.onRecycled()
    }

    open fun setData(lazyList: LazyList<SearchGridResult>) {
        this.data = lazyList
        notifyDataSetChanged()
    }
}
