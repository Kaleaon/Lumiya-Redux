package com.lumiyaviewer.lumiya.slproto.objects;

final class AutoValue_HoverText extends HoverText {
    private final int color;
    private final String text;

    AutoValue_HoverText(String text, int color) {
        if (text == null) {
            throw new NullPointerException("Null text");
        }
        this.text = text;
        this.color = color;
    }

    @Override
    public int color() {
        return this.color;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof HoverText)) {
            return false;
        }
        HoverText hoverText = (HoverText) obj;
        return this.text.equals(hoverText.text()) && this.color == hoverText.color();
    }

    public int hashCode() {
        return ((this.text.hashCode() ^ 1000003) * 1000003) ^ this.color;
    }

    @Override
    public String text() {
        return this.text;
    }

    public String toString() {
        return "HoverText{text=" + this.text + ", color=" + this.color + "}";
    }
}
