package com.lumiyaviewer.lumiya.slproto.events

import java.util.UUID

class SLInventoryNewContentsEvent {
    @JvmField
    var newFolderCount: Int = 0

    @JvmField
    var newItemCount: Int = 0

    @JvmField
    var firstParentUUID: UUID? = null

    @JvmField
    var firstItemName: String? = null

    @JvmField
    var firstIsFolder: Boolean = false

    fun AddItem(firstIsFolder: Boolean, uuid: UUID, firstItemName: String) {
        if (firstIsFolder) {
            newFolderCount++
        } else {
            newItemCount++
        }
        if (firstParentUUID == null) {
            this.firstIsFolder = firstIsFolder
            firstParentUUID = uuid
            this.firstItemName = firstItemName
        } else if (firstIsFolder && !this.firstIsFolder) {
            this.firstIsFolder = firstIsFolder
            firstParentUUID = uuid
            this.firstItemName = firstItemName
        }
    }

    fun isEmpty(): Boolean {
        return newFolderCount == 0 && newItemCount == 0
    }
}
