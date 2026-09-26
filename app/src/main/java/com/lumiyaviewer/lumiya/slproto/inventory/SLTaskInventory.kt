package com.lumiyaviewer.lumiya.slproto.inventory

import com.google.common.collect.ImmutableList

open class SLTaskInventory {
    @JvmField val entries: ImmutableList<SLInventoryEntry>

    constructor() { entries = ImmutableList.of() }
    constructor(entries: Collection<SLInventoryEntry>) { this.entries = ImmutableList.copyOf(entries) }
}
