package com.lumiyaviewer.lumiya.ui.myava

import com.lumiyaviewer.lumiya.R

internal enum class MyAvatarDetailsPages(private val titleResource: Int) {
    pageProfile(R.string.my_profile_fragment_title),
    pageOutfits(R.string.my_outfits_fragment_title),
    pageBlockList(R.string.block_list_fragment_title),
    pageBalance(-1);

    fun getTitleResource(): Int = titleResource
}
