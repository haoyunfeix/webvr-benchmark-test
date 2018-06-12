#version 100

attribute vec4 drawPosition;
attribute vec4 drawColor;
uniform mat4 pM;
varying vec4 v_Color;

void main() {
  gl_Position =  pM * drawPosition;
  v_Color = drawColor;
}

