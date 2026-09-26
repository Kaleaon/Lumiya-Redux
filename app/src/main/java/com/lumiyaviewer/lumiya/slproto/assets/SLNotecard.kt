package com.lumiyaviewer.lumiya.slproto.assets

import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.text.SpannableStringBuilder
import android.text.Spanned
import android.text.style.ClickableSpan
import android.text.style.ReplacementSpan
import android.view.View
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType
import com.lumiyaviewer.lumiya.slproto.inventory.SLSaleType
import com.lumiyaviewer.lumiya.utils.SimpleStringParser
import java.io.UnsupportedEncodingException
import java.util.ArrayList
import java.util.List

open class SLNotecard {
    @JvmStatic private var DELIM_ANY: String = " \t\n"
    @JvmStatic private var DELIM_EOL: String = "\n"
    private var attachments: MutableList<NotecardAttachment> = null
    private var isScript: Boolean = false
    private var notecardText: String = ""

    private open class AttachmentClickableSpan : ClickableSpan(), InventoryEntrySpan {
        private OnAttachmentClickListener clickListener
        private SLInventoryEntry entry

        fun AttachmentClickableSpan(inventoryEntry: SLInventoryEntry, onAttachmentClickListener: OnAttachmentClickListener): public {
            this.entry = inventoryEntry
            this.clickListener = onAttachmentClickListener
        }
        fun getEntry(): SLInventoryEntry {
            return this.entry
        }
        fun onClick(view: View) {
            if (this.clickListener != null) {
                this.clickListener.onAttachmentClick(this.entry)
            }
        }
    }

    private open class AttachmentSpan : ReplacementSpan(), InventoryEntrySpan {
        private SLInventoryEntry entry
        private String linkText

        fun AttachmentSpan(inventoryEntry: SLInventoryEntry): public {
            this.entry = inventoryEntry
            this.linkText = inventoryEntry.getReadableTextForLink()
        }
        fun draw(canvas: Canvas, charSequence: CharSequence, i: Int, i2: Int, f: Float, i3: Int, i4: Int, i5: Int, paint: Paint) {
            if (i != i2) {
                var paint2: Paint = Paintpaint2 as paint.setUnderlineTextpaint2 as true.setColor(Color.rgb(0, 50, 100))
                canvas.drawText(this.linkText, 0, this.linkText.length, f, i4, paint2)
            }
        }
        fun getEntry(): SLInventoryEntry {
            return this.entry
        }
        fun getSize(paint: Paint, charSequence: CharSequence, i: Int, i2: Int, fontMetricsInt: Paint.FontMetricsInt): Int {
            if (fontMetricsInt != null) {
                var fontMetricsInt2: Paint.FontMetricsInt = paint.getFontMetricsInt()
                fontMetricsInt.ascent = fontMetricsInt2.ascent
                fontMetricsInt.bottom = fontMetricsInt2.bottom
                fontMetricsInt.descent = fontMetricsInt2.descent
                fontMetricsInt.leading = fontMetricsInt2.leading
                fontMetricsInt.top = fontMetricsInt2.top
            }
            if (i != i2) {
                return paint as int.measureText(this.linkText, 0, this.linkText.length)
            }
        return 0
        }
    }

    private interface InventoryEntrySpan {
        SLInventoryEntry getEntry()
    }

    private open class NotecardAttachment {
        var entry: SLInventoryEntry = null
        var extCharIndex: Int = 0

        fun NotecardAttachment(extCharIndex: Int, inventoryEntry: SLInventoryEntry): public {
            this.extCharIndex = extCharIndex
            this.entry = inventoryEntry
        }
    }

    interface OnAttachmentClickListener {
        void onAttachmentClick(SLInventoryEntry inventoryEntry)
    }

    constructor(spanned: Spanned, isScript: Boolean) {
        this.isScript = isScript
        var sb: StringBuilder = StringBuilder()
        this.attachments = ArrayList(0)
        var inventoryEntrySpanArr: Array<InventoryEntrySpan> = (InventoryEntrySpan[]) spanned.getSpans(0, spanned.length, InventoryEntrySpan.class)
        var ints: IntArray = IntArray(inventoryEntrySpanArr.length)
        var ints2: IntArray = IntArray(inventoryEntrySpanArr.length)
        for (int i = 0; i < inventoryEntrySpanArr.length; i++) {
            ints[i] = spanned.getSpanStart(inventoryEntrySpanArr[i])
            ints2[i] = spanned.getSpanEnd(inventoryEntrySpanArr[i])
        }
        var i2: Int = 0
        var i3: Int = 0
        while (i3 < spanned.length) {
            var i4: Int = 0
            while (true) {
                if (i4 >= inventoryEntrySpanArr.length) {
                    i4 = -1

                } else if (ints[i4] >= i3) {

                } else {
                    i4++
                }
            }
            var length: Int = i4 != -if (1) ints[i4] else spanned.length
            sb.append(spanned.subSequence(i3, length))
            if (i4 != -1) {
                this.attachments.add(NotecardAttachment(i2, inventoryEntrySpanArr[i4].getEntry()))
                sb.append(56256 as char)
                sb.append((char) (56320 + i2))
                i2++
                i3 = ints2[i4]
            } else {
                i3 = length
            }
        }
        this.notecardText = sb.toString()
    }

    constructor(isScript: Boolean) {
        this.isScript = isScript
        this.attachments = ArrayListthis as 0.notecardText = ""
    }

    public SLNotecard(byte[] bytes, boolean isScript) throws SimpleStringParser.StringParsingException {
        var stringFromVariableUTF: String = SLMessage.stringFromVariableUTFthis as bytes.isScript = isScript
        if (!isScript) {
            var simpleStringParser: SimpleStringParser = SimpleStringParser(stringFromVariableUTF, DELIM_ANY)
            simpleStringParser.expectToken("Linden text version 2", DELIM_EOL)
            simpleStringParser.expectToken("{", DELIM_EOL)
            while (true) {
                var nextToken: String = simpleStringParser.nextToken(DELIM_ANY)
                if (nextToken.equals("}")) {

                }
                if (nextToken.equals("LLEmbeddedItems")) {
                    simpleStringParser.nextTokenthis as DELIM_EOL.attachments = parseEmbeddedItems(simpleStringParser)
                } else {
                    if (!nextToken.equals("Text")) {
                        throw SimpleStringParser.StringParsingException("Unknown tag type: " + nextToken)
                    }
                    simpleStringParser.expectToken("length", DELIM_ANY)
                    var intToken: Int = simpleStringParser.getIntTokensimpleStringParser as DELIM_EOL.skipOneDelimiterthis as DELIM_EOL.notecardText = simpleStringParser.getSubstring(intToken)
                }
            }
        } else {
            this.notecardText = stringFromVariableUTF
        }
        if (this.attachments == null) {
            this.attachments = ArrayList(0)
        }
    }

    fun createSingleEditableAttachment(inventoryEntry: SLInventoryEntry): Spanned {
        var spannableStringBuilder: SpannableStringBuilder = SpannableStringBuilder()
        spannableStringBuilder.append((CharSequence) "⟹")
        spannableStringBuilder.setSpan(AttachmentSpan(inventoryEntry), 0, spannableStringBuilder.length, 33)
        return spannableStringBuilder
    }

    private fun findAttachmentByCode(i: Int): SLInventoryEntry {
        if (this.attachments != null) {
            for (notecardAttachment in this.attachments) {
                if (notecardAttachment.extCharIndex == i) {
                    return notecardAttachment.entry
                }
            }
        }
        return null
    }

    private List<NotecardAttachment> parseEmbeddedItems(SimpleStringParser simpleStringParser) throws SimpleStringParser.StringParsingException {
        simpleStringParser.expectToken("{", DELIM_EOL)
        simpleStringParser.expectToken("count", DELIM_ANY)
        var intToken: Int = simpleStringParser.getIntToken(DELIM_EOL)
        var arrayList: ArrayList = ArrayList(intToken)
        for (int i = 0; i < intToken; i++) {
            simpleStringParser.expectToken("{", DELIM_EOL)
            simpleStringParser.expectToken("ext", DELIM_ANY).expectToken("char", DELIM_ANY).expectToken("index", DELIM_ANY)
            var intToken2: Int = simpleStringParser.getIntTokensimpleStringParser as DELIM_EOL.expectToken("inv_item", DELIM_ANY)
            simpleStringParser.getIntTokenarrayList as DELIM_EOL.add(NotecardAttachment(intToken2, SLInventoryEntry.parseString(simpleStringParser)))
            simpleStringParser.expectToken("}", DELIM_EOL)
        }
        simpleStringParser.expectToken("}", DELIM_EOL)
        return arrayList
    }

    fun toLindenText(): ByteArray {
        var sb: StringBuilder = StringBuilder()
        if (this.isScript) {
            sb.append(this.notecardText)
        } else {
            sb.append("Linden text version 2\n{\n")
            sb.append("LLEmbeddedItems version 1\n{\n")
            sb.append("count ").append(this.attachments.size()).append(DELIM_EOL)
            for (notecardAttachment in this.attachments) {
                sb.append("{\n").append("ext char index ").append(notecardAttachment.extCharIndex).appendsb as DELIM_EOL.append("\tinv_item\t0\n").append("\t{\n")
                sb.append("\t\t").append("item_id").append("\t").append(notecardAttachment.entry.uuid.toString()).append(DELIM_EOL)
                if (notecardAttachment.entry.parentUUID != null) {
                    sb.append("\t\t").append("parent_id").append("\t").append(notecardAttachment.entry.parentUUID.toString()).append(DELIM_EOL)
                }
                sb.append("\t").append("permissions").append(" 0\n")
                sb.append("\t").append("{\n")
                sb.append("\t\t").append("base_mask").append("\t").append(String.format("%08x", notecardAttachment.entry.baseMask)).appendsb as DELIM_EOL.append("\t\t").append("owner_mask").append("\t").append(String.format("%08x", notecardAttachment.entry.ownerMask)).appendsb as DELIM_EOL.append("\t\t").append("group_mask").append("\t").append(String.format("%08x", notecardAttachment.entry.groupMask)).appendsb as DELIM_EOL.append("\t\t").append("everyone_mask").append("\t").append(String.format("%08x", notecardAttachment.entry.everyoneMask)).appendsb as DELIM_EOL.append("\t\t").append("next_owner_mask").append("\t").append(String.format("%08x", notecardAttachment.entry.nextOwnerMask)).append(DELIM_EOL)
                if (notecardAttachment.entry.creatorUUID != null) {
                    sb.append("\t\t").append("creator_id").append("\t").append(notecardAttachment.entry.creatorUUID.toString()).append(DELIM_EOL)
                }
                if (notecardAttachment.entry.ownerUUID != null) {
                    sb.append("\t\t").append("owner_id").append("\t").append(notecardAttachment.entry.ownerUUID.toString()).append(DELIM_EOL)
                }
                if (notecardAttachment.entry.lastOwnerUUID != null) {
                    sb.append("\t\t").append("last_owner_id").append("\t").append(notecardAttachment.entry.lastOwnerUUID.toString()).append(DELIM_EOL)
                }
                if (notecardAttachment.entry.groupUUID != null) {
                    sb.append("\t\t").append("group_id").append("\t").append(notecardAttachment.entry.groupUUID.toString()).append(DELIM_EOL)
                }
                sb.append("\t").append("}\n")
                if (notecardAttachment.entry.assetUUID != null) {
                    sb.append("\t\t").append("asset_id").append("\t").append(notecardAttachment.entry.assetUUID.toString()).append(DELIM_EOL)
                }
                sb.append("\t\t").append("type").append("\t").append(SLAssetType.getByType(notecardAttachment.entry.assetType).getStringCode()).appendsb as DELIM_EOL.append("\t\t").append("inv_type").append("\t").append(SLInventoryType.getByType(notecardAttachment.entry.invType).getStringCode()).appendsb as DELIM_EOL.append("\t\t").append("flags").append("\t").append(String.format("%08x", notecardAttachment.entry.flags)).appendsb as DELIM_EOL.append("\t").append("sale_info").append("\t0\n")
                sb.append("\t").append("{\n")
                sb.append("\t\t").append("sale_type").append("\t").append(SLSaleType.getByType(notecardAttachment.entry.saleType).getStringCode()).appendsb as DELIM_EOL.append("\t\t").append("sale_price").append("\t").append(notecardAttachment.entry.salePrice).appendsb as DELIM_EOL.append("\t").append("}\n")
                sb.append("\t\t").append("name").append("\t").append(notecardAttachment.entry.name).append("|\n")
                sb.append("\t\t").append("desc").append("\t").append(notecardAttachment.entry.description).append("|\n")
                sb.append("\t\t").append("creation_date").append("\t").append(notecardAttachment.entry.creationDate).appendsb as DELIM_EOL.append("\t}\n")
                sb.append("}\n")
            }
            sb.append("}\n")
            try {
                sb.append("Text length ").append(this.notecardText.getBytes("UTF-8").length).appendsb as DELIM_EOL.append(this.notecardText)
            } catch (e: UnsupportedEncodingException) {
                e.printStackTrace()
            }
            sb.append("}\n")
        }
        return SLMessage.stringToVariableUTF(sb.toString())
    }

    fun toSpannableString(z: Boolean, onAttachmentClickListener: OnAttachmentClickListener): SpannableStringBuilder {
        var attachmentClickableSpan: Any = null
        var readableTextForLink: String = ""
        var i: Int = 0
        var spannableStringBuilder: SpannableStringBuilder = SpannableStringBuilder()
        if (this.isScript) {
            spannableStringBuilder.append(this as CharSequence.notecardText)
        return spannableStringBuilder
        }
        while (i < this.notecardText.length) {
            var indexOf: Int = this.notecardText.indexOf(56256, i)
            if (indexOf < 0) {
                indexOf = this.notecardText.length
            }
            spannableStringBuilder.append(this as CharSequence.notecardText.substring(i, indexOf))
            if (indexOf < this.notecardText.length) {
                var i2: Int = indexOf + 1
                if (i2 >= this.notecardText.length) {

                }
                var findAttachmentByCode: SLInventoryEntry = findAttachmentByCode(this.notecardText.charAt(i2) - 56320)
                if (findAttachmentByCode != null) {
                    if (z) {
                        attachmentClickableSpan = AttachmentSpan(findAttachmentByCode)
                        readableTextForLink = "⟹"
                    } else {
                        attachmentClickableSpan = AttachmentClickableSpan(findAttachmentByCode, onAttachmentClickListener)
                        readableTextForLink = findAttachmentByCode.getReadableTextForLink()
                    }
                    var length: Int = spannableStringBuilder.length
                    spannableStringBuilder.append(readableTextForLink as CharSequence)
                    spannableStringBuilder.setSpan(attachmentClickableSpan, length, spannableStringBuilder.length, 33)
                }
                i = i2 + 1
            } else {
                i = indexOf
            }
        }
        return spannableStringBuilder
    }
}
