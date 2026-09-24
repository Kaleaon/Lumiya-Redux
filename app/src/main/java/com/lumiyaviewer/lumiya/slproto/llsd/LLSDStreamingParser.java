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

        void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException;
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
        public void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException {
        }
    }

    public static void parseAny(InputStream inputStream, String str, LLSDContentHandler lsdContentHandler) throws LLSDXMLException {
        try {
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream, 65536);
            switch (LLSDContentTypeDetector.DetectContentType(bufferedInputStream, str)) {
                case llsdBinary:
                    parseBinary(new DataInputStream(bufferedInputStream), lsdContentHandler);
                    return;
                case llsdXML:
                    parseXML(bufferedInputStream, "UTF-8", lsdContentHandler);
                    return;
                default:
                    return;
            }
        } catch (IOException e) {
            LLSDXMLException llsdxmlException = new LLSDXMLException("I/O error");
            llsdxmlException.initCause(e);
            throw llsdxmlException;
        }
    }

    public static void parseBinary(DataInputStream dataInputStream, LLSDContentHandler lsdContentHandler) throws LLSDXMLException {
        try {
            parseBinaryNode(1, null, dataInputStream, lsdContentHandler);
        } catch (LLSDValueTypeException e) {
            LLSDXMLException llsdxmlException = new LLSDXMLException("Invalid value type");
            llsdxmlException.initCause(e);
            throw llsdxmlException;
        } catch (IOException e2) {
            LLSDXMLException llsdxmlException2 = new LLSDXMLException("I/O error");
            llsdxmlException2.initCause(e2);
            throw llsdxmlException2;
        } catch (InterruptedException e3) {
            LLSDXMLException llsdxmlException3 = new LLSDXMLException("Interrupted");
            llsdxmlException3.initCause(e3);
            throw llsdxmlException3;
        }
    }

    private static void parseBinaryNode(int i, String str, DataInputStream dataInputStream, LLSDContentHandler lsdContentHandler) throws LLSDXMLException, LLSDValueTypeException, InterruptedException, IOException {
        int i2;
        int i3 = i;
        while (i3 > 0) {
            byte readByte = dataInputStream.readByte();
            switch (readByte) {
                case 10:
                    continue;
                case 33:
                    lsdContentHandler.onPrimitiveValue(str, new LLSDUndefined());
                    i3--;
                    continue;
                case 48:
                    lsdContentHandler.onPrimitiveValue(str, new LLSDBoolean(false));
                    i3--;
                    continue;
                case 49:
                    lsdContentHandler.onPrimitiveValue(str, new LLSDBoolean(true));
                    i3--;
                    continue;
                case 60:
                    break;
                case 91:
                    int readInt = dataInputStream.readInt();
                    LLSDContentHandler onArrayBegin = lsdContentHandler.onArrayBegin(str);
                    if (onArrayBegin == null) {
                        onArrayBegin = lsdContentHandler;
                    }
                    parseBinaryNode(readInt, null, dataInputStream, onArrayBegin);
                    if (dataInputStream.readByte() != 93) {
                        throw new LLSDXMLException("Array terminator expected");
                    }
                    onArrayBegin.onMapEnd(str);
                    i3--;
                    continue;
                case 98:
                    byte[] bytes = new byte[dataInputStream.readInt()];
                    dataInputStream.readFully(bytes);
                    lsdContentHandler.onPrimitiveValue(str, new LLSDBinary(bytes));
                    i3--;
                    continue;
                case 100:
                    lsdContentHandler.onPrimitiveValue(str, new LLSDDate(new Date(Math.round(dataInputStream.readDouble() * 1000.0d))));
                    i3--;
                    continue;
                case 105:
                    lsdContentHandler.onPrimitiveValue(str, new LLSDInt(dataInputStream.readInt()));
                    i3--;
                    continue;
                case 108:
                    int readInt2 = dataInputStream.readInt();
                    if (readInt2 == 0) {
                        lsdContentHandler.onPrimitiveValue(str, new LLSDURI(""));
                    } else {
                        byte[] bytes2 = new byte[readInt2];
                        dataInputStream.readFully(bytes2);
                        lsdContentHandler.onPrimitiveValue(str, new LLSDURI(SLMessage.stringFromVariableUTF(bytes2)));
                    }
                    i3--;
                    continue;
                case 114:
                    lsdContentHandler.onPrimitiveValue(str, new LLSDDouble(dataInputStream.readDouble()));
                    i3--;
                    continue;
                case 115:
                    int readInt3 = dataInputStream.readInt();
                    if (readInt3 == 0) {
                        lsdContentHandler.onPrimitiveValue(str, new LLSDString(""));
                    } else {
                        byte[] bytes3 = new byte[readInt3];
                        dataInputStream.readFully(bytes3);
                        lsdContentHandler.onPrimitiveValue(str, new LLSDString(SLMessage.stringFromVariableUTF(bytes3)));
                    }
                    i3--;
                    continue;
                case 117:
                    lsdContentHandler.onPrimitiveValue(str, new LLSDUUID(new UUID(dataInputStream.readLong(), dataInputStream.readLong())));
                    i3--;
                    continue;
                case Vr.VREvent.VrCore.ErrorCode.CONTROLLER_GATT_CHARACTERISTIC_NOT_FOUND /* 123 */:
                    int readInt4 = dataInputStream.readInt();
                    LLSDContentHandler onMapBegin = lsdContentHandler.onMapBegin(str);
                    if (onMapBegin == null) {
                        onMapBegin = lsdContentHandler;
                    }
                    for (int j = 0; j < readInt4; j++) {
                        if (dataInputStream.readByte() != 107) {
                            throw new LLSDXMLException("Map key expected");
                        }
                        byte[] bytes4 = new byte[dataInputStream.readInt()];
                        dataInputStream.readFully(bytes4);
                        parseBinaryNode(1, SLMessage.stringFromVariableUTF(bytes4), dataInputStream, onMapBegin);
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

    public static void parseXML(InputStream inputStream, String str, LLSDContentHandler lsdContentHandler) throws LLSDXMLException {
        try {
            XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
            newPullParser.setInput(inputStream, str);
            newPullParser.nextTag();
            newPullParser.require(2, null, "llsd");
            newPullParser.nextTag();
            parseXMLNode(null, newPullParser, lsdContentHandler);
            newPullParser.require(3, null, "llsd");
        } catch (LLSDValueTypeException e) {
            e.printStackTrace();
            LLSDXMLException llsdxmlException = new LLSDXMLException("Malformed XML");
            llsdxmlException.initCause(e);
            throw llsdxmlException;
        } catch (IOException e2) {
            throw new LLSDXMLException("Input stream error");
        } catch (InterruptedException e3) {
            e3.printStackTrace();
            LLSDXMLException llsdxmlException2 = new LLSDXMLException("Interrupted");
            llsdxmlException2.initCause(e3);
            throw llsdxmlException2;
        } catch (XmlPullParserException e4) {
            Debug.Log("XmlPullParserException: " + e4.getMessage());
            e4.printStackTrace();
            LLSDXMLException llsdxmlException3 = new LLSDXMLException("Malformed XML");
            llsdxmlException3.initCause(e4);
            throw llsdxmlException3;
        }
    }

    private static void parseXMLNode(String str, XmlPullParser xmlPullParser, LLSDContentHandler lsdContentHandler) throws LLSDXMLException, XmlPullParserException, IOException, LLSDValueTypeException, InterruptedException {
        String name = xmlPullParser.getName();
        LLSDNodeType byTag = LLSDNodeType.byTag(name);
        if (byTag == null) {
            throw new LLSDXMLException("Unknown tag: " + name);
        }
        switch (byTag) {
            case llsdArray:
                LLSDContentHandler onArrayBegin = lsdContentHandler.onArrayBegin(str);
                xmlPullParser.nextTag();
                if (onArrayBegin != null) {
                    lsdContentHandler = onArrayBegin;
                }
                while (xmlPullParser.getEventType() != 3) {
                    parseXMLNode(null, xmlPullParser, lsdContentHandler);
                }
                lsdContentHandler.onArrayEnd(str);
                xmlPullParser.nextTag();
                return;
            case llsdBinary:
                lsdContentHandler.onPrimitiveValue(str, new LLSDBinary(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdBoolean:
                lsdContentHandler.onPrimitiveValue(str, new LLSDBoolean(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdDate:
                lsdContentHandler.onPrimitiveValue(str, new LLSDDate(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdDouble:
                lsdContentHandler.onPrimitiveValue(str, new LLSDDouble(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdInteger:
                lsdContentHandler.onPrimitiveValue(str, new LLSDInt(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdKey:
                throw new LLSDXMLException("Unexpected tag: " + name);
            case llsdMap:
                LLSDContentHandler onMapBegin = lsdContentHandler.onMapBegin(str);
                xmlPullParser.nextTag();
                if (onMapBegin != null) {
                    lsdContentHandler = onMapBegin;
                }
                while (xmlPullParser.getEventType() != 3) {
                    String name2 = xmlPullParser.getName();
                    if (!name2.equalsIgnoreCase("key")) {
                        throw new LLSDXMLException("Unexpected tag: " + name2);
                    }
                    String nextText = xmlPullParser.nextText();
                    xmlPullParser.nextTag();
                    parseXMLNode(nextText, xmlPullParser, lsdContentHandler);
                }
                lsdContentHandler.onMapEnd(str);
                xmlPullParser.nextTag();
                return;
            case llsdRoot:
                throw new LLSDXMLException("Unexpected tag: " + name);
            case llsdString:
                lsdContentHandler.onPrimitiveValue(str, new LLSDString(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdURI:
                lsdContentHandler.onPrimitiveValue(str, new LLSDURI(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdUUID:
                lsdContentHandler.onPrimitiveValue(str, new LLSDUUID(xmlPullParser.nextText()));
                xmlPullParser.nextTag();
                return;
            case llsdUndef:
                lsdContentHandler.onPrimitiveValue(str, new LLSDUndefined());
                xmlPullParser.nextTag();
                return;
            default:
                return;
        }
    }
}
