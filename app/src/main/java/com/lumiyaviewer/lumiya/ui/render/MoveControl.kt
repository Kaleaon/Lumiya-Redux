package com.lumiyaviewer.lumiya.ui.render

enum class MoveControl { Forward, Backward, Left, Right;
    companion object { @JvmStatic fun valuesCustom(): Array<MoveControl> = values() }
}
