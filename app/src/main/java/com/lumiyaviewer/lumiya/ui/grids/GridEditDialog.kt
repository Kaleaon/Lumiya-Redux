package com.lumiyaviewer.lumiya.ui.grids

import android.content.Context
import android.os.Bundle
import androidx.appcompat.app.AppCompatDialog
import android.view.View
import android.widget.Button
import android.widget.CheckBox
import android.widget.TextView
import android.widget.Toast
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.grids.GridList
import java.util.UUID

open class GridEditDialog : AppCompatDialog(), View.OnClickListener {
    private GridList.GridInfo editGrid
    private GridList gridList
    private OnGridEditResultListener onGridEditResultListener

    interface OnGridEditResultListener {
        fun onGridAdded(gridInfo: GridList.GridInfo, z: Boolean)

        fun onGridDeleted(gridInfo: GridList.GridInfo)

        fun onGridEditCancelled()
    }

    constructor(context: Context, gridList: GridList, gridInfo: GridList.GridInfo) {
        super(context)
        this.onGridEditResultListener = null
        this.gridList = null
        this.editGrid = null
        this.gridList = gridList
        this.editGrid = gridInfo
    }

    private fun prepare() {
        if (this.editGrid != null) {
            ((TextView) findViewById(R.id.gridNameText)).setText(this.editGrid.getGridName())
            ((TextView) findViewById(R.id.gridLoginURIText)).setText(this.editGrid.getLoginURL())
            ((CheckBox) findViewById(R.id.gridAllowUntrustedCerts)).setChecked(this.editGrid.getAllowUntrustedCertificates())
            ((Button) findViewById(R.id.okButton)).setText(R.string.save_changes)
            findViewById(R.id.deleteButton).setVisibility(View.VISIBLE)
            setTitle(R.string.edit_grid_dialog_title)
        } else {
            ((TextView) findViewById(R.id.gridNameText)).setText("")
            ((TextView) findViewById(R.id.gridLoginURIText)).setText("")
            ((CheckBox) findViewById(R.id.gridAllowUntrustedCerts)).setChecked(false)
            ((Button) findViewById(R.id.okButton)).setText(R.string.add_new_grid)
            findViewById(R.id.deleteButton).setVisibility(View.GONE)
            setTitle(R.string.new_grid_dialog_title)
        }
        findViewById(R.id.gridNameText).requestFocus()
    }

    override fun onClick(view: View) {
        boolean z = false
        when (view.getId()) {
            R.id.okButton -> {
                String charSequence = ((TextView) findViewById(R.id.gridNameText)).getText().toString()
                String text = ((TextView) findViewById(R.id.gridLoginURIText)).getText().toString()
                boolean allowUntrustedCerts = ((CheckBox) findViewById(R.id.gridAllowUntrustedCerts)).isChecked()
                if (!charSequence == ("")) {
                    if (!text == ("")) {
                        GridList.GridInfo gridByName = this.gridList.getGridByName(charSequence)
                        if (gridByName != null && gridByName != this.editGrid) {
                            Toast.makeText(getContext(), getContext().getString(R.string.grid_exists_error), Toast.LENGTH_SHORT).show()
                            }
                        } else {
                            dismiss()
                            if (this.onGridEditResultListener != null) {
                                GridList.GridInfo gridInfo = this.editGrid
                                if (gridInfo == null) {
                                    gridInfo = GridList.GridInfo(charSequence, text, false, UUID.randomUUID())
                                    z = true
                                } else {
                                    gridInfo.setGridName(charSequence)
                                    gridInfo.setLoginURL(text)
                                }
                                gridInfo.setAllowUntrustedCertificates(allowUntrustedCerts)
                                this.onGridEditResultListener.onGridAdded(gridInfo, z)
                                }
                            }
                        }
                    } else {
                        Toast.makeText(getContext(), getContext().getString(R.string.grid_uri_empty_error), Toast.LENGTH_SHORT).show()
                        }
                    }
                } else {
                    Toast.makeText(getContext(), getContext().getString(R.string.grid_name_empty_error), Toast.LENGTH_SHORT).show()
                    }
                }
                }
            R.id.cancelButton -> {
                dismiss()
                if (this.onGridEditResultListener != null) {
                    this.onGridEditResultListener.onGridEditCancelled()
                    }
                }
                }
            R.id.deleteButton -> {
                dismiss()
                if (this.onGridEditResultListener != null && this.editGrid != null) {
                    this.onGridEditResultListener.onGridDeleted(this.editGrid)
                    }
                }
                }
        }
    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        setTitle(R.string.new_grid_dialog_title)
        setContentView(R.layout.grid_edit_dialog)
        findViewById(R.id.okButton).setOnClickListener(this)
        findViewById(R.id.deleteButton).setOnClickListener(this)
        findViewById(R.id.cancelButton).setOnClickListener(this)
        prepare()
    }

    open fun setOnGridEditResultListener(onGridEditResultListener: OnGridEditResultListener) {
        this.onGridEditResultListener = onGridEditResultListener
    }
}
