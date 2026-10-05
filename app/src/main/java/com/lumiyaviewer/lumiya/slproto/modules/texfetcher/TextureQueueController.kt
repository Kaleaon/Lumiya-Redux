package com.lumiyaviewer.lumiya.slproto.modules.texfetcher

/**
 * Controller interface for managing texture download queue execution.
 * Allows pausing and resuming texture fetches on background execution or overlay state transitions.
 */
interface TextureQueueController {
    fun pauseFetching()
    fun resumeFetching()
    val isFetchingPaused: Boolean
}
