package com.lumiyaviewer.lumiya.res.text

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Rect

class DrawableTextBitmap internal constructor(params: DrawableTextParams, fontSize: Int) {

    val baselineOffset: Float
    val bitmap: Bitmap

    init {
        val paint = Paint()
        val rect = Rect()
        paint.textSize = fontSize.toFloat()
        paint.isAntiAlias = true
        paint.textAlign = Paint.Align.CENTER

        val lines = params.text().split("\n")

        var maxWidth = 1
        for (line in lines) {
            paint.getTextBounds(line, 0, line.length, rect)
            if (rect.width() > maxWidth) {
                maxWidth = rect.width()
            }
        }

        val lineHeight = paint.descent() - paint.ascent()
        val totalTextHeight = Math.round(lines.size * lineHeight + 1.0f)
        val horizontalPadding = if (params.backgroundColor() != 0) fontSize else 0
        val verticalPadding = if (params.backgroundColor() != 0) fontSize / 2 else 0

        // Round up to power of two, capped
        var texWidth = 1
        while (texWidth < maxWidth + horizontalPadding && texWidth < 512) {
            texWidth = texWidth shl 1
        }
        var texHeight = 1
        while (texHeight < totalTextHeight + verticalPadding && texHeight < 256) {
            texHeight = texHeight shl 1
        }
        val size = Math.max(texWidth, texHeight)

        bitmap = Bitmap.createBitmap(
            size, size,
            if (params.backgroundColor() == 0) Bitmap.Config.ALPHA_8 else Bitmap.Config.ARGB_8888
        )
        val canvas = Canvas(bitmap)

        if (params.backgroundColor() != 0) {
            paint.color = params.backgroundColor()
            val contentWidth = maxWidth + horizontalPadding
            val contentHeight = totalTextHeight + verticalPadding
            canvas.drawRect(
                ((size - contentWidth) / 2).toFloat(),
                ((size - contentHeight) / 2).toFloat(),
                (size - (size - contentWidth) / 2).toFloat(),
                (size - (size - contentHeight) / 2).toFloat(),
                paint
            )
        }

        paint.setARGB(255, 255, 255, 255)
        var y = (size - totalTextHeight) / 2
        for (line in lines) {
            canvas.drawText(line, (size / 2).toFloat(), y - paint.ascent(), paint)
            y = (y + (paint.descent() - paint.ascent())).toInt()
        }

        baselineOffset = (totalTextHeight + lineHeight) / size
    }
}
