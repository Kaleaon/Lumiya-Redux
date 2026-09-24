package com.lumiyaviewer.lumiya.slproto.objects;

public class UnsupportedObjectTypeException extends Exception {
    public UnsupportedObjectTypeException(byte b) {
        super(String.format("Unsupported object type: 0x%x", Byte.valueOf(b)));
    }
}
