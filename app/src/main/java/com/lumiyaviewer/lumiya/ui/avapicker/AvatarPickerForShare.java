package com.lumiyaviewer.lumiya.ui.avapicker;

import android.os.Bundle;
import androidx.fragment.app.FragmentActivity;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryFragmentHelper;
import java.util.UUID;
import javax.annotation.Nullable;

public class AvatarPickerForShare extends AvatarPickerFragment {
    private static final String INVENTORY_ENTRY_KEY = "inventoryEntry";
    private final InventoryFragmentHelper inventoryFragmentHelper = new InventoryFragmentHelper(this);

    public static Bundle makeArguments(UUID uuid, SLInventoryEntry sLInventoryEntry) {
        Bundle bundle = new Bundle();
        bundle.putString("activeAgentUUID", uuid.toString());
        bundle.putParcelable(INVENTORY_ENTRY_KEY, sLInventoryEntry);
        return bundle;
    }

    @Override
    public String getTitle() {
        return getString(R.string.share_with_title);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_avapicker_AvatarPickerForShare_1468, reason: not valid java name */
    /* synthetic */ void m397xf146b8d7() {
        FragmentActivity activity = getActivity();
        if (activity instanceof DetailsActivity) {
            ((DetailsActivity) activity).closeDetailsFragment(this);
        }
    }

    @Override
    protected void onAvatarSelected(ChatterID chatterID, @Nullable String str) {
        Bundle arguments = getArguments();
        if (arguments == null || !arguments.containsKey(INVENTORY_ENTRY_KEY)) {
            return;
        }
        this.inventoryFragmentHelper.ConfirmShareInventoryEntry((SLInventoryEntry) arguments.getParcelable(INVENTORY_ENTRY_KEY), chatterID, str, new Runnable() {
            private final /* synthetic */ void $m$0() {
                AvatarPickerForShare.this.m397xf146b8d7();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }
}
