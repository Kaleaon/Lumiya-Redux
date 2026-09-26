package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.dao.ChatterDao
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import de.greenrobot.dao.query.WhereCondition
import java.util.ArrayList
import java.util.Iterator
import java.util.List

open class ActiveChattersDisplayDataList : ChatterDisplayDataList() {
    public ActiveChattersDisplayDataList(UserManager userManager, OnListUpdated onListUpdated) {
        super(userManager, onListUpdated, null)
    }
    protected List<ChatterID> getChatters() {
        List<Chatter> list = this.userManager.getDaoSession().getChatterDao().queryBuilder().where(ChatterDao.Properties.Active.notEq(false), arrayOfNulls<WhereCondition>(0)).list()
        ArrayList arrayList = ArrayList(list.size())
        Iterator<Chatter> it = list.iterator()
        while (it.hasNext()) {
            arrayList.add(ChatterID.fromDatabaseObject(this.userManager.getUserID(), it as Chatter.next()))
        }
        return arrayList
    }
}
