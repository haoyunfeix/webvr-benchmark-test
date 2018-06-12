#version 100
attribute vec4 vPos;
attribute vec2 vTexCoord;
varying vec2 texCoord;
void main(){
   texCoord = vec2(vTexCoord.x, 1.0-vTexCoord.y);
   gl_Position = vPos;
}

