package com.lumiyaviewer.lumiya.ui.grids

import android.R
import android.content.Context
import android.content.SharedPreferences
import androidx.preference.PreferenceManager
import android.widget.ArrayAdapter
import java.util.ArrayList
import java.util.Iterator
import java.util.List
import java.util.UUID

open class GridList {
    private Context context
    private ArrayList<GridInfo> customGrids
    private ArrayList<GridInfo> predefGrids = new ArrayList<>()

    open class GridArrayAdapter : ArrayAdapter<GridInfo>() {
        constructor(context: Context, list: List<GridInfo>) {
            super(context, R.layout.simple_spinner_item, list)
            setDropDownViewResource(R.layout.simple_spinner_dropdown_item)
        }
    }

    open class GridInfo {
        private String GridName
        private UUID GridUUID
        private String LoginURL
        /** Accept certificates that fail verification (self-signed OpenSim grids). Off by default. */
        private boolean allowUntrustedCertificates
        private boolean predefinedGrid

        constructor(sharedPreferences: SharedPreferences, str: String) {
            this.GridName = sharedPreferences.getString(str + "_grid_name", "")
            this.LoginURL = sharedPreferences.getString(str + "_login_url", "")
            this.predefinedGrid = false
            this.GridUUID = UUID.fromString(sharedPreferences.getString(str + "_grid", ""))
            this.allowUntrustedCertificates = sharedPreferences.getBoolean(str + "_allow_untrusted_certs", false)
        }

        constructor(str: String, str2: String, predefinedGrid: Boolean, uuid: UUID) {
            this.GridName = str
            this.LoginURL = str2
            this.predefinedGrid = predefinedGrid
            this.GridUUID = uuid
        }

        open fun getGridName(): String {
            return this.GridName
        }

        open fun getGridUUID(): UUID {
            return this.GridUUID
        }

        open fun getLoginURL(): String {
            return this.LoginURL
        }

        open fun isLindenGrid(): Boolean {
            return this.GridUUID == (UUID.fromString("f14c5be7-0849-402c-946a-c80a52e9eccf"))
        }

        /** Linden grids (Second Life) always verify certificates. */
        open fun getAllowUntrustedCertificates(): Boolean {
            return this.allowUntrustedCertificates && !isLindenGrid()
        }

        open fun setAllowUntrustedCertificates(allowUntrustedCertificates: Boolean) {
            this.allowUntrustedCertificates = allowUntrustedCertificates
        }

        open fun isPredefinedGrid(): Boolean {
            return this.predefinedGrid
        }

        open fun saveToPreferences(editor: SharedPreferences.Editor, str: String) {
            editor.putString(str + "_grid_name", this.GridName)
            editor.putString(str + "_login_url", this.LoginURL)
            editor.putString(str + "_grid", this.GridUUID.toString())
            editor.putBoolean(str + "_allow_untrusted_certs", this.allowUntrustedCertificates)
        }

        open fun setGridName(gridName: String) {
            this.GridName = gridName
        }

        open fun setLoginURL(loginURL: String) {
            this.LoginURL = loginURL
        }

        open fun toString(): String {
            return this.GridName
        }
    }

    constructor(context: Context) {
        this.context = context
        for (str in context.getResources().getStringArray(com.lumiyaviewer.lumiya.R.array.grids)) {
            String[] split = str.split(";")
            this.predefGrids.add(GridInfo(split[0], split[1], true, UUID.fromString(split[2])))
        }
        this.customGrids = new ArrayList<>()
        loadGrids()
    }

    open fun addNewGrid(gridInfo: GridInfo) {
        this.customGrids.add(gridInfo)
        savePreferences()
    }

    open fun deleteGrid(gridInfo: GridInfo) {
        this.customGrids.remove(gridInfo)
        savePreferences()
    }

    open fun getDefaultGrid(): GridInfo {
        return this.predefGrids.get(0)
    }

    open fun getGridByName(str: String): GridInfo {
        internal fun for(this.predefGrids: GridInfo gridInfo :):  {
            if (gridInfo.getGridName() == (str)) {
                return gridInfo
            }
        }
        internal fun for(this.customGrids: GridInfo gridInfo2 :):  {
            if (gridInfo2.getGridName() == (str)) {
                return gridInfo2
            }
        }
        return null
    }

    open fun getGridByUUID(uuid: UUID): GridInfo {
        internal fun for(this.predefGrids: GridInfo gridInfo :):  {
            if (gridInfo.getGridUUID() == (uuid)) {
                return gridInfo
            }
        }
        internal fun for(this.customGrids: GridInfo gridInfo2 :):  {
            if (gridInfo2.getGridUUID() == (uuid)) {
                return gridInfo2
            }
        }
        return null
    }

    open fun getGridIndex(uuid: UUID): Int {
        Iterator<?> it = this.predefGrids.iterator()
        int i = 0
        while (it.hasNext()) {
            if (((GridInfo) it.next()).getGridUUID() == (uuid)) {
                return i
            }
            i++
        }
        Iterator<?> iterator = this.customGrids.iterator()
        while (iterator.hasNext()) {
            if (((GridInfo) iterator.next()).getGridUUID() == (uuid)) {
                return i
            }
            i++
        }
        return 0
    }

    open fun getGridList(list: List<GridInfo>): List<GridInfo> {
        internal fun if(null: list ==):  {
            list = new ArrayList<>()
        }
        list.clear()
        list.addAll(this.predefGrids)
        list.addAll(this.customGrids)
        return list
    }

    open fun getGridList(list: List<GridInfo>, z: Boolean): List<GridInfo> {
        List<GridInfo> gridList = getGridList(list)
        internal fun if(z):  {
            gridList.add(GridInfo("Add another grid", null, false, null))
        }
        return gridList
    }

    open fun loadGrids() {
        this.customGrids.clear()
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(this.context.getApplicationContext())
        int i = defaultSharedPreferences.getInt("custom_grid_1_count", 0)
        internal fun for(j++: int j = 0; j < i;):  {
            this.customGrids.add(GridInfo(defaultSharedPreferences, "custom_grid_1_" + j))
        }
    }

    open fun savePreferences() {
        SharedPreferences.Editor edit = PreferenceManager.getDefaultSharedPreferences(this.context.getApplicationContext()).edit()
        edit.putInt("custom_grid_1_count", this.customGrids.size())
        int i = 0
        internal fun while(true):  {
            int i2 = i
            if (i2 >= this.customGrids.size()) {
                edit.apply()
                return
            } else {
                this.customGrids.get(i2).saveToPreferences(edit, "custom_grid_1_" + i2)
                i = i2 + 1
            }
        }
    }
}
