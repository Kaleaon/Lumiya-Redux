package com.lumiyaviewer.lumiya.slproto.inventory

import androidx.core.os.EnvironmentCompat
import java.util.HashMap
import java.util.Map

enum class SLInventoryType {
    IT_TEXTURE(0, "texture", "Texture"),
    IT_SOUND(1, "sound", "Sound"),
    IT_CALLINGCARD(2, "callcard", "Calling card"),
    IT_LANDMARK(3, "landmark", "Landmark"),
    IT_OBJECT(6, "object", "Object"),
    IT_NOTECARD(7, "notecard", "Note card"),
    IT_CATEGORY(8, "category", "Folder"),
    IT_ROOT_CATEGORY(9, "root", "Root folder"),
    IT_LSL(10, "script", "Script"),
    IT_TRASH(14, "trash", "Trash"),
    IT_SNAPSHOT(15, "snapshot", "Snapshot"),
    IT_ATTACHMENT(17, "attach", "Attachment"),
    IT_WEARABLE(18, "wearable", "Wearable"),
    IT_ANIMATION(19, "animation", "Animation"),
    IT_GESTURE(20, "gesture", "Gesture"),
    IT_MESH(22, "mesh", "Mesh"),
    IT_WIDGET(23, "widget", "Widget"),
    IT_UNKNOWN(-1, EnvironmentCompat.MEDIA_UNKNOWN, "Unknown")

    @JvmStatic private var tagMap: MutableMap<String, SLInventoryType> = HashMap(valuesCustom().length * 2)
    private var readableName: String = ""
    private var stringCode: String = ""
    private var typeCode: Int = 0
    init {
        for (sLInventoryType in valuesCustom()) {
            tagMap.put(sLInventoryType.stringCode, sLInventoryType)
        }
    }

    constructor(typeCode: Int, stringCode: String, readableName: String) {
        this.typeCode = typeCode
        this.stringCode = stringCode
        this.readableName = readableName
    }

    fun getByString(str: String): SLInventoryType {
        var inventoryType: SLInventoryType = tagMap.get(str)
        var inventoryType: return = = if (null) IT_UNKNOWN else inventoryType
    }

    fun getByType(i: Int): SLInventoryType {
        for (inventoryType in valuesCustom()) {
            if (inventoryType.typeCode == i) {
        return inventoryType
            }
        }
        return IT_UNKNOWN
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    fun valuesCustom(): Array<SLInventoryType> {
        return values()
    }

    fun getReadableName(): String {
        return this.readableName
    }

    fun getStringCode(): String {
        return this.stringCode
    }

    fun getTypeCode(): Int {
        return this.typeCode
    }
}
