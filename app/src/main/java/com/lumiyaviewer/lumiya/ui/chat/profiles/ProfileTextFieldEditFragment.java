package com.lumiyaviewer.lumiya.ui.chat.profiles;

import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.TextFieldEditFragment;
import java.util.UUID;
import javax.annotation.Nullable;

public abstract class ProfileTextFieldEditFragment extends TextFieldEditFragment {
    private Subscription<UUID, AvatarPropertiesReply> avatarProperties = null;

    public abstract void onAvatarProperties(AvatarPropertiesReply avatarPropertiesReply);

    @Override
    protected void onShowUser(@Nullable ChatterID chatterID) {
        if (this.avatarProperties != null) {
            this.avatarProperties.unsubscribe();
            this.avatarProperties = null;
        }
        if (this.userManager == null || !(chatterID instanceof ChatterID.ChatterIDUser)) {
            return;
        }
        this.avatarProperties = this.userManager.getAvatarProperties().getPool().subscribe(((ChatterID.ChatterIDUser) chatterID).getChatterUUID(), UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                ProfileTextFieldEditFragment.this.onAvatarProperties((AvatarPropertiesReply) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
    }
}
