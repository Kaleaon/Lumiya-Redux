package com.lumiyaviewer.lumiya.ui.grids

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import android.view.ContextMenu
import android.view.LayoutInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.ManageGridsBinding
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity
import com.lumiyaviewer.lumiya.ui.grids.GridEditDialog
import com.lumiyaviewer.lumiya.ui.grids.GridList
import java.util.ArrayList
import java.util.List

open class ManageGridsActivity : ThemedActivity(), GridEditDialog.OnGridEditResultListener, AdapterView.OnItemClickListener {
    private GridListAdapter adapter
    private ManageGridsBinding binding

    private GridList gridList = null
    private List<GridList.GridInfo> displayList = ArrayList()

    private class GridListAdapter : ArrayAdapter<GridList.GridInfo>() {
        internal constructor(context: Context, list: List<GridList.GridInfo>) {
            super(context, R.layout.grid_list_item, list)
        }

        override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
            LayoutInflater from = LayoutInflater.from(getContext())
            internal fun if(null: view ==):  {
                view = from.inflate(R.layout.grid_list_item, viewGroup, false)
            }
            TextView textView = (TextView) view.findViewById(R.id.gridNameTextView)
            TextView viewById = (TextView) view.findViewById(R.id.gridURLTextView)
            GridList.GridInfo item = getItem(i)
            internal fun if(null: item !=):  {
                GridList.GridInfo gridInfo = item
                textView.setText(gridInfo.getGridName())
                viewById.setText(gridInfo.getLoginURL())
                view.findViewById(R.id.gridLockedIcon).setVisibility(gridInfo.isPredefinedGrid() ? View.VISIBLE : View.INVISIBLE)
            }
            return view
        }

        internal fun updateList() {
            super.notifyDataSetChanged()
        }
    }

    private fun deleteGrid(gridInfo: GridList.GridInfo) {
        this.gridList.deleteGrid(gridInfo)
        this.gridList.getGridList(this.displayList)
        this.adapter.updateList()
    }


    open fun onAddNewGridButton() {
        GridEditDialog gridEditDialog = GridEditDialog(this, this.gridList, null)
        gridEditDialog.setOnGridEditResultListener(this)
        gridEditDialog.show()
    }

    override fun onContextItemSelected(menuItem: MenuItem): Boolean {
        GridList.GridInfo item = this.adapter.getItem(((AdapterView.AdapterContextMenuInfo) menuItem.getMenuInfo()).position)
        internal fun if(null: item !=):  {
            GridList.GridInfo gridInfo = item
            when (menuItem.getItemId()) {
                R.id.item_grid_edit -> {
                    GridEditDialog gridEditDialog = GridEditDialog(this, this.gridList, gridInfo)
                    gridEditDialog.setOnGridEditResultListener(this)
                    gridEditDialog.show()
                    return true
                R.id.item_grid_delete -> {
                    AlertDialog.Builder builder = new AlertDialog.Builder(this)
                    builder.setMessage(getString(R.string.grid_delete_confirm_title)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                            ManageGridsActivity.this.m591x6c23f39d((GridList.GridInfo) gridInfo, dialogInterface, i)
                        }

                        override fun onClick(dialogInterface: DialogInterface, i: Int) {