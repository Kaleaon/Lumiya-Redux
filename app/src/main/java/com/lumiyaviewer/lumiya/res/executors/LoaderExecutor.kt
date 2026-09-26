package com.lumiyaviewer.lumiya.res.executors

class LoaderExecutor private constructor() : WeakExecutor("ResourceLoader", 1) {

    private object InstanceHolder {
        @JvmField
        val Instance = LoaderExecutor()
    }

    companion object {
        @JvmStatic
        fun getInstance(): LoaderExecutor = InstanceHolder.Instance
    }
}
