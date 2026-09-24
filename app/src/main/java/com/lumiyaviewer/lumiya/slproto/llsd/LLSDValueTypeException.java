package com.lumiyaviewer.lumiya.slproto.llsd;

public class LLSDValueTypeException extends LLSDException {
    private static final long serialVersionUID = -1831477542961670453L;

    public LLSDValueTypeException() {
        super("Invalid value type");
    }

    public LLSDValueTypeException(String str, LLSDNode lsdNode) {
        super("Invalid value type: requested " + str + ", actual " + lsdNode.getClass().getSimpleName());
    }
}
