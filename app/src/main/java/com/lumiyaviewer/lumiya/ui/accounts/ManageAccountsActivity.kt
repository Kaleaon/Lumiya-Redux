package com.lumiyaviewer.lumiya.ui.accounts

import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.ContextMenu
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity
import com.lumiyaviewer.lumiya.ui.grids.GridList
import com.lumiyaviewer.lumiya.ui.grids.ManageGridsActivity

class ManageAccountsActivity : ThemedActivity(),
    AccountEditDialog.OnAccountEditResultListener,
    AdapterView.OnItemClickListener,
    View.OnClickListener {

    private lateinit var adapter: AccountListAdapter
    private var accountList: AccountList? = null
    private val displayList = mutableListOf<AccountList.AccountInfo>()

    private class AccountListAdapter(
        context: Context,
        list: List<AccountList.AccountInfo>
    ) : ArrayAdapter<AccountList.AccountInfo>(context, R.layout.account_list_item, list) {

        private val gridList = GridList(context)

        override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
            val inflater = LayoutInflater.from(context)
            val view = convertView ?: inflater.inflate(R.layout.account_list_item, parent, false)
            val nameView = view.findViewById<TextView>(R.id.accountNameTextView)
            val gridView = view.findViewById<TextView>(R.id.gridNameTextView)
            val item = getItem(position)
            if (item != null) {
                val gridInfo = gridList.getGridByUUID(item.gridUUID)
                nameView.text = item.loginName
                gridView.text = gridInfo?.gridName ?: ""
            }
            return view
        }

        fun updateGridList() {
            gridList.loadGrids()
        }

        fun updateList() {
            notifyDataSetChanged()
        }
    }

    private fun deleteAccount(accountInfo: AccountList.AccountInfo) {
        accountList?.deleteAccount(accountInfo)
        accountList?.savePreferences()
        accountList?.getAccountList(displayList)
        adapter.updateList()
    }

    private fun showAccountDeleteDialog(accountInfo: AccountList.AccountInfo) {
        AlertDialog.Builder(this)
            .setMessage(getString(R.string.account_delete_confirm_title))
            .setCancelable(true)
            .setPositiveButton("Yes") { dialog, _ ->
                dialog.dismiss()
                deleteAccount(accountInfo)
            }
            .setNegativeButton("No") { dialog, _ -> dialog.cancel() }
            .create()
            .show()
    }

    override fun onAccountEditCancelled() {}

    override fun onAccountEdited(accountInfo: AccountList.AccountInfo, isNew: Boolean) {
        if (isNew) {
            accountList?.addNewAccount(accountInfo)
        }
        accountList?.savePreferences()
        accountList?.getAccountList(displayList)
        adapter.updateList()
        val listView = findViewById<ListView>(R.id.accountList)
        if (listView.adapter.count > 0) {
            listView.setSelection(listView.adapter.count - 1)
        }
    }

    override fun onClick(view: View) {
        when (view.id) {
            R.id.add_new_account_button -> {
                val dialog = AccountEditDialog(this, null)
                dialog.setOnAccountEditResultListener(this)
                dialog.show()
            }
        }
    }

    override fun onContextItemSelected(menuItem: MenuItem): Boolean {
        val info = menuItem.menuInfo as? AdapterView.AdapterContextMenuInfo ?: return super.onContextItemSelected(menuItem)
        val item = adapter.getItem(info.position) ?: return super.onContextItemSelected(menuItem)
        return when (menuItem.itemId) {
            R.id.item_account_edit -> {
                val dialog = AccountEditDialog(this, item)
                dialog.setOnAccountEditResultListener(this)
                dialog.show()
                true
            }
            R.id.item_account_delete -> {
                showAccountDeleteDialog(item)
                true
            }
            else -> super.onContextItemSelected(menuItem)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.manage_accounts)
        accountList = AccountList(this)
        accountList?.getAccountList(displayList)
        adapter = AccountListAdapter(this, displayList)
        val listView = findViewById<ListView>(R.id.accountList)
        listView.adapter = adapter as ListAdapter
        listView.onItemClickListener = this
        findViewById<View>(R.id.add_new_account_button).setOnClickListener(this)
        registerForContextMenu(listView)
    }

    override fun onCreateContextMenu(menu: ContextMenu, view: View, menuInfo: ContextMenu.ContextMenuInfo?) {
        super.onCreateContextMenu(menu, view, menuInfo)
        menuInflater.inflate(R.menu.account_list_context_menu, menu)
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.manage_accounts_menu, menu)
        return true
    }

    override fun onItemClick(parent: AdapterView<*>, view: View, position: Int, id: Long) {
        val item = parent.getItemAtPosition(position)
        if (item is AccountList.AccountInfo) {
            val intent = Intent()
            intent.putExtra("selected_account", item)
            setResult(RESULT_OK, intent)
            finish()
        }
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        return when (menuItem.itemId) {
            R.id.item_manage_grids -> {
                startActivity(Intent(this, ManageGridsActivity::class.java))
                true
            }
            else -> super.onOptionsItemSelected(menuItem)
        }
    }

    override fun onResume() {
        super.onResume()
        adapter.updateGridList()
    }
}
