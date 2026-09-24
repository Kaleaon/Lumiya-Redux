package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

@NotThreadSafe
class ChatterGroupSubscription extends ChatterSubscription {

    @Nonnull
    private final Subscription<UUID, GroupProfileReply> groupProfileSubscription;

    ChatterGroupSubscription(@Nonnull SortedChatterList sortedChatterList, ChatterID.ChatterIDGroup chatterIDGroup, @Nonnull UserManager userManager) {
        super(sortedChatterList, chatterIDGroup, userManager);
        this.groupProfileSubscription = userManager.getCachedGroupProfiles().getPool().subscribe(chatterIDGroup.getChatterUUID(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                ChatterGroupSubscription.this.onGroupProfile((GroupProfileReply) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
    }

    public void onGroupProfile(GroupProfileReply groupProfileReply) {
        String stringFromVariableOEM = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name);
        if (Objects.equal(stringFromVariableOEM, this.displayData.displayName)) {
            return;
        }
        setChatterDisplayData(this.displayData.withDisplayName(stringFromVariableOEM));
    }

    @Override
    public void unsubscribe() {
        this.groupProfileSubscription.unsubscribe();
        super.unsubscribe();
    }
}
