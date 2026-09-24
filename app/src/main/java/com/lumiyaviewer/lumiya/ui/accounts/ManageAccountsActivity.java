package com.lumiyaviewer.lumiya.ui.accounts;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.ui.accounts.AccountEditDialog;
import com.lumiyaviewer.lumiya.ui.accounts.AccountList;
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity;
import com.lumiyaviewer.lumiya.ui.grids.GridList;
import com.lumiyaviewer.lumiya.ui.grids.ManageGridsActivity;
import java.util.ArrayList;
import java.util.List;

public class ManageAccountsActivity extends ThemedActivity implements AccountEditDialog.OnAccountEditResultListener, AdapterView.OnItemClickListener, View.OnClickListener {
    private AccountListAdapter adapter;
    private AccountList accountList = null;
    private List<AccountList.AccountInfo> displayList = new ArrayList();

    private static class AccountListAdapter extends ArrayAdapter<AccountList.AccountInfo> {
        private GridList gridList;

        AccountListAdapter(Context context, List<AccountList.AccountInfo> list) {
            super(context, R.layout.account_list_item, list);
            this.gridList = new GridList(context);
        }

        @Override
        public View getView(int i, View view, ViewGroup viewGroup) {
            LayoutInflater layoutInflater = (LayoutInflater) getContext().getSystemService("layout_inflater");
            if (view == null) {
                view = layoutInflater.inflate(R.layout.account_list_item, viewGroup, false);
            }
            TextView textView = (TextView) view.findViewById(R.id.accountNameTextView);
            TextView textView2 = (TextView) view.findViewById(R.id.gridNameTextView);
            AccountList.AccountInfo item = getItem(i);
            if (item != null) {
                AccountList.AccountInfo accountInfo = item;
                GridList.GridInfo gridByUUID = this.gridList.getGridByUUID(accountInfo.getGridUUID());
                textView.setText(accountInfo.getLoginName());
                textView2.setText(gridByUUID != null ? gridByUUID.getGridName() : "");
            }
            return view;
        }

        void updateGridList() {
            this.gridList.loadGrids();
        }

        void updateList() {
            super.notifyDataSetChanged();
        }
    }

    private void deleteAccount(AccountList.AccountInfo accountInfo) {
        this.accountList.deleteAccount(accountInfo);
        this.accountList.savePreferences();
        this.accountList.getAccountList(this.displayList);
        this.adapter.updateList();
    }

    private void showAccountDeleteDialog(final AccountList.AccountInfo accountInfo) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(getString(R.string.account_delete_confirm_title)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                ManageAccountsActivity.this.m396xf58c202e((AccountList.AccountInfo) accountInfo, dialogInterface, i);
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

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_accounts_ManageAccountsActivity_6140, reason: not valid java name */
    /* synthetic */ void m396xf58c202e(AccountList.AccountInfo accountInfo, DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        deleteAccount(accountInfo);
    }

    @Override
    public void onAccountEditCancelled() {
    }

    @Override
    public void onAccountEdited(AccountList.AccountInfo accountInfo, boolean z) {
        if (z) {
            this.accountList.addNewAccount(accountInfo);
        }
        this.accountList.savePreferences();
        this.accountList.getAccountList(this.displayList);
        this.adapter.updateList();
        ListView listView = (ListView) findViewById(R.id.accountList);
        if (listView.getAdapter().getCount() > 0) {
            listView.setSelection(listView.getAdapter().getCount() - 1);
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.add_new_account_button:
                AccountEditDialog accountEditDialog = new AccountEditDialog(this, null);
                accountEditDialog.setOnAccountEditResultListener(this);
                accountEditDialog.show();
                break;
        }
    }

    @Override
    public boolean onContextItemSelected(MenuItem menuItem) {
        AccountList.AccountInfo item = this.adapter.getItem(((AdapterView.AdapterContextMenuInfo) menuItem.getMenuInfo()).position);
        if (item != null) {
            AccountList.AccountInfo accountInfo = item;
            switch (menuItem.getItemId()) {
                case R.id.item_account_edit:
                    AccountEditDialog accountEditDialog = new AccountEditDialog(this, accountInfo);
                    accountEditDialog.setOnAccountEditResultListener(this);
                    accountEditDialog.show();
                    return true;
                case R.id.item_account_delete:
                    showAccountDeleteDialog(accountInfo);
                    return true;
            }
        }
        return super.onContextItemSelected(menuItem);
    }

    @Override
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.manage_accounts);
        this.accountList = new AccountList(this);
        this.accountList.getAccountList(this.displayList);
        this.adapter = new AccountListAdapter(this, this.displayList);
        ListView listView = (ListView) findViewById(R.id.accountList);
        listView.setAdapter((ListAdapter) this.adapter);
        listView.setOnItemClickListener(this);
        findViewById(R.id.add_new_account_button).setOnClickListener(this);
        registerForContextMenu(listView);
    }

    @Override
    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        super.onCreateContextMenu(contextMenu, view, contextMenuInfo);
        getMenuInflater().inflate(R.menu.account_list_context_menu, contextMenu);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.manage_accounts_menu, menu);
        return true;
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        Object itemAtPosition = adapterView.getItemAtPosition(i);
        if (itemAtPosition instanceof AccountList.AccountInfo) {
            Intent intent = new Intent();
            intent.putExtra("selected_account", (AccountList.AccountInfo) itemAtPosition);
            setResult(-1, intent);
            finish();
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.item_manage_grids:
                startActivity(new Intent(this, (Class<?>) ManageGridsActivity.class));
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    @Override
    public void onResume() {
        super.onResume();
        this.adapter.updateGridList();
    }
}
