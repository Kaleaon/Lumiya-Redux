package com.lumiyaviewer.lumiya.utils

enum class LEDAction(val preferenceValue: String) {
    None("none"),
    Slow("slow"),
    Fast("fast"),
    Always("always");

    companion object {
        @JvmStatic
        fun getByPreferenceString(str: String?): LEDAction {
            for (action in valuesCustom()) {
                if (action.preferenceValue == str) {
                    return action
                }
            }
            return None
        }

        @JvmStatic
        fun valuesCustom(): Array<LEDAction> {
            return values()
        }
    }
}
