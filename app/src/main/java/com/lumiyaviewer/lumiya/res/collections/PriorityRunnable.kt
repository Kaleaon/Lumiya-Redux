package com.lumiyaviewer.lumiya.res.collections

import com.lumiyaviewer.lumiya.utils.HasPriority

abstract class PriorityRunnable(final override val priority: Int) : Runnable, HasPriority
