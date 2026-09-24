package com.lumiyaviewer.lumiya.ui.chat.profiles;

import android.content.Context;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarNotesReply;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.BackButtonHandler;
import com.lumiyaviewer.lumiya.ui.common.TextFieldEditFragment;
import java.util.UUID;
import javax.annotation.Nullable;

public class UserNotesEditFragment extends TextFieldEditFragment implements BackButtonHandler {
    private Subscription<UUID, AvatarNotesReply> avatarNotesSubscription = null;

    public void onAvatarNotes(AvatarNotesReply avatarNotesReply) {
        setOriginalText(SLMessage.stringFromVariableUTF(avatarNotesReply.Data_Field.Notes).trim());
    }

    @Override
    protected String decorateFragmentTitle(String str) {
        return getString(R.string.notes_for_title, str);
    }

    @Override
    protected String getFieldHint(Context context) {
        return context.getString(R.string.user_notes_hint);
    }

    @Override
    protected void onShowUser(@Nullable ChatterID chatterID) {
        if (this.avatarNotesSubscription != null) {
            this.avatarNotesSubscription.unsubscribe();
            this.avatarNotesSubscription = null;
        }
        if (this.userManager == null || !(chatterID instanceof ChatterID.ChatterIDUser)) {
            return;
        }
        this.avatarNotesSubscription = this.userManager.getAvatarNotes().getPool().subscribe(((ChatterID.ChatterIDUser) chatterID).getChatterUUID(), UIThreadExecutor.getInstance(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                UserNotesEditFragment.this.onAvatarNotes((AvatarNotesReply) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
    }

    @Override
    protected void saveEditedText(SLAgentCircuit agentCircuit, ChatterID chatterID, String str) {
        agentCircuit.getModules().userProfiles.SaveUserNotes(chatterID.getOptionalChatterUUID(), str);
    }
}
