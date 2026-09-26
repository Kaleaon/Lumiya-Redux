package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.ListView
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity

class SettingsSelectionFragment : Fragment(), AdapterView.OnItemClickListener {

    private inner class SettingPagesAdapter(context: Context) :
        ArrayAdapter<SettingsPage>(context, android.R.layout.simple_list_item_1, SettingsPage.values()) {

        override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
            val view = super.getView(position, convertView, parent)
            val item = getItem(position)
            if (view is TextView && item != null) {
                view.setText(item.getPageTitle())
            }
            return view
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        val root = inflater.inflate(com.lumiyaviewer.lumiya.R.layout.settings_page_selector, container, false)
        val listView = root.findViewById<ListView>(com.lumiyaviewer.lumiya.R.id.settings_page_list)
        listView.adapter = SettingPagesAdapter(requireContext())
        listView.onItemClickListener = this
        return root
    }

    override fun onItemClick(adapterView: AdapterView<*>, view: View, position: Int, id: Long) {
        val values = SettingsPage.values()
        if (position < 0 || position >= values.size) {
            return
        }
        DetailsActivity.showEmbeddedDetails(
            activity,
            SettingsFragment::class.java,
            SettingsFragment.makeSelection(values[position].getPageResourceId())
        )
    }
}
