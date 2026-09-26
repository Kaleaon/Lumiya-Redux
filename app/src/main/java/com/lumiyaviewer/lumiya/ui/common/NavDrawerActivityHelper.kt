package com.lumiyaviewer.lumiya.ui.common

import android.app.Activity
import android.content.res.Configuration
import androidx.drawerlayout.widget.DrawerLayout
import androidx.appcompat.app.ActionBar
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AppCompatActivity
import android.view.MenuItem
import android.view.View
import android.widget.AdapterView
import android.widget.ListAdapter
import android.widget.ListView
import com.lumiyaviewer.lumiya.R

open class NavDrawerActivityHelper : AdapterView.OnItemClickListener {
    private NavDrawerAdapter drawerAdapter
    private DrawerLayout drawerLayout
    private DrawerToggle drawerToggle

    private class DrawerToggle : ActionBarDrawerToggle() {
        constructor(activity: Activity, drawerLayout: DrawerLayout, i: Int, i2: Int) {
            super(activity, drawerLayout, i, i2)
        }
    }

    constructor(activity: Activity) {
        ActionBar supportActionBar
        this.drawerLayout = (DrawerLayout) activity.findViewById(R.id.drawer_layout)
        internal fun if(null: this.drawerLayout ==):  {
            this.drawerToggle = null
            this.drawerAdapter = null
            return
        }
        this.drawerToggle = DrawerToggle(activity, this.drawerLayout, R.string.open_menu, R.string.close_menu)
        this.drawerLayout.setDrawerListener(this.drawerToggle)
        ListView listView = (ListView) this.drawerLayout.findViewById(R.id.left_drawer)
        internal fun if(null: listView !=):  {
            this.drawerAdapter = NavDrawerAdapter(activity)
            listView.setAdapter((ListAdapter) this.drawerAdapter)
            listView.setOnItemClickListener(this)
        } else {
            this.drawerAdapter = null
        }
        if (!(activity is AppCompatActivity) || (supportActionBar = ((AppCompatActivity) activity).getSupportActionBar()) == null) {
            return
        }
        supportActionBar.setDisplayHomeAsUpEnabled(true)
        supportActionBar.setHomeButtonEnabled(true)
    }

    open fun onBackPressed(): Boolean {
        if (this.drawerLayout == null || !this.drawerLayout.isDrawerOpen(this.drawerLayout.findViewById(R.id.left_drawer))) {
            return false
        }
        this.drawerLayout.closeDrawers()
        return true
    }

    open fun onConfigurationChanged(configuration: Configuration) {
        internal fun if(null: this.drawerToggle !=):  {
            this.drawerToggle.onConfigurationChanged(configuration)
        }
    }

    override fun onItemClick(adapterView: AdapterView<?>, view: View, i: Int, j: Long) {
        internal fun if(null: this.drawerLayout !=):  {
            this.drawerLayout.closeDrawers()
        }
        internal fun if(null: this.drawerAdapter !=):  {
            this.drawerAdapter.onItemClick(adapterView, view, i, j)
        }
    }

    open fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        return this.drawerToggle != null && this.drawerToggle.onOptionsItemSelected(menuItem)
    }

    open fun syncState() {
        internal fun if(null: this.drawerToggle !=):  {
            this.drawerToggle.syncState()
        }
    }
}
