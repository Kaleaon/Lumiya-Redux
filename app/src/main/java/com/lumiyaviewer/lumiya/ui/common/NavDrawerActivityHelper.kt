package com.lumiyaviewer.lumiya.ui.common

import android.app.Activity
import android.content.res.Configuration
import androidx.drawerlayout.widget.DrawerLayout
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AppCompatActivity
import android.view.MenuItem
import android.view.View
import android.widget.AdapterView
import android.widget.ListView
import com.lumiyaviewer.lumiya.R

open class NavDrawerActivityHelper : AdapterView.OnItemClickListener {
    private val drawerAdapter: NavDrawerAdapter?
    private val drawerLayout: DrawerLayout?
    private val drawerToggle: DrawerToggle?

    private class DrawerToggle(activity: Activity, drawerLayout: DrawerLayout, i: Int, i2: Int) :
        ActionBarDrawerToggle(activity, drawerLayout, i, i2)

    constructor(activity: Activity) {
        val drawerLayout = activity.findViewById<DrawerLayout>(R.id.drawer_layout)
        this.drawerLayout = drawerLayout
        if (drawerLayout == null) {
            this.drawerToggle = null
            this.drawerAdapter = null
            return
        }
        val drawerToggle = DrawerToggle(activity, drawerLayout, R.string.open_menu, R.string.close_menu)
        this.drawerToggle = drawerToggle
        drawerLayout.setDrawerListener(drawerToggle)
        val listView = drawerLayout.findViewById<ListView>(R.id.left_drawer)
        if (listView != null) {
            this.drawerAdapter = NavDrawerAdapter(activity)
            listView.adapter = this.drawerAdapter
            listView.onItemClickListener = this
        } else {
            this.drawerAdapter = null
        }
        if (activity !is AppCompatActivity) {
            return
        }
        val supportActionBar = activity.supportActionBar ?: return
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
        if (this.drawerToggle != null) {
            this.drawerToggle.onConfigurationChanged(configuration)
        }
    }

    override fun onItemClick(adapterView: AdapterView<*>, view: View, i: Int, j: Long) {
        if (this.drawerLayout != null) {
            this.drawerLayout.closeDrawers()
        }
        if (this.drawerAdapter != null) {
            this.drawerAdapter.onItemClick(adapterView, view, i, j)
        }
    }

    open fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        return this.drawerToggle != null && this.drawerToggle.onOptionsItemSelected(menuItem)
    }

    open fun syncState() {
        if (this.drawerToggle != null) {
            this.drawerToggle.syncState()
        }
    }
}
