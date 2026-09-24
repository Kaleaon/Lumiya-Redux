package com.lumiyaviewer.lumiya.slproto.llsd;

import com.google.common.logging.nano.Vr;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.https.LLSDContentTypeDetector;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBinary;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBoolean;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDate;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDouble;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDURI;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class LLSDStreamingParser {

    public interface LLSDContentHandler {
        LLSDContentHandler onArrayBegin(String str) throws LLSDXMLException;

        void onArrayEnd(String str) throws LLSDXMLException;

        LLSDContentHandler onMapBegin(String str) throws LLSDXMLException;

        void onMapEnd(String str) throws LLSDXMLException, InterruptedException;

        void onPrimitiveValue(String str, LLSDNode lLSDNode) throws LLSDXMLException, LLSDValueTypeException;
    }

    public static class LLSDDefaultContentHandler implements LLSDContentHandler {
        @Override
        public LLSDContentHandler onArrayBegin(String str) throws LLSDXMLException {
            return new LLSDDefaultContentHandler();
        }

        @Override
        public void onArrayEnd(String str) throws LLSDXMLException {
        }

        @Override
        public LLSDContentHandler onMapBegin(String str) throws LLSDXMLException {
            return new LLSDDefaultContentHandler();
        }

        @Override
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
        }

        @Override
        public void onPrimitiveValue(String str, LLSDNode lLSDNode) throws LLSDXMLException, LLSDValueTypeException {
        }
    }

    public static void parseAny(InputStream inputStream, String str, LLSDContentHandler lLSDContentHandler) throws LLSDXMLException {
        try {
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream, 65536);
            switch (LLSDContentTypeDetector.DetectContentType(bufferedInputStream, str)) {
                case llsdBinary:
                    parseBinary(new DataInputStream(bufferedInputStream), lLSDContentHandler);
                    return;
                case llsdXML:
                    parseXML(bufferedInputStream, "UTF-8", lLSDContentHandler);
                    return;
                default:
                    return;
            }
        } catch (IOException e) {
            LLSDXMLException lLSDXMLException = new LLSDXMLException("I/O error");
            lLSDXMLException.initCause(e);
            throw lLSDXMLException;
        }
    }

    public static void parseBinary(DataInputStream dataInputStream, LLSDContentHandler lLSDContentHandler) throws LLSDXMLException {
        try {
            parseBinaryNode(1, null, dataInputStream, lLSDContentHandler);
        } catch (LLSDValueTypeException e) {
            LLSDXMLException lLSDXMLException = new LLSDXMLException("Invalid value type");
            lLSDXMLException.initCause(e);
            throw lLSDXMLException;
        } catch (IOException e2) {
            LLSDXMLException lLSDXMLException2 = new LLSDXMLException("I/O error");
            lLSDXMLException2.initCause(e2);
            throw lLSDXMLException2;
        } catch (InterruptedException e3) {
            LLSDXMLException lLSDXMLException3 = new LLSDXMLException("Interrupted");
            lLSDXMLException3.initCause(e3);
            throw lLSDXMLException3;
        }
    }

    private static void parseBinaryNode(int i, String str, DataInputStream dataInputStream, LLSDContentHandler lLSDContentHandler) throws LLSDXMLException, LLSDValueTypeException, InterruptedException, IOException {
        int i2;
        int i3 = i;
        while (i3 > 0) {
            byte readByte = dataInputStream.readByte();
            switch (readByte) {
                case 10:
                    continue;
                case 33:
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDUndefined());
                    i3--;
                    continue;
                case 48:
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDBoolean(false));
                    i3--;
                    continue;
                case 49:
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDBoolean(true));
                    i3--;
                    continue;
                case 60:
                    break;
                case 91:
                    int readInt = dataInputStream.readInt();
                    LLSDContentHandler onArrayBegin = lLSDContentHandler.onArrayBegin(str);
                    if (onArrayBegin == null) {
                        onArrayBegin = lLSDContentHandler;
                    }
                    parseBinaryNode(readInt, null, dataInputStream, onArrayBegin);
                    if (dataInputStream.readByte() != 93) {
                        throw new LLSDXMLException("Array terminator expected");
                    }
                    onArrayBegin.onMapEnd(str);
                    i3--;
                    continue;
                case 98:
                    byte[] bArr = new byte[dataInputStream.readInt()];
                    dataInputStream.readFully(bArr);
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDBinary(bArr));
                    i3--;
                    continue;
                case 100:
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDDate(new Date(Math.round(dataInputStream.readDouble() * 1000.0d))));
                    i3--;
                    continue;
                case 105:
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDInt(dataInputStream.readInt()));
                    i3--;
                    continue;
                case 108:
                    int readInt2 = dataInputStream.readInt();
                    if (readInt2 == 0) {
                        lLSDContentHandler.onPrimitiveValue(str, new LLSDURI(""));
                    } else {
                        byte[] bArr2 = new byte[readInt2];
                        dataInputStream.readFully(bArr2);
                        lLSDContentHandler.onPrimitiveValue(str, new LLSDURI(SLMessage.stringFromVariableUTF(bArr2)));
                    }
                    i3--;
                    continue;
                case 114:
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDDouble(dataInputStream.readDouble()));
                    i3--;
                    continue;
                case 115:
                    int readInt3 = dataInputStream.readInt();
                    if (readInt3 == 0) {
                        lLSDContentHandler.onPrimitiveValue(str, new LLSDString(""));
                    } else {
                        byte[] bArr3 = new byte[readInt3];
                        dataInputStream.readFully(bArr3);
                        lLSDContentHandler.onPrimitiveValue(str, new LLSDString(SLMessage.stringFromVariableUTF(bArr3)));
                    }
                    i3--;
                    continue;
                case 117:
                    lLSDContentHandler.onPrimitiveValue(str, new LLSDUUID(new UUID(dataInputStream.readLong(), dataInputStream.readLong())));
                    i3--;
                    continue;
                case Vr.VREvent.VrCore.ErrorCode.CONTROLLER_GATT_CHARACTERISTIC_NOT_FOUND /* 123 */:
                    int readInt4 = dataInputStream.readInt();
                    LLSDContentHandler onMapBegin = lLSDContentHandler.onMapBegin(str);
                    if (onMapBegin == null) {
                        onMapBegin = lLSDContentHandler;
                    }
                    for (int i4 = 0; i4 < readInt4; i4++) {
                        if (dataInputStream.readByte() != 107) {
                            throw new LLSDXMLException("Map key expected");
                        }
                        byte[] bArr4 = new byte[dataInputStream.readInt()];
                        dataInputStream.readFully(bArr4);
                        parseBinaryNode(1, SLMessage.stringFromVariableUTF(bArr4), dataInputStream, onMapBegin);
                    }
                    if (dataInputStream.readByte() != 125) {
                        throw new LLSDXMLException("Map terminator expected");
                    }
                    onMapBegin.onMapEnd(str);
                    i3--;
                    continue;
                default:
                    throw new LLSDXMLException("Unknown LLSD element 0x" + Integer.toHexString(readByte));
            }
            while (dataInputStream.readByte() != 62) {
            }

        }
    }

    public static void parseXML(InputStream inputStream, String str, LLSDContentHandler lLSDContentHandler) throws LLSDXMLException {
        try {
            XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
            newPullParser.setInput(inputStream, str);
            newPullParser.nextTag();
            newPullParser.require(2, null, "llsd");
            newPullParser.nextTag();
            parseXMLNode(null, newPullParser, lLSDContentHandler);
            newPullParser.require(3, null, "llsd");
        } catch (LLSDValueTypeException e) {
            e.printStackTrace();
            LLSDXMLException lLSDXMLException = new LLSDXMLException("Malformed XML");
            lLSDXMLException.initCause(e);
            throw lLSDXMLException;
        } catch (IOException e2) {
            throw new LLSDXMLException("Input stream error");
        } catch (InterruptedException e3) {
            e3.printStackTrace();
            LLSDXMLException lLSDXMLException2 = new LLSDXMLException("Interrupted");
            lLSDXMLException2.initCause(e3);
            throw lLSDXMLException2;
        } catch (XmlPullParserException e4) {
            Debug.Log("XmlPullParserException: " + e4.getMessage());
            e4.printStackTrace();
            LLSDXMLException lLSDXMLException3 = new LLSDXMLException("Malformed XML");
            lLSDXMLException3.initCause(e4);
            throw lLSDXMLException3;
        }
    }

    private static void parseXMLNode(String str, XmlPullParser xmlPullParser, LLSDContentHandler lLSDContentHandler) throws LLSDXMLException, XmlPullParserException, IOException, LLSDValueTypeException, InterruptedException {
        String name = xmlPullParser.getName();
        LLSDNodeType byTag = LLSDNodeType.byTag(name);
        if (byTag == null) {
            throw new LLSDXMLException("Unknown tag: " + name);
        }
        switch (byTag) {
            case llsdArray:
                LLSDContentHandler onArrayBegin = lLSDContentHandler.onArrayBegin(str);
                xmlPullParser.nextTag();
                if (onArrayBegin != null) {
                    lLSDContentHandler = onArrayBegin;
                }
                while (xmlPullParser.getEventType() != 3) {
                    parseXMLNode(null, xmlPullParser, lLSDContentHandler);
                }
                lLSDContentHandler.onArrayEnd(str);
                xmlPullParser.nextTag();
                return;
            case llsdBinary:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDBinary(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdBoolean:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDBoolean(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdDate:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDDate(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdDouble:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDDouble(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdInteger:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDInt(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdKey:
                throw new LLSDXMLException("Unexpected tag: " + name);
            case llsdMap:
                LLSDContentHandler onMapBegin = lLSDContentHandler.onMapBegin(str);
                xmlPullParser.nextTag();
                if (onMapBegin != null) {
                    lLSDContentHandler = onMapBegin;
                }
                while (xmlPullParser.getEventType() != 3) {
                    String name2 = xmlPullParser.getName();
                    if (!name2.equalsIgnoreCase("key")) {
                        throw new LLSDXMLException("Unexpected tag: " + name2);
                    }
                    String nextText = xmlPullParser.nextText();
                    xmlPullParser.nextTag();
                    parseXMLNode(nextText, xmlPullParser, lLSDContentHandler);
                }
                lLSDContentHandler.onMapEnd(str);
                xmlPullParser.nextTag();
                return;
            case llsdRoot:
                throw new LLSDXMLException("Unexpected tag: " + name);
            case llsdString:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDString(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdURI:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDURI(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdUUID:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDUUID(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdUndef:
                lLSDContentHandler.onPrimitiveValue(str, new LLSDUndefined());
                xmlPullParser.nextTag();
                return;
            default:
                return;
        }
    }
}
