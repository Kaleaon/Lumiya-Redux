package com.lumiyaviewer.lumiya.slproto.events

class SLInventoryUpdatedEvent(
    private val updatedFolders: Set<Long>?,
    private val updatedItems: Set<Long>?,
    private val needsReload: Boolean
) {
    fun isFolderUpdated(j: Long): Boolean {
        return updatedFolders?.contains(j) ?: false
    }

    fun isItemUpdated(j: Long): Boolean {
        return updatedItems?.contains(j) ?: false
    }

    fun isReloadNeeded(): Boolean {
        return needsReload
    }
}
