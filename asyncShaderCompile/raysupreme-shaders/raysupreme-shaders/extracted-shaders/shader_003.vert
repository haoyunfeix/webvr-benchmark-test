#version 100

attribute vec2 vPos;
attribute vec2 vTexCoord;

varying vec2 texCoord;

void main() {
   texCoord = vTexCoord;
   texCoord.y = 1.0 - vTexCoord.y;
   gl_Position = vec4(vPos, 0, 1);}
