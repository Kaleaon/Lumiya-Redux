package com.lumiyaviewer.lumiya.slproto.users.manager

enum class ChatterListType { FriendsOnline, Friends, Active, Groups, Nearby;
    companion object { @JvmStatic fun valuesCustom(): Array<ChatterListType> = values() }
}
