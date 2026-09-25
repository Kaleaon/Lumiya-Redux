package com.lumiyaviewer.lumiya.ui.chat;

import android.content.Intent;
import android.os.Bundle;
import androidx.fragment.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.databinding.GroupNoticeBinding;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryFragment;
import javax.annotation.Nullable;

public class GroupNoticeFragment extends ChatterFragment {
    private static final String ATTACHED_ENTRY_KEY = "attachedEntry";
    private static final int ITEM_FOR_ATTACH_REQUEST = 1;

    private GroupNoticeBinding binding;
    private SLInventoryEntry attachedEntry = null;

    private void updateAttachedEntry() {
        Debug.Printf("GroupNotice: current attached entry %s", this.attachedEntry);
        if (this.binding != null) {
            if (this.attachedEntry == null) {
                this.binding.groupNoticeAttachmentText.setText(R.string.group_notice_no_attachment);
                this.binding.groupNoticeAttachmentButton.setText(R.string.group_notice_attach);
            } else {
                this.binding.groupNoticeAttachmentText.setText(this.attachedEntry.name);
                this.binding.groupNoticeAttachmentButton.setText(R.string.group_notice_remove_attachment);
            }
        }
    }

    @Override
    protected String decorateFragmentTitle(String str) {
        return getString(R.string.group_notice_title_format, str);
    }

    @Override
    public void onActivityResult(int i, int i2, Intent intent) {
        switch (i) {
            case 1:
                if (i2 == -1 && intent.hasExtra(InventoryFragment.SELECTED_INVENTORY_ENTRY)) {
                    this.attachedEntry = (SLInventoryEntry) intent.getParcelableExtra(InventoryFragment.SELECTED_INVENTORY_ENTRY);
                    Debug.Printf("GroupNotice: new attached entry %s", this.attachedEntry);
                    updateAttachedEntry();
                    break;
                }
                break;
            default:
                super.onActivityResult(i, i2, intent);
                break;
        }
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        this.binding = GroupNoticeBinding.inflate(layoutInflater, viewGroup, false);
        if (bundle != null) {
            if (bundle.containsKey(ATTACHED_ENTRY_KEY)) {
                this.attachedEntry = (SLInventoryEntry) bundle.getParcelable(ATTACHED_ENTRY_KEY);
                Debug.Printf("GroupNotice: restored state attached entry %s", this.attachedEntry);
            } else {
                Debug.Printf("GroupNotice: restored state no entry", new Object[0]);
            }
        }
        this.binding.groupNoticeAttachmentButton.setOnClickListener(v -> onGroupNoticeAttachmentButton());
        this.binding.groupNoticeSendButton.setOnClickListener(v -> onGroupNoticeSendButton());
        updateAttachedEntry();
        return this.binding.getRoot();
    }

    @Override
    public void onDestroyView() {
        this.binding = null;
        super.onDestroyView();
    }

    public void onGroupNoticeAttachmentButton() {
        Debug.Printf("GroupNotice: current attached entry %s", this.attachedEntry);
        if (this.attachedEntry != null) {
            this.attachedEntry = null;
            updateAttachedEntry();
        } else if (this.userManager != null) {
            startActivityForResult(InventoryActivity.makeSelectIntent(getContext(), this.userManager.getUserID()), 1);
        }
    }

    public void onGroupNoticeSendButton() {
        SLAgentCircuit activeAgentCircuit;
        if (this.userManager == null || !(this.chatterID instanceof ChatterID.ChatterIDGroup) || (activeAgentCircuit = this.userManager.getActiveAgentCircuit()) == null) {
            return;
        }
        activeAgentCircuit.getModules().groupManager.SendGroupNotice(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID(), this.binding.groupNoticeSubject.getText().toString(), this.binding.groupNoticeEditText.getText().toString(), this.attachedEntry);
        FragmentActivity activity = getActivity();
        if (activity instanceof DetailsActivity) {
            ((DetailsActivity) activity).closeDetailsFragment(this);
        }
    }

    @Override
    public void onSaveInstanceState(Bundle bundle) {
        Debug.Printf("GroupNotice: saved state attached entry %s", this.attachedEntry);
        if (bundle != null) {
            bundle.putParcelable(ATTACHED_ENTRY_KEY, this.attachedEntry);
        }
        super.onSaveInstanceState(bundle);
    }

    @Override
    protected void onShowUser(@Nullable ChatterID chatterID) {
    }
}
