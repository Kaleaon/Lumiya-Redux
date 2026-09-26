package com.lumiyaviewer.lumiya.ui.inventory

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.core.view.MenuItemCompat
import androidx.appcompat.widget.SearchView
import android.view.Menu
import android.view.MenuItem
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class InventoryActivity : MasterDetailsActivity() {
    private static String INITIAL_FOLDER_ID_TAG = "folderID"
    private static String NAME_FILTER_TAG = "nameFilter"
    static String SAVE_INFO_INTENT_TAG = "forSaveInfo"
    private static String SEARCH_ACTIVE_TAG = "searchActive"
    static String SELECT_ACTION_ASSET_TYPE = "selectActionAssetType"
    static String SELECT_ACTION_INTENT_TAG = "selectAction"
    static String SELECT_ACTION_PARAMS_TAG = "selectActionParams"
    static String SELECT_ITEM_INTENT_TAG = "forSelectItem"
    static String TRANSFER_TO_INTENT_TAG = "transferToID"
    static String TRANSFER_TO_NAME_TAG = "transferToName"
    private MenuItem searchMenuItem = null
    private boolean searchActive = false
    private boolean activityStarted = false
    private String nameFilter = null
    private String fragmentSearchString = null
    private SubscriptionData<SubscriptionSingleKey, Boolean> searchProcess = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private FragmentActivityFactory InventoryDetailsFragmentFactory = FragmentActivityFactory() {
        override fun createIntent(context: Context, bundle: Bundle): Intent {
            Intent intent = Intent(context, (Class<?>) InventoryActivity.class)
            intent.putExtra(MasterDetailsActivity.INTENT_SELECTION_KEY, bundle)
            return intent
        }

        override fun getFragmentClass(): Class<? extends Fragment> {
            return InventoryFragment.class
        }
    }

    enum class SelectAction {
        applyUserProfile(R.string.select_picture_subtitle),
        applyFirstLife(R.string.select_picture_subtitle),
        applyPickImage(R.string.select_picture_subtitle)

        public int subtitleResourceId

        internal constructor(subtitleResourceId: Int) {
            this.subtitleResourceId = subtitleResourceId
        }

    }

    @JvmStatic
    fun makeFolderIntent(context: Context, uuid: UUID, uuid2: UUID): Intent {
        Intent intent = Intent(context, (Class<?>) InventoryActivity.class)
        intent.putExtra("activeAgentUUID", uuid.toString())
        intent.putExtra(INITIAL_FOLDER_ID_TAG, uuid2.toString())
        return intent
    }

    @JvmStatic
    fun makeSaveItemIntent(context: Context, uuid: UUID, inventorySaveInfo: InventorySaveInfo): Intent {
        Intent intent = Intent(context, (Class<?>) InventoryActivity.class)
        intent.putExtra("activeAgentUUID", uuid.toString())
        intent.putExtra(SAVE_INFO_INTENT_TAG, inventorySaveInfo)
        return intent
    }

    @JvmStatic
    fun makeSelectActionIntent(context: Context, uuid: UUID, selectAction: SelectAction, bundle: Bundle, assetType: SLAssetType): Intent {
        Intent intent = Intent(context, (Class<?>) InventoryActivity.class)
        intent.putExtra("activeAgentUUID", uuid.toString())
        intent.putExtra(SELECT_ITEM_INTENT_TAG, true)
        intent.putExtra(SELECT_ACTION_INTENT_TAG, selectAction.toString())
        intent.putExtra(SELECT_ACTION_PARAMS_TAG, bundle)
        internal fun if(null: assetType !=):  {
            intent.putExtra(SELECT_ACTION_ASSET_TYPE, assetType.getTypeCode())
        }
        return intent
    }

    @JvmStatic
    fun makeSelectIntent(context: Context, uuid: UUID): Intent {
        Intent intent = Intent(context, (Class<?>) InventoryActivity.class)
        intent.putExtra("activeAgentUUID", uuid.toString())
        intent.putExtra(SELECT_ITEM_INTENT_TAG, true)
        return intent
    }

    @JvmStatic
    fun makeTransferIntent(context: Context, uuid: UUID, uuid2: UUID, str: String): Intent {
        Intent intent = Intent(context, (Class<?>) InventoryActivity.class)
        intent.putExtra("activeAgentUUID", uuid.toString())
        intent.putExtra(SELECT_ITEM_INTENT_TAG, true)
        intent.putExtra(TRANSFER_TO_INTENT_TAG, uuid2.toString())
        internal fun if(null: str !=):  {
            intent.putExtra(TRANSFER_TO_NAME_TAG, str)
        }
        return intent
    }

    private fun selectSortOrder() {
        int sortOrder = InventoryFragmentHelper.getSortOrder(this)
        AlertDialog.Builder builder = new AlertDialog.Builder(this)
        builder.setTitle(R.string.sort_order_caption)
        builder.setSingleChoiceItems(arrayOfNulls<CharSequence>(]{"Newest first", "Alphabetical"}, sortOrder, new DialogInterface.OnClickListener() {
                InventoryActivity.this.m599xeedaf4f8(sortOrder, dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
            }
        }
        return InventoryFragment.newInstance(bundle, true)
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        getMenuInflater().inflate(R.menu.inventory_menu, menu)
        this.searchMenuItem = menu.findItem(R.id.inventory_search_item)
        SearchView searchView = (SearchView) MenuItemCompat.getActionView(this.searchMenuItem)
        internal fun if(this.searchActive):  {
            MenuItemCompat.expandActionView(this.searchMenuItem)
            searchView.setQuery(this.nameFilter, false)
        }
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            override fun onQueryTextChange(str: String): Boolean {
                InventoryActivity.this.nameFilter = str
                InventoryActivity.this.updateSearchAction()
                return true
            }

            override fun onQueryTextSubmit(str: String): Boolean {
                return true
            }
        })
        MenuItemCompat.setOnActionExpandListener(this.searchMenuItem, new MenuItemCompat.OnActionExpandListener() {
            override fun onMenuItemActionCollapse(menuItem: MenuItem): Boolean {
                InventoryActivity.this.searchActive = false
                InventoryActivity.this.updateSearchAction()
                return true
            }

            override fun onMenuItemActionExpand(menuItem: MenuItem): Boolean {
                InventoryActivity.this.searchActive = true
                InventoryActivity.this.updateSearchAction()
                return true
            }
        })
        return true
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        when (menuItem.getItemId()) {
            R.id.item_sort_order -> {
                selectSortOrder()
                return true
            else -> {
                return super.onOptionsItemSelected(menuItem)
        }
    }

    override protected fun onSaveInstanceState(bundle: Bundle) {
        super.onSaveInstanceState(bundle)
        internal fun if(null: bundle !=):  {
            bundle.putBoolean(SEARCH_ACTIVE_TAG, this.searchActive)
            bundle.putString(NAME_FILTER_TAG, this.nameFilter)
        }
    }

    override protected fun onStart() {
        super.onStart()
        this.activityStarted = true
        updateSearchAction()
    }

    override protected fun onStop() {
        this.activityStarted = false
        updateSearchAction()
        super.onStop()
    }
}
