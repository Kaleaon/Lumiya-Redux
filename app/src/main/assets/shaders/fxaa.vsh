#version 300 es
in vec4 vPosition;
uniform mat4 uMVPMatrix;

in vec2 vTexCoord;
out mediump vec2 vTexCoordOut;

void main() {
    gl_Position = uMVPMatrix * vPosition;
    vTexCoordOut = vec2 (vTexCoord.x, 1.0 - vTexCoord.y);
}

