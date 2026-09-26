package com.lumiyaviewer.lumiya.render.avatar

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.DrawableObject
import com.lumiyaviewer.lumiya.render.DrawableStore
import com.lumiyaviewer.lumiya.render.MatrixStack
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.TouchHUDEvent
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo
import com.lumiyaviewer.lumiya.render.spatial.DrawEntryList
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry
import com.lumiyaviewer.lumiya.render.spatial.DrawListPrimEntry
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.Collections
import java.util.IdentityHashMap

class DrawableHUD(
    val attachmentPoint: SLAttachmentPoint,
    drawEntryList: DrawEntryList,
    objectInfo: SLObjectInfo,
    private val drawableStore: DrawableStore,
    private val attachedTo: DrawableAvatar
) {
    private val minPos = LLVector3()
    private val maxPos = LLVector3()
    private val hudObjects: MutableSet<DrawableObject> = Collections.newSetFromMap(IdentityHashMap())

    init {
        addObject(drawEntryList, objectInfo, MatrixStack(), true)
    }

    private fun addObject(drawEntryList: DrawEntryList, objectInfo: SLObjectInfo, matrixStack: MatrixStack, isFirst: Boolean) {
        matrixStack.glPushMatrix()
        processObjectExtents(objectInfo, matrixStack, isFirst)
        val drawListEntry = objectInfo.drawListEntry
        drawEntryList.addEntry(drawListEntry)
        if (drawListEntry is DrawListPrimEntry) {
            hudObjects.add(drawListEntry.getDrawableAttachment(drawableStore, attachedTo))
        }
        var firstChild = objectInfo.treeNode.firstChild
        while (firstChild != null) {
            val dataObject = firstChild.dataObject
            if (dataObject != null) {
                addObject(drawEntryList, dataObject, matrixStack, false)
            }
            firstChild = firstChild.nextChild
        }
        matrixStack.glPopMatrix()
    }

    private fun processObjectExtents(objectInfo: SLObjectInfo, matrixStack: MatrixStack, isFirst: Boolean) {
        val objectCoords = objectInfo.objectCoords
        val elementOffset = objectCoords.getElementOffset(0)
        val elementOffset2 = objectCoords.getElementOffset(1)
        val data = objectCoords.data
        matrixStack.glTranslatef(data[elementOffset], data[elementOffset + 1], data[elementOffset + 2])
        matrixStack.glMultMatrixf(objectInfo.rotation.inverseMatrix, 0)

        val floats = floatArrayOf(
            -data[elementOffset2] / 2.0f, -data[elementOffset2 + 1] / 2.0f,
            -data[elementOffset2 + 2] / 2.0f, 1.0f,
            0.0f, 0.0f, 0.0f, 0.0f
        )
        Matrix.multiplyMV(floats, 4, matrixStack.matrixData, matrixStack.matrixDataOffset, floats, 0)

        if (isFirst) {
            minPos.x = floats[4]; minPos.y = floats[5]; minPos.z = floats[6]
            maxPos.x = floats[4]; maxPos.y = floats[5]; maxPos.z = floats[6]
        } else {
            minPos.x = Math.min(minPos.x, floats[4])
            minPos.y = Math.min(minPos.y, floats[5])
            minPos.z = Math.min(minPos.z, floats[6])
            maxPos.x = Math.max(maxPos.x, floats[4])
            maxPos.y = Math.max(maxPos.y, floats[5])
            maxPos.z = Math.max(maxPos.z, floats[6])
        }

        floats[0] = data[elementOffset2] / 2.0f
        floats[1] = data[elementOffset2 + 1] / 2.0f
        floats[2] = data[elementOffset2 + 2] / 2.0f
        floats[3] = 1.0f
        Matrix.multiplyMV(floats, 4, matrixStack.matrixData, matrixStack.matrixDataOffset, floats, 0)
        minPos.x = Math.min(minPos.x, floats[4])
        minPos.y = Math.min(minPos.y, floats[5])
        minPos.z = Math.min(minPos.z, floats[6])
        maxPos.x = Math.max(maxPos.x, floats[4])
        maxPos.y = Math.max(maxPos.y, floats[5])
        maxPos.z = Math.max(maxPos.z, floats[6])
    }

    fun Draw(
        renderContext: RenderContext,
        scale: Float, offsetY: Float, offsetZ: Float,
        touchHUDEvent: TouchHUDEvent?,
        drawHoverText: Boolean
    ): ObjectIntersectInfo? {
        var result: ObjectIntersectInfo? = null
        renderContext.glModelPushMatrix()
        val centerY = (minPos.y + maxPos.y) / 2.0f
        val centerZ = (minPos.z + maxPos.z) / 2.0f
        val maxExtent = Math.max(maxPos.y - minPos.y, maxPos.z - minPos.z)
        if (maxExtent > 0.001f) {
            val scaleFactor = (1.0f / maxExtent) * scale
            renderContext.glModelScalef(1.0f, scaleFactor, scaleFactor)
        }
        renderContext.glModelTranslatef(-minPos.x, -centerY + offsetY, -centerZ + offsetZ)

        for (drawableObject in hudObjects) {
            if (drawHoverText) {
                drawableObject.DrawHoverText(renderContext, true)
            } else {
                drawableObject.Draw(renderContext, 3)
                if (touchHUDEvent != null) {
                    val intersect = drawableObject.PickObject(renderContext, touchHUDEvent.x, touchHUDEvent.y, Float.NEGATIVE_INFINITY)
                    if (intersect != null && (result == null || intersect.pickDepth < result!!.pickDepth)) {
                        result = intersect
                    }
                }
            }
        }

        renderContext.glModelPopMatrix()

        if (touchHUDEvent != null && result != null) {
            Debug.Printf("TouchHUD event: pickDepth %f objID %d", result!!.pickDepth, result!!.objInfo.localID)
            if (result!!.intersectInfo != null) {
                Debug.Printf("TouchHUD event: intersect face %d uv (%f, %f) st (%f, %f)",
                    result!!.intersectInfo.faceID, result!!.intersectInfo.u, result!!.intersectInfo.v,
                    result!!.intersectInfo.s, result!!.intersectInfo.t)
            }
        }
        return result
    }
}
