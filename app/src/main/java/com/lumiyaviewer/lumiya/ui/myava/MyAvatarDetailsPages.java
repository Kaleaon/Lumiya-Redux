package com.lumiyaviewer.lumiya.ui.myava;

import com.lumiyaviewer.lumiya.R;

/* loaded from: classes.dex */
enum MyAvatarDetailsPages {
    pageProfile(R.string.my_profile_fragment_title),
    pageOutfits(R.string.my_outfits_fragment_title),
    pageBlockList(R.string.block_list_fragment_title),
    pageBalance(-1);

    private final int titleResource;

    MyAvatarDetailsPages(int i) {
        this.titleResource = i;
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static MyAvatarDetailsPages[] valuesCustom() {
        return values();
    }

    public int getTitleResource() {
        return this.titleResource;
    }
}
