package com.lumiyaviewer.lumiya.slproto.objects

open class UnsupportedObjectTypeException(type: Byte) :
    Exception("Unsupported object type: 0x%x".format(type))
