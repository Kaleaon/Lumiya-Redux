package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.dao.Friend
import com.lumiyaviewer.lumiya.dao.FriendDao
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import de.greenrobot.dao.query.WhereCondition
import java.util.ArrayList
import java.util.Iterator
import java.util.List

open class FriendDisplayDataList : ChatterDisplayDataList() {
    private var onlineFriends: Boolean = false

    constructor(userManager: UserManager, onListUpdated: OnListUpdated, onlineFriends: Boolean) : super(userManager, onListUpdated, null) {
        this.onlineFriends = onlineFriends
    }
    protected fun getChatters(): MutableList<ChatterID> {
        var list: MutableList<Friend> = if (this.onlineFriends) this.userManager.getDaoSession().getFriendDao().queryBuilder().where(FriendDao.Properties.IsOnline.eq(true), arrayOfNulls<WhereCondition>(0)).list() else this.userManager.getDaoSession().getFriendDao().loadAll()
        var arrayList: ArrayList = ArrayList(list.size())
        var it: Iterator<Friend> = list.iterator()
        while (it.hasNext()) {
            arrayList.add(ChatterID.getUserChatterID(this.userManager.getUserID(), (it as Friend.next()).getUuid()))
        }
        return arrayList
    }
}
