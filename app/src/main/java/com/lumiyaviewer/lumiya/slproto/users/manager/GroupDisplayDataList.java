package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;

class GroupDisplayDataList extends ChatterDisplayDataList {
    public GroupDisplayDataList(@Nonnull UserManager userManager, OnListUpdated onListUpdated) {
        super(userManager, onListUpdated, null);
    }

    @Override
    protected List<ChatterID> getChatters() {
        AvatarGroupList avatarGroupList = this.userManager.getChatterList().getGroupManager().getAvatarGroupList();
        if (avatarGroupList == null) {
            return ImmutableList.of();
        }
        ImmutableList.Builder builder = new ImmutableList.Builder();
        Iterator<AvatarGroupList.AvatarGroupEntry> it = avatarGroupList.Groups.values().iterator();
        while (it.hasNext()) {
            builder.add(ChatterID.getGroupChatterID(this.userManager.getUserID(), it.next().GroupID));
        }
        return builder.build();
    }
}
