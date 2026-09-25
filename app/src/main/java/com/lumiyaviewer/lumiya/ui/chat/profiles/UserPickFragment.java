package com.lumiyaviewer.lumiya.ui.chat.profiles;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.databinding.UserPickBinding;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.manager.AvatarPickKey;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.common.TeleportProgressDialog;
import com.lumiyaviewer.lumiya.ui.common.TextFieldDialogBuilder;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import java.util.UUID;

public class UserPickFragment extends FragmentWithTitle {
    private static final String PICK_ID_KEY = "pickID";

    private UserPickBinding binding;

    private final SubscriptionData<AvatarPickKey, PickInfoReply> pickInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            UserPickFragment.this.onPickInfo((PickInfoReply) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private MenuItem menuItemRename = null;
    private MenuItem menuItemDelete = null;

    public UserPickFragment() {
        setArguments(new Bundle());
    }

    private void deletePick() {
        final UserManager userManager = ActivityUtils.getUserManager(getArguments());
        final AvatarPickKey pickKey = getPickKey();
        if (userManager == null || pickKey == null) {
            return;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setMessage(getString(R.string.delete_pick_question)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                UserPickFragment.this.m526xf9701124((UserManager) userManager, (AvatarPickKey) pickKey, dialogInterface, i);
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        });
        builder.create().show();
    }

    private AvatarPickKey getPickKey() {
        return (AvatarPickKey) getArguments().getParcelable(PICK_ID_KEY);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_13525, reason: not valid java name */
    static /* synthetic */ void m523xf970942c(UserManager userManager, AvatarPickKey avatarPickKey, PickInfoReply pickInfoReply, String str) {
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (activeAgentCircuit != null) {
            activeAgentCircuit.getModules().userProfiles.UpdatePickInfo(avatarPickKey.pickID, pickInfoReply.Data_Field.CreatorID, pickInfoReply.Data_Field.ParcelID, str, SLMessage.stringFromVariableUTF(pickInfoReply.Data_Field.Desc), pickInfoReply.Data_Field.SnapshotID, pickInfoReply.Data_Field.PosGlobal, pickInfoReply.Data_Field.SortOrder, pickInfoReply.Data_Field.Enabled);
        }
    }

    public static Bundle makeSelection(UUID uuid, AvatarPickKey avatarPickKey) {
        Bundle bundle = new Bundle();
        bundle.putString("activeAgentUUID", uuid.toString());
        bundle.putParcelable(PICK_ID_KEY, avatarPickKey);
        return bundle;
    }

    public void onPickInfo(PickInfoReply pickInfoReply) {
        if (pickInfoReply != null) {
            LLVector3d lLVector3d = pickInfoReply.Data_Field.PosGlobal;
            Debug.Printf("GlobalPos: got pick global pos %f, %f, %f", Double.valueOf(lLVector3d.x), Double.valueOf(lLVector3d.y), Double.valueOf(lLVector3d.z));
            setTitle(SLMessage.stringFromVariableOEM(pickInfoReply.Data_Field.Name), null);
        }
        updateMenuItems();
        if (getView() == null || pickInfoReply == null) {
            return;
        }
        binding.pickDescription.setText(SLMessage.stringFromVariableUTF(pickInfoReply.Data_Field.Desc));
        binding.userPickImageView.setAssetID(pickInfoReply.Data_Field.SnapshotID);
    }

    private void renamePick() {
        final UserManager userManager = ActivityUtils.getUserManager(getArguments());
        final AvatarPickKey pickKey = getPickKey();
        final PickInfoReply data = this.pickInfo.getData();
        if (userManager == null || pickKey == null || data == null) {
            return;
        }
        TextFieldDialogBuilder textFieldDialogBuilder = new TextFieldDialogBuilder(getContext());
        textFieldDialogBuilder.setTitle(getString(R.string.pick_rename_title));
        textFieldDialogBuilder.setDefaultText(SLMessage.stringFromVariableOEM(data.Data_Field.Name));
        textFieldDialogBuilder.setOnTextEnteredListener(new TextFieldDialogBuilder.OnTextEnteredListener() {
            private final /* synthetic */ void $m$0(String str) {
                UserPickFragment.m523xf970942c((UserManager) userManager, (AvatarPickKey) pickKey, (PickInfoReply) data, str);
            }

            @Override
            public final void onTextEntered(String str) {
                $m$0(str);
            }
        });
        textFieldDialogBuilder.show();
    }

    private void updateMenuItems() {
        boolean z = false;
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        AvatarPickKey pickKey = getPickKey();
        if (userManager != null && pickKey != null) {
            z = userManager.getUserID().equals(pickKey.avatarID);
        }
        if (this.menuItemRename != null) {
            this.menuItemRename.setVisible(z);
        }
        if (this.menuItemDelete != null) {
            this.menuItemDelete.setVisible(z);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_12153, reason: not valid java name */
    /* synthetic */ void m526xf9701124(UserManager userManager, AvatarPickKey avatarPickKey, DialogInterface dialogInterface, int i) {
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (activeAgentCircuit != null) {
            activeAgentCircuit.getModules().userProfiles.DeletePick(avatarPickKey.pickID);
            FragmentActivity activity = getActivity();
            if (activity instanceof DetailsActivity) {
                ((DetailsActivity) activity).closeDetailsFragment(this);
            }
        }
        dialogInterface.dismiss();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_7285, reason: not valid java name */
    /* synthetic */ void m527xdec44802(UserManager userManager, LLVector3 lLVector3, DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (activeAgentCircuit != null) {
            new TeleportProgressDialog(getContext(), userManager, R.string.teleporting_progress_message).show();
            activeAgentCircuit.TeleportToGlobalPosition(lLVector3);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_9741, reason: not valid java name */
    /* synthetic */ void m528xdec54305(UserManager userManager, AvatarPickKey avatarPickKey, PickInfoReply pickInfoReply, DialogInterface dialogInterface, int i) {
        LLVector3d agentGlobalPosition;
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (activeAgentCircuit != null && (agentGlobalPosition = activeAgentCircuit.getAgentGlobalPosition()) != null) {
            Debug.Printf("GlobalPos: setting pick to global pos %f %f %f", Double.valueOf(agentGlobalPosition.x), Double.valueOf(agentGlobalPosition.y), Double.valueOf(agentGlobalPosition.z));
            activeAgentCircuit.getModules().userProfiles.UpdatePickInfo(avatarPickKey.pickID, pickInfoReply.Data_Field.CreatorID, pickInfoReply.Data_Field.ParcelID, SLMessage.stringFromVariableOEM(pickInfoReply.Data_Field.Name), SLMessage.stringFromVariableUTF(pickInfoReply.Data_Field.Desc), pickInfoReply.Data_Field.SnapshotID, agentGlobalPosition, pickInfoReply.Data_Field.SortOrder, pickInfoReply.Data_Field.Enabled);
        }
        dialogInterface.dismiss();
        Toast.makeText(getContext(), R.string.pick_location_set, Toast.LENGTH_SHORT).show();
    }

    protected void onChangePic(View view) {
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        AvatarPickKey pickKey = getPickKey();
        PickInfoReply data = this.pickInfo.getData();
        if (userManager == null || pickKey == null || data == null) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putParcelable("oldPickData", data);
        getContext().startActivity(InventoryActivity.makeSelectActionIntent(getContext(), userManager.getUserID(), InventoryActivity.SelectAction.applyPickImage, bundle, SLAssetType.AT_TEXTURE));
    }

    @Override
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        menuInflater.inflate(R.menu.pick_menu, menu);
        this.menuItemRename = menu.findItem(R.id.item_pick_rename);
        this.menuItemDelete = menu.findItem(R.id.item_pick_delete);
        updateMenuItems();
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        binding = UserPickBinding.inflate(layoutInflater, viewGroup, false);
        binding.changePicButton.setOnClickListener(v -> onChangePic(v));
        binding.userPickSetLocationButton.setOnClickListener(v -> onSetLocation(v));
        binding.userPickDescEditButton.setOnClickListener(v -> onDescEdit(v));
        binding.userPickTeleportButton.setOnClickListener(v -> onTeleportToPickClick(v));
        binding.userPickImageView.setAlignTop(true);
        binding.userPickImageView.setVerticalFit(true);
        return binding.getRoot();
    }

    protected void onDescEdit(View view) {
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        AvatarPickKey pickKey = getPickKey();
        if (userManager == null || pickKey == null) {
            return;
        }
        DetailsActivity.showEmbeddedDetails(getActivity(), PickDescriptionEditFragment.class, PickDescriptionEditFragment.makeSelection(ChatterID.getUserChatterID(userManager.getUserID(), pickKey.avatarID), pickKey));
    }

    @Override
    public void onDestroyView() {
        binding = null;
        super.onDestroyView();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.item_pick_rename:
                renamePick();
                break;
            case R.id.item_pick_delete:
                deletePick();
                break;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    protected void onSetLocation(View view) {
        final UserManager userManager = ActivityUtils.getUserManager(getArguments());
        final AvatarPickKey pickKey = getPickKey();
        final PickInfoReply data = this.pickInfo.getData();
        if (userManager == null || pickKey == null || data == null) {
            return;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setMessage(getString(R.string.set_pick_location_question)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                UserPickFragment.this.m528xdec54305((UserManager) userManager, (AvatarPickKey) pickKey, (PickInfoReply) data, dialogInterface, i);
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        });
        builder.create().show();
    }

    @Override
    public void onStart() {
        super.onStart();
        setTitle(getString(R.string.name_loading_title), null);
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (userManager == null) {
            this.pickInfo.unsubscribe();
            return;
        }
        AvatarPickKey pickKey = getPickKey();
        boolean equals = userManager.getUserID().equals(pickKey.avatarID);
        binding.userPickDescEditButton.setVisibility(equals ? View.VISIBLE : View.GONE);
        binding.changePicButton.setVisibility(equals ? View.VISIBLE : View.GONE);
        binding.userPickSetLocationButton.setVisibility(equals ? View.VISIBLE : View.GONE);
        this.pickInfo.subscribe(userManager.getAvatarPickInfos().getPool(), pickKey);
    }

    @Override
    public void onStop() {
        this.pickInfo.unsubscribe();
        super.onStop();
    }

    protected void onTeleportToPickClick(View view) {
        final UserManager userManager = ActivityUtils.getUserManager(getArguments());
        PickInfoReply data = this.pickInfo.getData();
        if (data == null || userManager == null) {
            return;
        }
        final LLVector3 lLVector3 = new LLVector3((float) data.Data_Field.PosGlobal.x, (float) data.Data_Field.PosGlobal.y, (float) data.Data_Field.PosGlobal.z);
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setMessage(getActivity().getString(R.string.teleport_pick_confirm_title)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                UserPickFragment.this.m527xdec44802((UserManager) userManager, (LLVector3) lLVector3, dialogInterface, i);
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        });
        builder.create().show();
    }
}
