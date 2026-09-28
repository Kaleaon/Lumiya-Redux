package com.lumiyaviewer.lumiya.ui.grids

import android.content.Context
import android.content.SharedPreferences
import androidx.preference.PreferenceManager
import android.widget.ArrayAdapter
import java.util.UUID

open class GridList(private val context: Context) {
    private val customGrids: ArrayList<GridInfo> = ArrayList()
    private val predefGrids: ArrayList<GridInfo> = ArrayList()

    open class GridArrayAdapter(context: Context, list: List<GridInfo>) :
        ArrayAdapter<GridInfo>(context, android.R.layout.simple_spinner_item, list) {
        init {
            setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        }
    }

    open class GridInfo {
        var gridName: String
        var gridUUID: UUID?
        var loginURL: String?
        /** Accept certificates that fail verification (self-signed OpenSim grids). Off by default. */
        var allowUntrustedCertificates: Boolean = false
        val predefinedGrid: Boolean

        constructor(sharedPreferences: SharedPreferences, str: String) {
            this.gridName = sharedPreferences.getString(str + "_grid_name", "") ?: ""
            this.loginURL = sharedPreferences.getString(str + "_login_url", "")
            this.predefinedGrid = false
            this.gridUUID = UUID.fromString(sharedPreferences.getString(str + "_grid", ""))
            this.allowUntrustedCertificates = sharedPreferences.getBoolean(str + "_allow_untrusted_certs", false)
        }

        constructor(gridName: String, loginURL: String?, predefinedGrid: Boolean, gridUUID: UUID?) {
            this.gridName = gridName
            this.loginURL = loginURL
            this.predefinedGrid = predefinedGrid
            this.gridUUID = gridUUID
        }

        fun isLindenGrid(): Boolean {
            return this.gridUUID == UUID.fromString("f14c5be7-0849-402c-946a-c80a52e9eccf")
        }

        /** Linden grids (Second Life) always verify certificates. */
        fun getAllowUntrustedCertificates(): Boolean {
            return this.allowUntrustedCertificates && !isLindenGrid()
        }

        fun setAllowUntrustedCertificates(allowUntrustedCertificates: Boolean) {
            this.allowUntrustedCertificates = allowUntrustedCertificates
        }

        fun isPredefinedGrid(): Boolean {
            return this.predefinedGrid
        }

        fun saveToPreferences(editor: SharedPreferences.Editor, str: String) {
            editor.putString(str + "_grid_name", this.gridName)
            editor.putString(str + "_login_url", this.loginURL)
            editor.putString(str + "_grid", this.gridUUID.toString())
            editor.putBoolean(str + "_allow_untrusted_certs", this.allowUntrustedCertificates)
        }

        fun setGridName(gridName: String) {
            this.gridName = gridName
        }

        fun setLoginURL(loginURL: String?) {
            this.loginURL = loginURL
        }

        override fun toString(): String {
            return this.gridName
        }
    }

    init {
        for (str in context.resources.getStringArray(com.lumiyaviewer.lumiya.R.array.grids)) {
            val split = str.split(";")
            this.predefGrids.add(GridInfo(split[0], split[1], true, UUID.fromString(split[2])))
        }
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
        return this.predefGrids[0]
    }

    open fun getGridByName(str: String): GridInfo? {
        for (gridInfo in this.predefGrids) {
            if (gridInfo.gridName == str) {
                return gridInfo
            }
        }
        for (gridInfo2 in this.customGrids) {
            if (gridInfo2.gridName == str) {
                return gridInfo2
            }
        }
        return null
    }

    open fun getGridByUUID(uuid: UUID?): GridInfo? {
        if (uuid == null) return null
        for (gridInfo in this.predefGrids) {
            if (gridInfo.gridUUID == uuid) {
                return gridInfo
            }
        }
        for (gridInfo2 in this.customGrids) {
            if (gridInfo2.gridUUID == uuid) {
                return gridInfo2
            }
        }
        return null
    }

    open fun getGridIndex(uuid: UUID?): Int {
        var i = 0
        for (gridInfo in this.predefGrids) {
            if (gridInfo.gridUUID == uuid) {
                return i
            }
            i++
        }
        for (gridInfo2 in this.customGrids) {
            if (gridInfo2.gridUUID == uuid) {
                return i
            }
            i++
        }
        return 0
    }

    open fun getGridList(list: MutableList<GridInfo>?): MutableList<GridInfo> {
        val result = list ?: ArrayList()
        result.clear()
        result.addAll(this.predefGrids)
        result.addAll(this.customGrids)
        return result
    }

    open fun getGridList(list: MutableList<GridInfo>?, addPlaceholder: Boolean): MutableList<GridInfo> {
        val gridList = getGridList(list)
        if (addPlaceholder) {
            gridList.add(GridInfo("Add another grid", null, false, null))
        }
        return gridList
    }

    open fun loadGrids() {
        this.customGrids.clear()
        val defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(this.context.applicationContext)
        val count = defaultSharedPreferences.getInt("custom_grid_1_count", 0)
        for (j in 0 until count) {
            this.customGrids.add(GridInfo(defaultSharedPreferences, "custom_grid_1_$j"))
        }
    }

    open fun savePreferences() {
        val edit = PreferenceManager.getDefaultSharedPreferences(this.context.applicationContext).edit()
        edit.putInt("custom_grid_1_count", this.customGrids.size)
        for (i in this.customGrids.indices) {
            this.customGrids[i].saveToPreferences(edit, "custom_grid_1_$i")
        }
        edit.apply()
    }
}
