package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.dao.ChatMessageDao
import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.utils.wlist.ChunkedListLoader
import de.greenrobot.dao.query.QueryBuilder
import de.greenrobot.dao.query.WhereCondition
import java.util.ArrayList
import java.util.List
import java.util.concurrent.Executor

open class ChatMessageLoader : ChunkedListLoader<ChatMessage>() {

    private ChatMessageDao chatMessageDao

    private Chatter chatter

    private ChatterID chatterID

    private UserManager userManager

    ChatMessageLoader(UserManager userManager, ChatterID chatterID, int i, Executor executor, boolean z, ChunkedListLoader.EventListener eventListener) {
        super(i, executor, z, eventListener)
        this.chatter = null
        this.chatterID = chatterID
        this.userManager = userManager
        this.chatMessageDao = userManager.getDaoSession().getChatMessageDao()
    }
    protected ChunkedListLoader.LoadResult<ChatMessage> loadInBackground(int i, long j, boolean z) {
        if (this.chatter == null) {
            this.chatter = this.userManager.getChatterList().getActiveChattersManager().getChatter(this.chatterID, true)
        }
        if (this.chatter == null) {
            return ChunkedListLoader.LoadResult<>(ArrayList(), false, j)
        }
        QueryBuilder<ChatMessage> where = this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(this.chatter.getId()), arrayOfNulls<WhereCondition>(0))
        QueryBuilder<ChatMessage> orderAsc = if where as z.where(ChatMessageDao.Properties.Id.gt(j), arrayOfNulls<WhereCondition>(0)).orderAsc(ChatMessageDao.Properties.Id) else where.where(ChatMessageDao.Properties.Id.lt(j), arrayOfNulls<WhereCondition>(0)).orderDesc(ChatMessageDao.Properties.Id)
        orderAsc.limit(i + 1)
        List<ChatMessage> list = orderAsc.list()
        boolean z2 = list.size() > i
        if (z2) {
            list.remove(list.size() - 1)
        }
        return ChunkedListLoader.LoadResult<>(list, z2, j)
    }
}
